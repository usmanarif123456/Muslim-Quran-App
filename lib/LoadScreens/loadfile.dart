import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:muslim_history_app/models/model.dart';


Future<List<Ayah>> loadQuran() async {
  final String response = await rootBundle.loadString('assets/quran/quran_combined.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Ayah.fromJson(json)).toList();
}
Ayah getRandomAyah(List<Ayah> ayahs) {
  final random = Random();
  return ayahs[random.nextInt(ayahs.length)];
}
