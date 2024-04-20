import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorDelegationsRequest is request type for the Query/ValidatorDelegations RPC method
class QueryValidatorDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryValidatorDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress? validatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryValidatorDelegationsRequest({this.validatorAddr, this.pagination});

  factory QueryValidatorDelegationsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorDelegationsRequest(
        validatorAddr: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.queryValidatorDelegations.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_addr": validatorAddr?.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryValidatorDelegationsRequest.typeUrl;

  @override
  List get values => [validatorAddr?.address, pagination];
  @override
  QueryValidatorDelegationsResponse onResponse(List<int> bytes) {
    return QueryValidatorDelegationsResponse.deserialize(bytes);
  }
}
