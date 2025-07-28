import 'dart:core';
import 'package:flutter/material.dart';
import 'package:muslim_history_app/LoadScreens/loadfile.dart';
import 'package:muslim_history_app/models/model.dart';

class DetailedParahScreen extends StatefulWidget {
  final int juzzNumber;

  const DetailedParahScreen({super.key, required this.juzzNumber});

  @override
  State<DetailedParahScreen> createState() => _DetailedParahScreenState();
}

class _DetailedParahScreenState extends State<DetailedParahScreen> {
  late Future<List<Ayah>> filteredAyahs;
  Map<int, List<Ayah>> rukuGroups = {};

  // ✅ Correct grouping function
  Map<int, List<Ayah>> groupByRuku(List<Ayah> ayahs) {
    Map<int, List<Ayah>> grouped = {};
    for (var ayah in ayahs) {
      int ruku = ayah.ruku;
      if (!grouped.containsKey(ruku)) {
        grouped[ruku] = [];
      }
      grouped[ruku]!.add(ayah);
    }
    return grouped;
  }

  @override
  void initState() {
    super.initState();
    filteredAyahs = loadAndFilterAyahs(widget.juzzNumber);
  }

  Future<List<Ayah>> loadAndFilterAyahs(int juzz) async {
    final allAyahs = await loadQuran();
    final juzzAyahs = allAyahs.where((ayah) => ayah.juzz == juzz).toList();

    // ✅ Group by Ruku here
    rukuGroups = groupByRuku(juzzAyahs);

    return juzzAyahs;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF6EAD9),
          title: Center(
              child: Text("Parah ${widget.juzzNumber} ",
                  style: TextStyle(
                      fontSize: screenWidth * 0.065,
                      color: Color(0xFF6A4D3B),
                      fontWeight: FontWeight.bold)))),
      body: FutureBuilder<List<Ayah>>(
        future: filteredAyahs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Ayahs found for this Parah.'));
          }

          final shownSurahs = <String>{}; // 🟢 Track shown surah names

          return ListView(
  children: rukuGroups.entries.map((entry) {
    final rukuAyahs = entry.value;

    List<InlineSpan> paragraphSpans = [];
    List<Widget> widgets = [];

    String? currentSurah;

    for (int i = 0; i < rukuAyahs.length; i++) {
      final ayah = rukuAyahs[i];

      
      if (currentSurah != ayah.surah) {
        if (currentSurah != null) {
          
          widgets.add(
            Divider(
              thickness: screenHeight * 0.003,
              color: Colors.black,
            ),
          );
        }

        currentSurah = ayah.surah;

        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Text(
                'سورۃ ${ayah.surah}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A4D3B),
                ),
              ),
            ),
          ),
        );
      }

      // Arabic Ayah Text with brown ayah number
      paragraphSpans.add(
        TextSpan(
          text: '${ayah.arabic} ',
          style: TextStyle(color: Colors.black, height: screenHeight*0.003,),
        ),
      );

      paragraphSpans.add(
        TextSpan(
          text: '﴿${ayah.ayah}﴾ ',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
      );
    }

    // After processing all ayahs in ruku, add Arabic paragraph
    widgets.add(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: RichText(
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          text: TextSpan(
            style: TextStyle(
              fontFamily: "QuranFont",
              fontSize: screenWidth * 0.06,
              wordSpacing: screenWidth * 0.01,
            ),
            children: paragraphSpans,
          ),
        ),
      ),
    );

    // Optional Ruku-level divider
    widgets.add(
      Divider(
        thickness: screenHeight * 0.002,
        color: Colors.grey.shade400,
      ),
    );

    return Column(children: widgets);
  }).toList(),
);

        },
      ),
    );
  }
}
