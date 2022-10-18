import Foundation
import NoiseBackend
import NoiseSerde

#if arch(x86_64)
let ARCH="x86_64"
#elseif arch(arm64)
let ARCH="arm64"
#endif

// MARK: -Backend
extension Backend {
  static let shared = Backend(
    withZo: Bundle.main.url(forResource: "resources/core-\(ARCH)", withExtension: "zo")!,
    andMod: "main",
    andProc: "main"
  )

  /// Deletes a connection and any related system-level resources (eg. Keychain passwords).
  func deleteConnectionAndSystemResources(_ c: ConnectionDetails) -> Future<String, Void> {
    return deleteConnection(c).andThen { _ in
      if let id = c.passwordId {
        let _ = Keychain.shared.delete(passwordWithId: id)
      }
      return FutureUtil.resolved(with: ())
        .mapError({ _ in preconditionFailure("unreachable") })
    }
  }
}

// MARK: -Broker
extension Broker {
  var address: String {
    get {
      "\(host):\(String(port))"
    }
  }
}

// MARK: -ConnectionDetails
extension ConnectionDetails {
  var bootstrapAddress: String {
    get {
      "\(bootstrapHost):\(bootstrapPort)"
    }
  }
}

// MARK: -GroupPartitionOffset
extension GroupPartitionOffset {
  var lag: Varint {
    highWatermark - offset
  }
}

// MARK: -ResourceConfig
extension ResourceConfig: Identifiable {
  public var id: String {
    get {
      name
    }
  }

  public var nonnullValue: String {
    get {
      value ?? ""
    }
  }
}
