// This file was automatically generated by noise-serde-lib.
import Foundation
import NoiseBackend
import NoiseSerde

public struct Broker: Readable, Writable {
  public let id: UVarint
  public let host: String
  public let port: UVarint
  public let rack: String?
  public let isController: Bool

  public init(
    id: UVarint,
    host: String,
    port: UVarint,
    rack: String?,
    isController: Bool
  ) {
    self.id = id
    self.host = host
    self.port = port
    self.rack = rack
    self.isController = isController
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> Broker {
    return Broker(
      id: UVarint.read(from: inp, using: &buf),
      host: String.read(from: inp, using: &buf),
      port: UVarint.read(from: inp, using: &buf),
      rack: String?.read(from: inp, using: &buf),
      isController: Bool.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    id.write(to: out)
    host.write(to: out)
    port.write(to: out)
    rack.write(to: out)
    isController.write(to: out)
  }
}

public struct ConnectionDetails: Readable, Writable {
  public let id: UVarint?
  public let name: String
  public let bootstrapHost: String
  public let bootstrapPort: UVarint
  public let username: String?
  public let password: String?
  public let passwordId: String?
  public let useSsl: Bool

  public init(
    id: UVarint?,
    name: String,
    bootstrapHost: String,
    bootstrapPort: UVarint,
    username: String?,
    password: String?,
    passwordId: String?,
    useSsl: Bool
  ) {
    self.id = id
    self.name = name
    self.bootstrapHost = bootstrapHost
    self.bootstrapPort = bootstrapPort
    self.username = username
    self.password = password
    self.passwordId = passwordId
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
      passwordId: String?.read(from: inp, using: &buf),
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
    passwordId.write(to: out)
    useSsl.write(to: out)
  }
}

public struct Group: Readable, Writable {
  public let id: String

  public init(
    id: String
  ) {
    self.id = id
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> Group {
    return Group(
      id: String.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    id.write(to: out)
  }
}

public struct GroupOffsets: Readable, Writable {
  public let groupId: String
  public let topics: [GroupTopic]

  public init(
    groupId: String,
    topics: [GroupTopic]
  ) {
    self.groupId = groupId
    self.topics = topics
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> GroupOffsets {
    return GroupOffsets(
      groupId: String.read(from: inp, using: &buf),
      topics: [GroupTopic].read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    groupId.write(to: out)
    topics.write(to: out)
  }
}

public struct GroupPartitionOffset: Readable, Writable {
  public let partitionId: UVarint
  public let highWatermark: Varint
  public let offset: Varint
  public let memberId: String?
  public let clientId: String?
  public let clientHost: String?

  public init(
    partitionId: UVarint,
    highWatermark: Varint,
    offset: Varint,
    memberId: String?,
    clientId: String?,
    clientHost: String?
  ) {
    self.partitionId = partitionId
    self.highWatermark = highWatermark
    self.offset = offset
    self.memberId = memberId
    self.clientId = clientId
    self.clientHost = clientHost
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> GroupPartitionOffset {
    return GroupPartitionOffset(
      partitionId: UVarint.read(from: inp, using: &buf),
      highWatermark: Varint.read(from: inp, using: &buf),
      offset: Varint.read(from: inp, using: &buf),
      memberId: String?.read(from: inp, using: &buf),
      clientId: String?.read(from: inp, using: &buf),
      clientHost: String?.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    partitionId.write(to: out)
    highWatermark.write(to: out)
    offset.write(to: out)
    memberId.write(to: out)
    clientId.write(to: out)
    clientHost.write(to: out)
  }
}

public struct GroupTopic: Readable, Writable {
  public let name: String
  public let partitions: [GroupPartitionOffset]

  public init(
    name: String,
    partitions: [GroupPartitionOffset]
  ) {
    self.name = name
    self.partitions = partitions
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> GroupTopic {
    return GroupTopic(
      name: String.read(from: inp, using: &buf),
      partitions: [GroupPartitionOffset].read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    name.write(to: out)
    partitions.write(to: out)
  }
}

public struct Metadata: Readable, Writable {
  public let brokers: [Broker]
  public let topics: [Topic]
  public let groups: [Group]

  public init(
    brokers: [Broker],
    topics: [Topic],
    groups: [Group]
  ) {
    self.brokers = brokers
    self.topics = topics
    self.groups = groups
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> Metadata {
    return Metadata(
      brokers: [Broker].read(from: inp, using: &buf),
      topics: [Topic].read(from: inp, using: &buf),
      groups: [Group].read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    brokers.write(to: out)
    topics.write(to: out)
    groups.write(to: out)
  }
}

public struct ResourceConfig: Readable, Writable {
  public let name: String
  public let value: String?
  public let isReadOnly: Bool
  public let isDefault: Bool
  public let isSensitive: Bool

  public init(
    name: String,
    value: String?,
    isReadOnly: Bool,
    isDefault: Bool,
    isSensitive: Bool
  ) {
    self.name = name
    self.value = value
    self.isReadOnly = isReadOnly
    self.isDefault = isDefault
    self.isSensitive = isSensitive
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> ResourceConfig {
    return ResourceConfig(
      name: String.read(from: inp, using: &buf),
      value: String?.read(from: inp, using: &buf),
      isReadOnly: Bool.read(from: inp, using: &buf),
      isDefault: Bool.read(from: inp, using: &buf),
      isSensitive: Bool.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    name.write(to: out)
    value.write(to: out)
    isReadOnly.write(to: out)
    isDefault.write(to: out)
    isSensitive.write(to: out)
  }
}

public struct Topic: Readable, Writable {
  public let name: String
  public let partitions: [TopicPartition]
  public let isInternal: Bool

  public init(
    name: String,
    partitions: [TopicPartition],
    isInternal: Bool
  ) {
    self.name = name
    self.partitions = partitions
    self.isInternal = isInternal
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> Topic {
    return Topic(
      name: String.read(from: inp, using: &buf),
      partitions: [TopicPartition].read(from: inp, using: &buf),
      isInternal: Bool.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    name.write(to: out)
    partitions.write(to: out)
    isInternal.write(to: out)
  }
}

public struct TopicOption: Readable, Writable {
  public let key: String
  public let value: String

  public init(
    key: String,
    value: String
  ) {
    self.key = key
    self.value = value
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> TopicOption {
    return TopicOption(
      key: String.read(from: inp, using: &buf),
      value: String.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    key.write(to: out)
    value.write(to: out)
  }
}

public struct TopicPartition: Readable, Writable {
  public let id: UVarint

  public init(
    id: UVarint
  ) {
    self.id = id
  }

  public static func read(from inp: InputPort, using buf: inout Data) -> TopicPartition {
    return TopicPartition(
      id: UVarint.read(from: inp, using: &buf)
    )
  }

  public func write(to out: OutputPort) {
    id.write(to: out)
  }
}

public class Backend {
  let impl: NoiseBackend.Backend!

  init(withZo zo: URL, andMod mod: String, andProc proc: String) {
    impl = NoiseBackend.Backend(withZo: zo, andMod: mod, andProc: proc)
  }

  public func closeAllWorkspaces() -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0000).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func closeWorkspace(_ id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0001).write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func createTopic(named name: String, withPartitions partitions: UVarint, andOptions options: [TopicOption], inWorkspace id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0002).write(to: out)
        name.write(to: out)
        partitions.write(to: out)
        options.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func deleteConnection(_ c: ConnectionDetails) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0003).write(to: out)
        c.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func deleteGroup(named groupId: String, inWorkspace id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0004).write(to: out)
        groupId.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func deleteTopic(named name: String, inWorkspace id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0005).write(to: out)
        name.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func fetchOffsets(forGroupNamed groupId: String, inWorkspace id: UVarint) -> Future<String, GroupOffsets> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0006).write(to: out)
        groupId.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> GroupOffsets in
        return GroupOffsets.read(from: inp, using: &buf)
      }
    )
  }

  public func generatePasswordId() -> Future<String, String> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0007).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> String in
        return String.read(from: inp, using: &buf)
      }
    )
  }

  public func getConnections() -> Future<String, [ConnectionDetails]> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0008).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> [ConnectionDetails] in
        return [ConnectionDetails].read(from: inp, using: &buf)
      }
    )
  }

  public func getMetadata(forcingReload reload: Bool, inWorkspace id: UVarint) -> Future<String, Metadata> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0009).write(to: out)
        reload.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Metadata in
        return Metadata.read(from: inp, using: &buf)
      }
    )
  }

