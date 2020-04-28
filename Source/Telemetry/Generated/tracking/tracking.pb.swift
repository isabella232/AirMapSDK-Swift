// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tracking/tracking.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2018-2019 AirMap, Inc.  All rights reserved.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// ConnectProviderParameters models configuration parameters for provider streams.
public struct Tracking_ConnectProviderParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The ID of the provider.
  public var id: Tracking_Identity.ProviderId {
    get {return _id ?? Tracking_Identity.ProviderId()}
    set {_id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  public var hasID: Bool {return self._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  public mutating func clearID() {self._id = nil}

  /// The expected duration between updates. Used for monitoring and alerting
  /// purposes. If null, the pipeline chooses a default value or tries to
  /// determine a reasonable value based on historic data.
  public var expectedDurationBetweenUpdates: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _expectedDurationBetweenUpdates ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_expectedDurationBetweenUpdates = newValue}
  }
  /// Returns true if `expectedDurationBetweenUpdates` has been explicitly set.
  public var hasExpectedDurationBetweenUpdates: Bool {return self._expectedDurationBetweenUpdates != nil}
  /// Clears the value of `expectedDurationBetweenUpdates`. Subsequent reads from it will return its default value.
  public mutating func clearExpectedDurationBetweenUpdates() {self._expectedDurationBetweenUpdates = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _id: Tracking_Identity.ProviderId? = nil
  fileprivate var _expectedDurationBetweenUpdates: SwiftProtobuf.Google_Protobuf_Duration? = nil
}

/// ConnectProcessorParameters models configuration parameters for processor streams
public struct Tracking_ConnectProcessorParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Tracks will be forward-projected at a constant rate.
  public var enableProjection: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Update bundles types used in the exchange of tracks.
public struct Tracking_Update {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// FromProvider wraps messages being sent by a provider to a traffic collector.
  public struct FromProvider {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var details: Tracking_Update.FromProvider.OneOf_Details? = nil

    /// Provider operational status.
    public var status: System_Status {
      get {
        if case .status(let v)? = details {return v}
        return System_Status()
      }
      set {details = .status(newValue)}
    }

    /// Batch of updates from a track provider.
    public var batch: Tracking_Track.Batch {
      get {
        if case .batch(let v)? = details {return v}
        return Tracking_Track.Batch()
      }
      set {details = .batch(newValue)}
    }

    /// Parameters used to customize the stream from the provider. 
    public var params: Tracking_ConnectProviderParameters {
      get {
        if case .params(let v)? = details {return v}
        return Tracking_ConnectProviderParameters()
      }
      set {details = .params(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public enum OneOf_Details: Equatable {
      /// Provider operational status.
      case status(System_Status)
      /// Batch of updates from a track provider.
      case batch(Tracking_Track.Batch)
      /// Parameters used to customize the stream from the provider. 
      case params(Tracking_ConnectProviderParameters)

    #if !swift(>=4.1)
      public static func ==(lhs: Tracking_Update.FromProvider.OneOf_Details, rhs: Tracking_Update.FromProvider.OneOf_Details) -> Bool {
        switch (lhs, rhs) {
        case (.status(let l), .status(let r)): return l == r
        case (.batch(let l), .batch(let r)): return l == r
        case (.params(let l), .params(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}
  }

  /// ToProvider wraps messages being sent from a collector back to a provider.
  public struct ToProvider {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var details: Tracking_Update.ToProvider.OneOf_Details? = nil

    /// Collector operational status.
    public var status: System_Status {
      get {
        if case .status(let v)? = details {return v}
        return System_Status()
      }
      set {details = .status(newValue)}
    }

    /// Acknowledgement of received updates.
    public var ack: System_Ack {
      get {
        if case .ack(let v)? = details {return v}
        return System_Ack()
      }
      set {details = .ack(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public enum OneOf_Details: Equatable {
      /// Collector operational status.
      case status(System_Status)
      /// Acknowledgement of received updates.
      case ack(System_Ack)

    #if !swift(>=4.1)
      public static func ==(lhs: Tracking_Update.ToProvider.OneOf_Details, rhs: Tracking_Update.ToProvider.OneOf_Details) -> Bool {
        switch (lhs, rhs) {
        case (.status(let l), .status(let r)): return l == r
        case (.ack(let l), .ack(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}
  }

  /// ToProcessor wraps messages being sent by a collector to a processor.
  public struct ToProcessor {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var details: Tracking_Update.ToProcessor.OneOf_Details? = nil

    /// Collector operational status.
    public var status: System_Status {
      get {
        if case .status(let v)? = details {return v}
        return System_Status()
      }
      set {details = .status(newValue)}
    }

    /// Batch of updates from a track collector.
    public var batch: Tracking_Track.Batch {
      get {
        if case .batch(let v)? = details {return v}
        return Tracking_Track.Batch()
      }
      set {details = .batch(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public enum OneOf_Details: Equatable {
      /// Collector operational status.
      case status(System_Status)
      /// Batch of updates from a track collector.
      case batch(Tracking_Track.Batch)

    #if !swift(>=4.1)
      public static func ==(lhs: Tracking_Update.ToProcessor.OneOf_Details, rhs: Tracking_Update.ToProcessor.OneOf_Details) -> Bool {
        switch (lhs, rhs) {
        case (.status(let l), .status(let r)): return l == r
        case (.batch(let l), .batch(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}
  }

  public struct FromProcessor {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var details: Tracking_Update.FromProcessor.OneOf_Details? = nil

    /// Processor operational status.
    public var status: System_Status {
      get {
        if case .status(let v)? = details {return v}
        return System_Status()
      }
      set {details = .status(newValue)}
    }

    /// Acknowledgement of received updates.
    public var ack: System_Ack {
      get {
        if case .ack(let v)? = details {return v}
        return System_Ack()
      }
      set {details = .ack(newValue)}
    }

    /// Parameters used to customize the stream to the processor.
    public var params: Tracking_ConnectProcessorParameters {
      get {
        if case .params(let v)? = details {return v}
        return Tracking_ConnectProcessorParameters()
      }
      set {details = .params(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public enum OneOf_Details: Equatable {
      /// Processor operational status.
      case status(System_Status)
      /// Acknowledgement of received updates.
      case ack(System_Ack)
      /// Parameters used to customize the stream to the processor.
      case params(Tracking_ConnectProcessorParameters)

    #if !swift(>=4.1)
      public static func ==(lhs: Tracking_Update.FromProcessor.OneOf_Details, rhs: Tracking_Update.FromProcessor.OneOf_Details) -> Bool {
        switch (lhs, rhs) {
        case (.status(let l), .status(let r)): return l == r
        case (.ack(let l), .ack(let r)): return l == r
        case (.params(let l), .params(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tracking"

extension Tracking_ConnectProviderParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ConnectProviderParameters"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "expected_duration_between_updates"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._id)
      case 2: try decoder.decodeSingularMessageField(value: &self._expectedDurationBetweenUpdates)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._id {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._expectedDurationBetweenUpdates {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_ConnectProviderParameters, rhs: Tracking_ConnectProviderParameters) -> Bool {
    if lhs._id != rhs._id {return false}
    if lhs._expectedDurationBetweenUpdates != rhs._expectedDurationBetweenUpdates {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_ConnectProcessorParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ConnectProcessorParameters"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "enable_projection"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.enableProjection)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.enableProjection != false {
      try visitor.visitSingularBoolField(value: self.enableProjection, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_ConnectProcessorParameters, rhs: Tracking_ConnectProcessorParameters) -> Bool {
    if lhs.enableProjection != rhs.enableProjection {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_Update: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Update"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_Update, rhs: Tracking_Update) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_Update.FromProvider: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Tracking_Update.protoMessageName + ".FromProvider"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "batch"),
    3: .same(proto: "params"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: System_Status?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .status(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .status(v)}
      case 2:
        var v: Tracking_Track.Batch?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .batch(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .batch(v)}
      case 3:
        var v: Tracking_ConnectProviderParameters?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .params(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .params(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.details {
    case .status(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    case .batch(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    case .params(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_Update.FromProvider, rhs: Tracking_Update.FromProvider) -> Bool {
    if lhs.details != rhs.details {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_Update.ToProvider: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Tracking_Update.protoMessageName + ".ToProvider"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "ack"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: System_Status?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .status(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .status(v)}
      case 2:
        var v: System_Ack?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .ack(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .ack(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.details {
    case .status(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    case .ack(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_Update.ToProvider, rhs: Tracking_Update.ToProvider) -> Bool {
    if lhs.details != rhs.details {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_Update.ToProcessor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Tracking_Update.protoMessageName + ".ToProcessor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "batch"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: System_Status?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .status(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .status(v)}
      case 2:
        var v: Tracking_Track.Batch?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .batch(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .batch(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.details {
    case .status(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    case .batch(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_Update.ToProcessor, rhs: Tracking_Update.ToProcessor) -> Bool {
    if lhs.details != rhs.details {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tracking_Update.FromProcessor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Tracking_Update.protoMessageName + ".FromProcessor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "ack"),
    3: .same(proto: "params"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: System_Status?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .status(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .status(v)}
      case 2:
        var v: System_Ack?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .ack(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .ack(v)}
      case 3:
        var v: Tracking_ConnectProcessorParameters?
        if let current = self.details {
          try decoder.handleConflictingOneOf()
          if case .params(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.details = .params(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.details {
    case .status(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    case .ack(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    case .params(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tracking_Update.FromProcessor, rhs: Tracking_Update.FromProcessor) -> Bool {
    if lhs.details != rhs.details {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
