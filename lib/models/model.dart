

class Ayah{
final  String surah;
final int ayah;
final String arabic;
final String urdu;
final String english;
final int juzz;
final int ruku;
// ignore: non_constant_identifier_names
final int surah_index;

Ayah({
required this.surah,
required this.ayah,
required this.arabic,
required this.urdu,
required this.english,
required this.juzz,
required this.ruku,
// ignore: non_constant_identifier_names
required this.surah_index,


});
factory Ayah.fromJson(Map<String , dynamic>json){
return Ayah(
      surah: json['surah'],
      ayah: json['ayah'],
      arabic: json['arabic'],
      english: json['english'],
      urdu: json['urdu'],
      juzz: json['juzz'],
      ruku: json['ruku'],
      surah_index: int.parse(json['surah_index'].toString())
);
}

  get ayahNumber => null;

}