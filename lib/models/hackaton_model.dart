import 'package:searchack/models/all_model.dart';
import 'package:searchack/models/past_model.dart';
import 'package:searchack/models/present_model.dart';

class Hackaton {
  List<All>? all;
  List<Past>? past;
  List<Present>? present;
  Hackaton.fromJson(Map<String, dynamic> json) {
    if (json['all'] != null) {
      all = List<All>.empty(growable: true);
      for (final item in json['all']) {
        all!.add(All.fromJson(item as Map<String, dynamic>));
      }
    }
    if (json['past'] != null) {
      past = List<Past>.empty(growable: true);
      for (final item in json['past']) {
        past!.add(Past.fromJson(item as Map<String, dynamic>));
      }
    }
    if (json['present'] != null) {
      present = List<Present>.empty(growable: true);
      for (final item in json['present']) {
        present!.add(Present.fromJson(item as Map<String, dynamic>));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (all != null) {
      data['all'] = all!.map((v) => v.toJson()).toList();
    }
    if (past != null) {
      data['past'] = past!.map((v) => v.toJson()).toList();
    }
    if (present != null) {
      data['present'] = present!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
