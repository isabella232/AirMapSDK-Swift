//
//  AirMapVerifySMSCodeViewController.swift
//  AirMapSDK
//
//  Created by Adolfo Martinelli on 8/8/16.
//  Copyright © 2016 AirMap, Inc. All rights reserved.
//

import RxSwift
import RxCocoa

class AirMapVerifySMSCodeViewController: UITableViewController {
	
	@IBOutlet var submitButton: UIButton!
	@IBOutlet weak var smsCode: UITextField!
	@IBOutlet weak var smsTextField: UITextField!
	
	private let disposeBag = DisposeBag()
	private let activityIndicator = ActivityIndicator()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupBindings()
		smsCode.becomeFirstResponder()
	}
	
	override func canBecomeFirstResponder() -> Bool {
		
		return true
	}
	
	override var inputAccessoryView: UIView? {
		
		return submitButton
	}
	
	private func setupBindings() {
		
		smsTextField.rx_text.asObservable()
			.map { $0.characters.count == Config.AirMapApi.smsCodeLength }
			.bindTo(submitButton.rx_enabled)
			.addDisposableTo(disposeBag)
		
		activityIndicator.asObservable()
			.throttle(0.25, scheduler: MainScheduler.instance)
			.distinctUntilChanged()
			.bindTo(rx_loading)
			.addDisposableTo(disposeBag)
	}
	
	@IBAction func submitSMSCode() {
		
		smsCode.resignFirstResponder()
		
		AirMap.rx_verifySMS(smsTextField.text!)
			.trackActivity(activityIndicator)
			.map { $0.verified }
			.subscribeNext(unowned(self, AirMapVerifySMSCodeViewController.didVerifyPhoneNumber))
			.addDisposableTo(disposeBag)
	}
	
	private func didVerifyPhoneNumber(verified: Bool) {
		
		if verified {
			let nav = navigationController as! AirMapPhoneVerificationNavController
			nav.phoneVerificationDelegate?.phoneVerificationDidVerifyPhoneNumber()
		} else {
			//TODO: Handle error
			navigationController?.popViewControllerAnimated(true)
		}
	}
	
}
