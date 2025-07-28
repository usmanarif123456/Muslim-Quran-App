// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailedAzkaar extends StatefulWidget {
  final String title;
  final String jsonFile;

  const DetailedAzkaar(
      {super.key, required this.title, required this.jsonFile});

  @override
  State<DetailedAzkaar> createState() => _DetailedAzkaarState();
}

class _DetailedAzkaarState extends State<DetailedAzkaar> {
  List azkaarList = [];

  @override
  void initState() {
    super.initState();
    loadAzkaar();
  }

  Future<void> loadAzkaar() async {
    String jsonString = await rootBundle.loadString(widget.jsonFile);
    final data = json.decode(jsonString);
    setState(() {
      if (data is List) {
        azkaarList = data; // standard Azkaar list
      } else if (data is Map && data.containsKey('verses')) {
        azkaarList = data['verses']; // special Janazah format
      } else {
        azkaarList = []; // fallback for unsupported format
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
            child: Text(
          widget.title,
          style: TextStyle(
              color: Color(0xFF6A4D3B),
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.055),
        )),
      ),
      body: azkaarList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: azkaarList.length,
              itemBuilder: (context, index) {
                var item = azkaarList[index];
                return Card(
                  margin: const EdgeInsets.all(1),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item['title'] != null) ...[
                          Text("🟤 ${item['title']}",
                              style:  TextStyle(
                                 color: Color(0xFF6A4D3B),
                                  fontSize: screenWidth*0.05,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                        ],
                        Text("${item['arabic']}",
                            textAlign: TextAlign.right,
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                               fontSize: screenWidth*0.05, height: screenHeight*0.003,
                                fontFamily: 'QuranFont')),
                        const SizedBox(height: 6),
                        Text("${item['urdu']}",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: screenWidth*0.04,color:Color(0xFF6A4D3B),)),
                        const SizedBox(height: 6),
                        Text("${item['english']}",
                            style:TextStyle(fontSize: screenWidth*0.04,)),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
