import 'i_data.dart';

class FiveY extends IChartData {
  double o;
  double h;
  double l;

  FiveY({this.o, this.h, this.l});

  FiveY.fromJson(Map<String, dynamic> json) {
    d = json['d'];
    c = json['c']?.toDouble() ?? 0.0;
    o = json['o']?.toDouble() ?? 0.0;
    h = json['h']?.toDouble() ?? 0.0;
    l = json['l']?.toDouble() ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['d'] = this.d;
    data['c'] = this.c;
    data['o'] = this.o;
    data['h'] = this.h;
    data['l'] = this.l;
    return data;
  }
}
