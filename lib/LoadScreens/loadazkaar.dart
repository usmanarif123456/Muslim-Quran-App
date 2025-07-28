import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:muslim_history_app/models/azkaar_model.dart';



Future<List<AzkaarModel>> loadAzkaar() async {
  final String response = await rootBundle.loadString('assets/Azkaar/azkaar.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => AzkaarModel.fromJson(json)).toList();
}
// ignore: non_constant_identifier_names
AzkaarModel getRandomAzkaar(List<AzkaarModel> Azkaars) {
  final random = Random();
  return Azkaars[random.nextInt(Azkaars.length)];
}
