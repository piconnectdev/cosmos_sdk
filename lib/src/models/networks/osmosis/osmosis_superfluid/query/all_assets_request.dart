import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'all_assets_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidAllAssetsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidAllAssetsResponse>,
        RPCMessage<OsmosisSuperfluidAllAssetsResponse> {
  const OsmosisSuperfluidAllAssetsRequest();
  factory OsmosisSuperfluidAllAssetsRequest.deserialize(List<int> bytes) {
    return OsmosisSuperfluidAllAssetsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.allAssetsRequest.typeUrl;

  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisSuperfluidTypes.allAssets.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.allAssets.rpcUrl();

  @override
  OsmosisSuperfluidAllAssetsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidAllAssetsResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidAllAssetsResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidAllAssetsResponse.deserialize(bytes);
  }
}
