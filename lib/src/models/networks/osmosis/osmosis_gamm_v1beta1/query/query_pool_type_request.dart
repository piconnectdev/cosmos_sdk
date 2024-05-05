import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_pool_type_response.dart';

class OsmosisGammQueryPoolTypeRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryPoolTypeResponse>,
        RPCMessage<OsmosisGammQueryPoolTypeResponse> {
  final BigInt? poolId;
  const OsmosisGammQueryPoolTypeRequest({this.poolId});
  factory OsmosisGammQueryPoolTypeRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolTypeRequest(poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryPoolTypeResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryPoolTypeResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisGammV1beta1Types.poolType.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolTypeRequest.typeUrl;

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolTypeResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolTypeResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.poolType
      .rpcUrl(pathParameters: [poolId?.toString()]);
}
