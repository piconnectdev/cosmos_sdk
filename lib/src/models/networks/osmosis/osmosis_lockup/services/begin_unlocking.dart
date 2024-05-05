import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'begin_unlocking_response.dart';

class OsmosisLockupMsgBeginUnlocking extends CosmosMessage
    with ServiceMessage<OsmosisLockupMsgBeginUnlockingResponse> {
  final String? owner;
  final BigInt? id;
  final List<Coin> coins;
  OsmosisLockupMsgBeginUnlocking(
      {this.owner, this.id, required List<Coin> coins})
      : coins = coins.mutable;
  factory OsmosisLockupMsgBeginUnlocking.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgBeginUnlocking(
        owner: decode.getField(1),
        id: decode.getField(2),
        coins: decode.getFields(3).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisLockupMsgBeginUnlockingResponse onResponse(List<int> bytes) {
    return OsmosisLockupMsgBeginUnlockingResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisLockupTypes.beginUnlocking.typeUrl;

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "id": id,
      "coins": coins.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisLockupTypes.msgBeginUnlocking.typeUrl;

  @override
  List get values => [owner, id, coins];
}
