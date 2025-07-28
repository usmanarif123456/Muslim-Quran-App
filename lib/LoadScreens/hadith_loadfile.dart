import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:muslim_history_app/models/hadith_model.dart';
// ignore: unused_import
import 'package:muslim_history_app/models/model.dart';


Future<List<HadithModel>> loadHadith() async {
  final String response = await rootBundle.loadString('assets/hadith/hadith_combined.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => HadithModel.fromJson(json)).toList();
}
HadithModel getRandomHadith(List<HadithModel> hadith) {
  final random = Random();
  return hadith[random.nextInt(hadith.length)];
}
