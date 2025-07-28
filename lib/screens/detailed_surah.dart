// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:muslim_history_app/LoadScreens/loadfile.dart';
import 'package:muslim_history_app/models/model.dart';

class DetailedSurah extends StatefulWidget {
  final int surahNumber;

  const DetailedSurah({super.key, required this.surahNumber});

  @override
  State<DetailedSurah> createState() => _DetailedSurahState();
}

late Future<List<Ayah>> filteredSurah;

class _DetailedSurahState extends State<DetailedSurah> {
  @override
  void initState() {
    super.initState();
    filteredSurah = loadandfilterSurahs(widget.surahNumber);
  }

  Future<List<Ayah>> loadandfilterSurahs(int SurahN) async {
    final allAyah = await loadQuran();
    final surahAyahs =
        allAyah.where((ayah) => ayah.surah_index == SurahN).toList();
    return surahAyahs;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF6EAD9),
        title: Center(
          child: Text(
            'Surah ${widget.surahNumber}',
            style: TextStyle(
              fontSize: screenWidth * 0.065,
              color: const Color(0xFF6A4D3B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Ayah>>(
        future: filteredSurah,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No ayahs found for this Surah.'));
          }

          final ayahs = snapshot.data!;

          final englishParagraph = ayahs.map((a) => a.english).join(' ');
          final urduParagraph = ayahs.map((a) => a.urdu).join(' ');

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 🌟 Show Bismillah only for Surah ≠ 1 and Surah ≠ 9
                if (widget.surahNumber != 1 && widget.surahNumber != 9)
                  Center(
                    child: Text(
                      'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                      style: TextStyle(
                        fontFamily: "QuranFont",
                        fontSize: screenWidth * 0.06,
                        color: const Color(0xFF6A4D3B),
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),

                SizedBox(height: screenWidth * 0.07), // space after bismillah

                // 🌟 Arabic Ayahs
                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: ayahs.map((a) {
                      return TextSpan(
                        children: [
                          TextSpan(
                            text: '${a.arabic} ',
                            style: TextStyle(
                              fontFamily: "QuranFont",
                              fontSize: screenWidth * 0.06,
                              color: Colors.black,
                               height: screenHeight*0.003
                            ),
                          ),
                          TextSpan(
                            text: '﴿${a.ayah}﴾ ',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              color: const Color(0xFF6A4D3B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: screenWidth * 0.06),

                // 🌟 English Translation
                Text(
                  englishParagraph,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.blueGrey,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: screenWidth * 0.06),

                // 🌟 Urdu Translation
                Text(
                  urduParagraph,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: const Color(0xFF6A4D3B),
                    height: 1.8,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
