import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/chain_contract.dart';

class VaultPubKeyInfo {
  final String pubKey;
  final List<ThorChainContractResponse> routers;

  VaultPubKeyInfo({
    required this.pubKey,
    required List<ThorChainContractResponse> routers,
  }) : routers = routers.mutable;

  factory VaultPubKeyInfo.fromJson(Map<String, dynamic> json) {
    return VaultPubKeyInfo(
      pubKey: json['pub_key'],
      routers: (json['routers'] as List<dynamic>)
          .map((routerJson) => ThorChainContractResponse.fromJson(routerJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pub_key': pubKey,
      'routers': routers.map((router) => router.toJson()).toList(),
    };
  }
}
