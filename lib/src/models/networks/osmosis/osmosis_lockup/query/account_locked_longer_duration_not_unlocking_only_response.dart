import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse
    extends CosmosMessage {
  final List<OsmosisLockupPeriodLock> locks;
  OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse(
      List<OsmosisLockupPeriodLock> locks)
      : locks = locks.mutable;
  factory OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse(
        decode
            .getFields(1)
            .map((e) => OsmosisLockupPeriodLock.deserialize(e))
            .toList());
  }
  factory OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse(
        (json["locks"] as List?)
                ?.map((e) => OsmosisLockupPeriodLock.deserialize(e))
                .toList() ??
            <OsmosisLockupPeriodLock>[]);
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"locks": locks.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => OsmosisLockupTypes
      .accountLockedLongerDurationNotUnlockingOnlyResponse.typeUrl;

  @override
  List get values => [locks];
}
