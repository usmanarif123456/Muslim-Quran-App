// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailedHadith extends StatefulWidget {
  final String bookTitle;
  final String jsonFile;
  const DetailedHadith(
      {super.key, required this.bookTitle, required this.jsonFile});

  @override
  State<DetailedHadith> createState() => _DetailedHadithState();
}

List HadithList = [];

class _DetailedHadithState extends State<DetailedHadith> {
  @override
  void initState() {
    super.initState();
    loadHadith();
  }

  Future<void> loadHadith() async {
    final String jsonString =
        await rootBundle.loadString('assets/hadith/${widget.jsonFile}');
    final List decoded = jsonDecode(jsonString);
    if(mounted){
      setState(() {
      HadithList = decoded;
    });
    
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
         // backgroundColor: Colors.pink,
          backgroundColor: Color(0XFFF6EAD9),
          title: Center(child: Text(widget.bookTitle,style: TextStyle(color:Color(0xFF6A4D3B),fontWeight: FontWeight.bold,
        fontSize: screenWidth*0.055
        ),)),
        ),
        body: HadithList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: HadithList.length,
                itemBuilder: (context, index) {
                  final hadith = HadithList[index];
                  return ListTile(
                    title: Column(
                      children: [
                      //  Text("Hadith Number$hadith['id']??'no id"),
                      Text("Hadith Number ${hadith['id'] ?? 'no id'}",style: TextStyle(
                        color: Color(0xFF6A4D3B),fontWeight: FontWeight.bold,fontSize: screenWidth*0.05
                      ),),
                        Text(
                          hadith['arabic'] ?? 'No Arabic text',
                          style: TextStyle(fontFamily: 'QuranFont',fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),SizedBox(height: screenHeight*0.02,),
                        Text(
                          hadith['urdu'] ?? 'no urdu text',
                          textAlign: TextAlign.right,
                        )
                        ,SizedBox(height: screenHeight*0.02,),
                        Text(
                          hadith['english'] ?? 'no urdu text',
                          textAlign: TextAlign.left,
                        ),
                        Divider(thickness: screenHeight*0.02,)
                      ],
                    ),
                  );
                }));
  }
}
