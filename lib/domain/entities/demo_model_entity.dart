import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:laplace_chart/data/models/1a.dart';
import 'package:laplace_chart/data/models/1g.dart';
import 'package:laplace_chart/data/models/1h.dart';
import 'package:laplace_chart/data/models/1y.dart';
import 'package:laplace_chart/data/models/3a.dart';
import 'package:laplace_chart/data/models/5y.dart';

class DemoModelEntity extends Equatable {
  final List<OneG> l1G;
  final List<OneH> l1H;
  final List<OneA> l1A;
  final List<ThreeA> l3A;
  final List<OneY> l1Y;
  final List<FiveY> l5Y;
  final String code;
  final String symbol;
  const DemoModelEntity({
    @required this.l1G,
    @required this.l1H,
    @required this.l1A,
    @required this.l3A,
    @required this.l1Y,
    @required this.l5Y,
    @required this.code,
    @required this.symbol,
  });

  @override
  List<Object> get props => [code, symbol];

  @override
  bool get stringify => true;
}
