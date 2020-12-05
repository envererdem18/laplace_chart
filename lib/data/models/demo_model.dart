import 'dart:convert';

import 'package:laplace_chart/domain/entities/demo_model_entity.dart';

import '1a.dart';
import '1g.dart';
import '1h.dart';
import '1y.dart';
import '3a.dart';
import '5y.dart';

class DemoModel extends DemoModelEntity {
  final List<OneG> l1G;
  final List<OneH> l1H;
  final List<OneA> l1A;
  final List<ThreeA> l3A;
  final List<OneY> l1Y;
  final List<FiveY> l5Y;
  final String code;
  final String symbol;

  DemoModel({
    this.l1G,
    this.l1H,
    this.l1A,
    this.l3A,
    this.l1Y,
    this.l5Y,
    this.code,
    this.symbol,
  }) : super(
          l1G: l1G,
          l1H: l1H,
          l1A: l1A,
          l3A: l3A,
          l1Y: l1Y,
          l5Y: l5Y,
          code: code,
          symbol: symbol,
        );

  Map<String, dynamic> toMap() {
    return {
      'l1G': l1G?.map((x) => x?.toJson())?.toList(),
      'l1H': l1H?.map((x) => x?.toJson())?.toList(),
      'l1A': l1A?.map((x) => x?.toJson())?.toList(),
      'l3A': l3A?.map((x) => x?.toJson())?.toList(),
      'l1Y': l1Y?.map((x) => x?.toJson())?.toList(),
      'l5Y': l5Y?.map((x) => x?.toJson())?.toList(),
      'code': code,
      'symbol': symbol,
    };
  }

  String toJson() => json.encode(toMap());

  factory DemoModel.fromJson(Map<String, dynamic> json) {
    return DemoModel(
      l1G: List<OneG>.from(json["1G"].map((x) => OneG.fromJson(x))),
      l1H: List<OneH>.from(json["1H"].map((x) => OneH.fromJson(x))),
      l1A: List<OneA>.from(json["1A"].map((x) => OneA.fromJson(x))),
      l3A: List<ThreeA>.from(json["3A"].map((x) => ThreeA.fromJson(x))),
      l1Y: List<OneY>.from(json["1Y"].map((x) => OneY.fromJson(x))),
      l5Y: List<FiveY>.from(json["5Y"].map((x) => FiveY.fromJson(x))),
      code: json["code"],
      symbol: json["symbol"],
    );
  }
}