  public func getResourceConfigs(forResourceNamed name: String, resourceType type: Symbol, inWorkspace id: UVarint) -> Future<String, [ResourceConfig]> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000a).write(to: out)
        name.write(to: out)
        type.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> [ResourceConfig] in
        return [ResourceConfig].read(from: inp, using: &buf)
      }
    )
  }

  public func openWorkspace(withConn conn: ConnectionDetails, andPassword password: String?) -> Future<String, UVarint> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000b).write(to: out)
        conn.write(to: out)
        password.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> UVarint in
        return UVarint.read(from: inp, using: &buf)
      }
    )
  }

  public func ping() -> Future<String, String> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000c).write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> String in
        return String.read(from: inp, using: &buf)
      }
    )
  }

  public func resetPartitionOffsets(forGroupNamed groupId: String, andTopic topic: String, andPartitionId pid: UVarint, andTarget target: Symbol, andOffset offset: UVarint?, inWorkspace id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000d).write(to: out)
        groupId.write(to: out)
        topic.write(to: out)
        pid.write(to: out)
        target.write(to: out)
        offset.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func resetTopicOffsets(forGroupNamed groupId: String, andTopic topic: String, andTarget target: Symbol, inWorkspace id: UVarint) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000e).write(to: out)
        groupId.write(to: out)
        topic.write(to: out)
        target.write(to: out)
        id.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func saveConnection(_ c: ConnectionDetails) -> Future<String, ConnectionDetails> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x000f).write(to: out)
        c.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> ConnectionDetails in
        return ConnectionDetails.read(from: inp, using: &buf)
      }
    )
  }

  public func touchConnection(_ c: ConnectionDetails) -> Future<String, Void> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0010).write(to: out)
        c.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> Void in }
    )
  }

  public func updateConnection(_ c: ConnectionDetails) -> Future<String, ConnectionDetails> {
    return impl.send(
      writeProc: { (out: OutputPort) in
        UVarint(0x0011).write(to: out)
        c.write(to: out)
      },
      readProc: { (inp: InputPort, buf: inout Data) -> ConnectionDetails in
        return ConnectionDetails.read(from: inp, using: &buf)
      }
    )
  }
}
