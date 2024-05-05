import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_exit_sale_response.dart';

class OsmosisStreamSwapMsgExitSale extends CosmosMessage
    with ServiceMessage<OsmosisStreamSwapMsgExitSaleResponse> {
  /// sender is an account address exiting a sale
  final String? sender;

  /// ID of an existing sale.
  final BigInt? saleId;

  OsmosisStreamSwapMsgExitSale({this.sender, this.saleId});
  factory OsmosisStreamSwapMsgExitSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgExitSale(
        sender: decode.getField(1), saleId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "sale_id": saleId?.toString()};
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.msgExitSale.typeUrl;

  @override
  List get values => [sender, saleId];

  @override
  OsmosisStreamSwapMsgExitSaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapMsgExitSaleResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisStreamSwapV1Types.exitSale.typeUrl;

  @override
  List<String?> get signers => [sender];
}
