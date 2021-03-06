//
//  ActivityTracker.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 10/18/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
	import RxSwift
	import RxCocoa
#endif

private struct ActivityToken<E> : ObservableConvertibleType, Disposable {
	fileprivate let _source: Observable<E>
	fileprivate let _dispose: Cancelable
	
	init(source: Observable<E>, disposeAction: @escaping () -> ()) {
		_source = source
		_dispose = Disposables.create(with: disposeAction)
	}
	
	func dispose() {
		_dispose.dispose()
	}
	
	func asObservable() -> Observable<E> {
		return _source
	}
}

/**
Enables monitoring of sequence computation.

If there is at least one sequence computation in progress, `true` will be sent.
When all activities complete `false` will be sent.
*/
open class ActivityTracker : SharedSequenceConvertibleType {

	public typealias Element = Bool
	public typealias SharingStrategy = DriverSharingStrategy
	
	fileprivate let _lock = NSRecursiveLock()
	fileprivate let _relay = BehaviorRelay(value: 0)
	fileprivate let _loading: SharedSequence<SharingStrategy, Bool>
	
	public init() {
		_loading = _relay.asDriver()
			.map { $0 > 0 }
			.distinctUntilChanged()
	}
	
	fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.Element> {
		return Observable.using({ () -> ActivityToken<O.Element> in
			self.increment()
			return ActivityToken(source: source.asObservable(), disposeAction: self.decrement)
		}) { t in
			return t.asObservable()
		}
	}
	
	fileprivate func increment() {
		_lock.lock()
		_relay.accept(_relay.value + 1)
		_lock.unlock()
	}
	
	fileprivate func decrement() {
		_lock.lock()
		_relay.accept(_relay.value - 1)
		_lock.unlock()
	}
	
	open func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
		return _loading
	}
}

extension ObservableConvertibleType {
	public func trackActivity(_ activityIndicator: ActivityTracker) -> Observable<Element> {
		return activityIndicator.trackActivityOfObservable(self)
	}
}
