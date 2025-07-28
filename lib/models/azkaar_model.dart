class AzkaarModel {
  final int id;
  final String arabic;
  final String english;
  final String urdu;
  final String category;

  AzkaarModel({
  required this.id,
  required this.arabic,
  required this.english,
  required this.urdu,
  required this.category

  });

  factory AzkaarModel.fromJson(Map<String , dynamic>json){
return AzkaarModel(
      id: json['id'],
      arabic: json['arabic'],
      english: json['english'],
      urdu: json['urdu'],
      category: json['category'],
     
);
}
}