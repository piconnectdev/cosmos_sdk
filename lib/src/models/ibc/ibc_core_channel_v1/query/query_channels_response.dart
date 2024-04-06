import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/identified_channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryChannelsResponse is the response type for the Query/Channels RPC method.
class QueryChannelsResponse extends CosmosMessage {
  /// list of stored channels of the chain.
  final List<IbcChannelIdentifiedChannel>? channels;

  /// pagination response
  final PageResponse? pagination;

  /// query block height
  final IbcClientHeight height;
  QueryChannelsResponse(
      {List<IbcChannelIdentifiedChannel>? channels,
      this.pagination,
      required this.height})
      : channels = channels?.nullOnEmpy;
  factory QueryChannelsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryChannelsResponse(
      channels: decode
          .getFields(1)
          .map((e) => IbcChannelIdentifiedChannel.deserialize(e))
          .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
      height: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "channels": channels?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "height": height.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryChannelsResponse.typeUrl;

  @override
  List get values => [channels, pagination, height];
}
