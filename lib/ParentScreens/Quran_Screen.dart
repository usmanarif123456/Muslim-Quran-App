// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:muslim_history_app/ParentScreens/seerahscreen.dart';
import 'package:muslim_history_app/screens/Translation.dart';
import 'package:muslim_history_app/screens/about_quran.dart';
import 'package:muslim_history_app/screens/detailed_parah.dart';
import 'package:muslim_history_app/screens/detailed_surah.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allParahNames = [
    {"urdu": "الم", "english": "Alif Lam Meem"},
    {"urdu": "سَيَقُولُ", "english": "Sayaqool"},
    {"urdu": "تِلْكَ الرُّسُلُ", "english": "Tilkal Rusul"},
    {"urdu": "لَنْ تَنَالُوا", "english": "Lan Tanaalu"},
    {"urdu": "وَالْمُحْصَنَاتُ", "english": "Wal Mohsanat"},
    {"urdu": "لَا يُحِبُّ اللَّهُ", "english": "La Yuhibbullah"},
    {"urdu": "وَإِذَا سَمِعُوا", "english": "Wa Iza Samiu"},
    {"urdu": "وَلَوْ أَنَّنَا", "english": "Wa Lau Annana"},
    {"urdu": "قَدْ أَفْلَحَ", "english": "Qad Aflaha"},
    {"urdu": "وَاعْلَمُوا", "english": "Wa A’lamu"},
    {"urdu": "يَعْتَذِرُونَ", "english": "Yatazeroon"},
    {"urdu": "وَمَا مِن دَابَّةٍ", "english": "Wa Mamin Da’abat"},
    {"urdu": "وَمَا أُبَرِّئُ", "english": "Wa Ma Ubrioo"},
    {"urdu": "رُبَمَا", "english": "Rubama"},
    {"urdu": "سُبْحَانَ الَّذِي", "english": "Subhanallazi"},
    {"urdu": "قَالَ أَلَمْ", "english": "Qal Alam"},
    {"urdu": "اقْتَرَبَتِ", "english": "Aqtaribat"},
    {"urdu": "قَدْ أَفْلَحَ", "english": "Qadd Aflaha"},
    {"urdu": "وَقَالَ الَّذِينَ", "english": "Wa Qalallazina"},
    {"urdu": "أَمَّنْ خَلَقَ", "english": "A’man Khalaq"},
    {"urdu": "اتْلُ مَا أُوحِيَ", "english": "Utlu Ma Oohi"},
    {"urdu": "وَمَن يَقْنُتْ", "english": "Wa Manyaqnut"},
    {"urdu": "وَمَا لِيَ", "english": "Wama liya"},
    {"urdu": "فَمَنْ أَظْلَمُ", "english": "Faman Azlam"},
    {"urdu": "إِلَيْهِ يُرَدُّ", "english": "Elahe Yuruddo"},
    {"urdu": "حم", "english": "Ha Meem"},
    {"urdu": "قَالَ فَمَا خَطْبُكُم", "english": "Qala Fama Khatbukum"},
    {"urdu": "قَدْ سَمِعَ اللَّهُ", "english": "Qadd Sami Allah"},
    {"urdu": "تَبَارَكَ الَّذِي", "english": "Tabarakallazi"},
    {"urdu": "عَمَّ يَتَسَاءَلُونَ", "english": "Amma Yatasa’aloon"},
  ];

  List<Map<String, String>> allSurahNames = [
    {"urdu": "الفاتحہ", "english": "Al-Fatiha"},
    {"urdu": "البقرہ", "english": "Al-Baqarah"},
    {"urdu": "آل عمران", "english": "Aal-E-Imran"},
    {"urdu": "النساء", "english": "An-Nisa"},
    {"urdu": "المائدہ", "english": "Al-Ma’idah"},
    {"urdu": "الانعام", "english": "Al-An’am"},
    {"urdu": "الاعراف", "english": "Al-A’raf"},
    {"urdu": "الانفال", "english": "Al-Anfal"},
    {"urdu": "التوبہ", "english": "At-Tawbah"},
    {"urdu": "یونس", "english": "Yunus"},
    {"urdu": "ہود", "english": "Hud"},
    {"urdu": "یوسف", "english": "Yusuf"},
    {"urdu": "الرعد", "english": "Ar-Ra’d"},
    {"urdu": "ابراھیم", "english": "Ibrahim"},
    {"urdu": "الحجر", "english": "Al-Hijr"},
    {"urdu": "النحل", "english": "An-Nahl"},
    {"urdu": "الاسراء", "english": "Al-Isra"},
    {"urdu": "الکہف", "english": "Al-Kahf"},
    {"urdu": "مریم", "english": "Maryam"},
    {"urdu": "طٰہٰ", "english": "Ta-Ha"},
    {"urdu": "الانبیا", "english": "Al-Anbiya"},
    {"urdu": "الحج", "english": "Al-Hajj"},
    {"urdu": "المومنون", "english": "Al-Mu’minun"},
    {"urdu": "النور", "english": "An-Nur"},
    {"urdu": "الفرقان", "english": "Al-Furqan"},
    {"urdu": "الشعراء", "english": "Ash-Shu’ara"},
    {"urdu": "النمل", "english": "An-Naml"},
    {"urdu": "القصص", "english": "Al-Qasas"},
    {"urdu": "العنکبوت", "english": "Al-‘Ankabut"},
    {"urdu": "الروم", "english": "Ar-Rum"},
    {"urdu": "لقمان", "english": "Luqman"},
    {"urdu": "السجدہ", "english": "As-Sajda"},
    {"urdu": "الاحزاب", "english": "Al-Ahzab"},
    {"urdu": "سبا", "english": "Saba"},
    {"urdu": "فاطر", "english": "Fatir"},
    {"urdu": "یٰسٓ", "english": "Ya-Sin"},
    {"urdu": "الصافات", "english": "As-Saffat"},
    {"urdu": "صٓ", "english": "Sad"},
    {"urdu": "الزمر", "english": "Az-Zumar"},
    {"urdu": "غافر", "english": "Ghafir"},
    {"urdu": "فصلت", "english": "Fussilat"},
    {"urdu": "الشوریٰ", "english": "Ash-Shura"},
    {"urdu": "الزخرف", "english": "Az-Zukhruf"},
    {"urdu": "الدخان", "english": "Ad-Dukhan"},
    {"urdu": "الجاثیہ", "english": "Al-Jathiya"},
    {"urdu": "الاحقاف", "english": "Al-Ahqaf"},
    {"urdu": "محمد", "english": "Muhammad"},
    {"urdu": "الفتح", "english": "Al-Fath"},
    {"urdu": "الحجرات", "english": "Al-Hujurat"},
    {"urdu": "قٓ", "english": "Qaf"},
    {"urdu": "الذاریات", "english": "Adh-Dhariyat"},
    {"urdu": "الطور", "english": "At-Tur"},
    {"urdu": "النجم", "english": "An-Najm"},
    {"urdu": "القمر", "english": "Al-Qamar"},
    {"urdu": "الرحمن", "english": "Ar-Rahman"},
    {"urdu": "الواقعہ", "english": "Al-Waqi’ah"},
    {"urdu": "الحدید", "english": "Al-Hadid"},
    {"urdu": "المجادلہ", "english": "Al-Mujadila"},
    {"urdu": "الحشر", "english": "Al-Hashr"},
    {"urdu": "الممتحنہ", "english": "Al-Mumtahanah"},
    {"urdu": "الصف", "english": "As-Saff"},
    {"urdu": "الجمعة", "english": "Al-Jumu’ah"},
    {"urdu": "المنافقون", "english": "Al-Munafiqun"},
    {"urdu": "التغابن", "english": "At-Taghabun"},
    {"urdu": "الطلاق", "english": "At-Talaq"},
    {"urdu": "التحریم", "english": "At-Tahrim"},
    {"urdu": "الملک", "english": "Al-Mulk"},
    {"urdu": "القلم", "english": "Al-Qalam"},
    {"urdu": "الحاقہ", "english": "Al-Haqqah"},
    {"urdu": "المعارج", "english": "Al-Ma’arij"},
    {"urdu": "نوح", "english": "Nuh"},
    {"urdu": "الجن", "english": "Al-Jinn"},
    {"urdu": "المزمل", "english": "Al-Muzzammil"},
    {"urdu": "المدثر", "english": "Al-Muddathir"},
    {"urdu": "القیامہ", "english": "Al-Qiyamah"},
    {"urdu": "الانسان", "english": "Al-Insan"},
    {"urdu": "المرسلات", "english": "Al-Mursalat"},
    {"urdu": "النبأ", "english": "An-Naba"},
    {"urdu": "النازعات", "english": "An-Nazi’at"},
    {"urdu": "عبس", "english": "Abasa"},
    {"urdu": "التکویر", "english": "At-Takwir"},
    {"urdu": "الانفطار", "english": "Al-Infitar"},
    {"urdu": "المطففین", "english": "Al-Mutaffifin"},
    {"urdu": "الانشقاق", "english": "Al-Inshiqaq"},
    {"urdu": "البروج", "english": "Al-Buruj"},
    {"urdu": "الطارق", "english": "At-Tariq"},
    {"urdu": "الاعلیٰ", "english": "Al-A’la"},
    {"urdu": "الغاشیہ", "english": "Al-Ghashiyah"},
    {"urdu": "الفجر", "english": "Al-Fajr"},
    {"urdu": "البلد", "english": "Al-Balad"},
    {"urdu": "الشمس", "english": "Ash-Shams"},
    {"urdu": "اللیل", "english": "Al-Lail"},
    {"urdu": "الضحیٰ", "english": "Ad-Duha"},
    {"urdu": "الشرح", "english": "Ash-Sharh"},
    {"urdu": "التین", "english": "At-Tin"},
    {"urdu": "العلق", "english": "Al-‘Alaq"},
    {"urdu": "القدر", "english": "Al-Qadr"},
    {"urdu": "البینہ", "english": "Al-Bayyina"},
    {"urdu": "الزلزال", "english": "Az-Zalzalah"},
    {"urdu": "العادیات", "english": "Al-‘Adiyat"},
    {"urdu": "القارعہ", "english": "Al-Qari’ah"},
    {"urdu": "التکاثر", "english": "At-Takathur"},
    {"urdu": "العصر", "english": "Al-‘Asr"},
    {"urdu": "الہمزہ", "english": "Al-Humazah"},
    {"urdu": "الفیل", "english": "Al-Fil"},
    {"urdu": "قریش", "english": "Quraish"},
    {"urdu": "الماعون", "english": "Al-Ma’un"},
    {"urdu": "الکوثر", "english": "Al-Kawthar"},
    {"urdu": "الکافرون", "english": "Al-Kafirun"},
    {"urdu": "النصر", "english": "An-Nasr"},
    {"urdu": "اللھب", "english": "Al-Masad"},
    {"urdu": "الاخلاص", "english": "Al-Ikhlas"},
    {"urdu": "الفلق", "english": "Al-Falaq"},
    {"urdu": "الناس", "english": "An-Nas"},
  ];

  List<Map<String, String>> filteredSurahs = [];
  List<Map<String, String>> filteredParahs = [];
  int selectedIndex = 0;

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredSurahs = List.from(allSurahNames);
    filteredParahs = List.from(allParahNames);
  }

  void _filterList(String query) {
    setState(() {
      if (selectedIndex == 0) {
        filteredParahs = allParahNames
            .where((item) =>
                item['urdu']!.contains(query) ||
                item['english']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredSurahs = allSurahNames
            .where((item) =>
                item['urdu']!.contains(query) ||
                item['english']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // ignore: unused_element
  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        _searchController.clear();
        filteredSurahs = List.from(allSurahNames);
        filteredParahs = List.from(allParahNames);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF6EAD9),
          title: Center(
              child: Text('Quran',
                  style: TextStyle(
                      fontSize: screenWidth * 0.065,
                      color: Color(0xFF6A4D3B),
                      fontWeight: FontWeight.bold)))),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                  child: Row(
                    children: [
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            setState(() {
                              isSearching = hasFocus;
                            });
                          },
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              fillColor: Color(0XFFF6EAD9),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 19),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFF6A4D3B),
                                ),
                              ),
                            ),
                            onChanged: _filterList,
                          ),
                        ),
                      ),
                      if (isSearching)
                        TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isSearching = false;
                              _searchController.clear();
                              filteredSurahs = List.from(allSurahNames);
                              filteredParahs = List.from(allParahNames);
                            });
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.black)),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeerahPDFScreen()));
                        },
                        child: Icon(
                          Icons.bookmark,
                          color: Color(0xFF6A4D3B),
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.21,
                          child: Text(
                            "Prophets Seerah",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutQuran()));
                      },
                        child: Icon(
                          Icons.reset_tv,
                          color: Color(0xFF6A4D3B),
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.21,
                          child: Text(
                            "About App",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.search_off_outlined,
                        color: Color(0xFF6A4D3B),
                      ),
                      SizedBox(
                          width: screenWidth * 0.2,
                          child: Text(
                            "Search in Quran",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.audio_file,
                        color: Color(0xFF6A4D3B),
                      ),
                      SizedBox(
                          width: screenWidth * 0.19,
                          child: Text(
                            "Audio of Quran",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        _searchController.clear();
                        _filterList('');
                      });
                    },
                    child: Container(
                      height: screenHeight * 0.08,
                      // width: screenWidth*0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectedIndex == index
                            ? Color(0xFF6A4D3B)
                            : Color(0XFFF6EAD9),
                        border: Border(
                          right: index < 2
                              ? BorderSide(color: Colors.grey.shade400)
                              : BorderSide.none,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          index == 1
                              ? "Surah Mushaf"
                              : index == 0
                                  ? "Parah Mushaf"
                                  : "Translation",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedIndex == 0
                    ? filteredParahs.length
                    : filteredSurahs.length,
                itemBuilder: (context, index) {
                  final item = selectedIndex == 0
                      ? filteredParahs[index]
                      : filteredSurahs[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFF6A4D3B), width: 1))),
                      child: ListTile(
                        leading: Text(
                          '🟤 ${index + 1} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(item['english'] ?? '',
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                            ),
                            Text(item['urdu'] ?? '',
                                style: TextStyle(
                                    fontFamily: 'QuranFont',
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        onTap: () {
                          // print("Tapped on: ${item['english']}");
                          if (selectedIndex == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailedParahScreen(
                                          juzzNumber: index + 1,
                                        )));
                          } else if (selectedIndex == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailedSurah(
                                          surahNumber: index + 1,
                                        )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailedTranslation(
                                        transAyahNumber: index + 1)));
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    // print('Tapped Surah: ${item['urdu']}');
  }
}
