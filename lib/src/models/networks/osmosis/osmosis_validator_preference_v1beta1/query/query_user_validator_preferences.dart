import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_user_validator_preference_response.dart';

/// Returns the list of ValidatorPreferences for the user.
class OsmosisValidatorPreferenceQueryUserValidatorPreferences
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse>,
        RPCMessage<
            OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse> {
  /// user account address
  final String? user;

  const OsmosisValidatorPreferenceQueryUserValidatorPreferences({this.user});
  factory OsmosisValidatorPreferenceQueryUserValidatorPreferences.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValidatorPreferenceQueryUserValidatorPreferences(
        user: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"user": user};
  }

  @override
  String get typeUrl => OsmosisValidatorPreferenceV1beta1Types
      .queryUserValidatorPreferences.typeUrl;

  @override
  List get values => [user];

  @override
  OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse
        .fromRpc(json);
  }

  @override
  OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse onResponse(
      List<int> bytes) {
    return OsmosisValidatorPreferenceQueryUserValidatorPreferenceResponse
        .deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisValidatorPreferenceV1beta1Types.userValidatorPreferences.typeUrl;

  @override
  String get rpcPath =>
      OsmosisValidatorPreferenceV1beta1Types.userValidatorPreferences
          .rpcUrl(pathParameters: [user]);
}
