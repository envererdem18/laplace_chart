import 'i_data.dart';

class OneG extends IData {
  int v;
  double h;
  double l;
  double o;

  OneG({this.v, this.h, this.l, this.o});

  OneG.fromJson(Map<String, dynamic> json) {
    d = json['d'];
    c = json['c']?.toDouble() ?? 0.0;
    v = json['v'];
    h = json['h']?.toDouble() ?? 0.0;
    l = json['l']?.toDouble() ?? 0.0;
    o = json['o']?.toDouble() ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['d'] = this.d;
    data['c'] = this.c;
    data['v'] = this.v;
    data['h'] = this.h;
    data['l'] = this.l;
    data['o'] = this.o;
    return data;
  }
}
