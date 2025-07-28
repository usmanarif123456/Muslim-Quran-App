// ignore: unused_import
import 'dart:convert';

class HadithModel {
  final int id;
 // final String book;
  //final String hadithNumber;
  final String arabic;
  final String english;
  final String urdu;

  HadithModel({
  required this.id,
  //required this.book,
  //required this.hadithNumber,
  required this.arabic,
  required this.english,
  required this.urdu,
  });
 factory HadithModel.fromJson(Map<String,dynamic>json){
  return HadithModel(
    id: json['id'],
   // book: json['book'],
    //hadithNumber:json['hadithNumber'],
    arabic: json['arabic'],
    english: json['english'],
    urdu: json['urdu'],
        
        );
 }

}