// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:muslim_history_app/LoadScreens/loadfile.dart';
import 'package:muslim_history_app/models/model.dart';

class DetailedTranslation extends StatefulWidget {
  final int transAyahNumber;
  const DetailedTranslation({super.key, required this.transAyahNumber});

  @override
  State<DetailedTranslation> createState() => _DetailedTranslationState();
}

late Future<List<Ayah>> filteredtransAyahNumber;

class _DetailedTranslationState extends State<DetailedTranslation> {
  @override
  @override
  void initState() {
   
    super.initState();
    filteredtransAyahNumber =
        loadandfiltertransAyahNumber(widget.transAyahNumber);
  }

  Future<List<Ayah>> loadandfiltertransAyahNumber(
      int filteredtransAyahNumberN) async {
    final allAyah = await loadQuran();
    final filteredtransAyahNumberAyahs =
        allAyah.where((ayah) => ayah.surah_index == filteredtransAyahNumberN).toList();
    return filteredtransAyahNumberAyahs;
  }

  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar( backgroundColor:Color(0XFFF6EAD9),
        title: Center(child: Text('Surah  ', style: TextStyle(
              fontSize: screenWidth * 0.065,
              color: const Color(0xFF6A4D3B),
              fontWeight: FontWeight.bold,
            ),)),
      ),
      body: FutureBuilder<List<Ayah>>(
        future: filteredtransAyahNumber,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No ayahs found for this Translation.'));
          }

          final ayahs = snapshot.data!;
          return ListView.builder(
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              return ListTile(
                title: Text(
                 '${ayah.arabic} ﴿${ayah.ayah}﴾',
                  textAlign: TextAlign.right,
                  style:  TextStyle(fontFamily: "QuranFont", fontSize: screenWidth*0.05),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ayah.english,
                        style:  TextStyle(color: Colors.blueGrey,fontSize: screenWidth*0.04)),
                    Text(
                        textAlign: TextAlign.right,
                        ayah.urdu,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Color(0xFF6A4D3B),fontSize: screenWidth*0.04)),
                    const Divider(),
                  ],
                ),
                leading: Text('${ayah.ayah}'),
              );
            },
          );
        },
      ),
    );
  }
}
