import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_spot_price_response.dart';

class OsmosisGammQuerySpotPriceRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQuerySpotPriceResponse>,
        RPCMessage<OsmosisGammQuerySpotPriceResponse> {
  final BigInt? poolId;
  final String? baseAssetDenom;
  final String? quoteDssetDenom;
  OsmosisGammQuerySpotPriceRequest(
      {this.poolId, this.baseAssetDenom, this.quoteDssetDenom});
  factory OsmosisGammQuerySpotPriceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);

    return OsmosisGammQuerySpotPriceRequest(
        poolId: decode.getField(1),
        baseAssetDenom: decode.getField(2),
        quoteDssetDenom: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisGammQuerySpotPriceResponse onResponse(List<int> bytes) {
    return OsmosisGammQuerySpotPriceResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisGammV1beta1Types.spotPrice.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "base_asset_denom": baseAssetDenom,
      "quote_asset_denom": quoteDssetDenom
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.querySpotPriceRequest.typeUrl;

  @override
  List get values => [poolId, baseAssetDenom, quoteDssetDenom];

  @override
  OsmosisGammQuerySpotPriceResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQuerySpotPriceResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        "base_asset_denom": baseAssetDenom,
        "quote_asset_denom": quoteDssetDenom
      };

  @override
  String get rpcPath => OsmosisGammV1beta1Types.spotPrice
      .rpcUrl(pathParameters: [poolId?.toString()]);
}
