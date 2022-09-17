// This file was automatically generated by noise-serde-lib.
import Foundation
import NoiseBackend
import NoiseSerde

public struct ConnectionDetails: Readable, Writable {
  public let id: UVarint?
  public let name: String
  public let bootstrapHost: String
  public let bootstrapPort: UVarint
  public let username: String?
  public let password: String?
  public let useSsl: Bool

  public init(
    id: UVarint?,
    name: String,
    bootstrapHost: String,
    bootstrapPort: UVarint,
    username: String?,
    password: String?,
    useSsl: Bool
  ) {
    self.id = id
    self.name = name
    self.bootstrapHost = bootstrapHost
    self.bootstrapPort = bootstrapPort
    self.username = username
    self.password = password
    self.useSsl = useSsl
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> ConnectionDetails {
    return ConnectionDetails(
      id: UVarint?.read(from: inp, using: &buf),
      name: String.read(from: inp, using: &buf),
      bootstrapHost: String.read(from: inp, using: &buf),
      bootstrapPort: UVarint.read(from: inp, using: &buf),
      username: String?.read(from: inp, using: &buf),
      password: String?.read(from: inp, using: &buf),
      useSsl: Bool.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    id.write(to: out)
    name.write(to: out)
    bootstrapHost.write(to: out)
    bootstrapPort.write(to: out)
    username.write(to: out)
    password.write(to: out)
    useSsl.write(to: out)
  }
}

public class Backend {
  let impl: NoiseBackend.Backend!

  init(withZo zo: URL, andMod mod: String, andProc proc: String) {
    impl = NoiseBackend.Backend(withZo: zo, andMod: mod, andProc: proc)
  }

  public func getConnections() -> Future<[ConnectionDetails]> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0000).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> [ConnectionDetails] in
        return [ConnectionDetails].read(from: inp, using: &buf)
      }
    )
  }

  public func ping() -> Future<String> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0001).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> String in
        return String.read(from: inp, using: &buf)
      }
    )
  }

  public func saveConnection(_ c: ConnectionDetails) -> Future<UVarint> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0002).write(to: out)
        c.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> UVarint in
        return UVarint.read(from: inp, using: &buf)
      }
    )
  }
}
