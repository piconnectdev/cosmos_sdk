import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisProtorevQueryParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryParamsResponse>,
        RPCMessage<OsmosisProtorevQueryParamsResponse> {
  const OsmosisProtorevQueryParamsRequest();
  factory OsmosisProtorevQueryParamsRequest.deserialize(List<int> bytes) {
    return OsmosisProtorevQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  OsmosisProtorevQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisProtorevQueryParamsResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisProtorevQueryParamsResponse.fromRpc(json);
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types.queryParamsRequest.typeUrl;

  @override
  String get queryPath => OsmosisProtorevV1beta1Types.queryParams.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisProtorevV1beta1Types.queryParams.rpcUrl();
}
