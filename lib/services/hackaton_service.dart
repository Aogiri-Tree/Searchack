import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:searchack/models/hackaton_model.dart';

class HackatonService {
  Future<Hackaton> getHacks() async {
    var data = await rootBundle.loadString('assets/data.json');
    var body = json.decode(data);
    return Hackaton.fromJson(body);
  }
}
