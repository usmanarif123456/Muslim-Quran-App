// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_history_app/ParentScreens/Azkaarscreen.dart';
import 'package:muslim_history_app/ParentScreens/Hadithscreen.dart';
import 'package:muslim_history_app/ParentScreens/Quran_Screen.dart';
import 'package:muslim_history_app/ParentScreens/seerahscreen.dart';

//import 'package:muslim_history_app/Quran_Screen.dart';
import 'package:muslim_history_app/models/azkaar_model.dart';

import 'package:muslim_history_app/models/hadith_model.dart';

//import 'package:muslim_history_app/loadazkaar.dart';
import 'package:muslim_history_app/models/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  Ayah? randomAyah;
  bool showEnglish = false;
  HadithModel? randomHadith;
  AzkaarModel? randomAzkaar;

  //int iconSelected = -1;

  @override
  void initState() {
    super.initState();
    loadAyahOfTheMoment();
    loadHadith();
    loadAzkaar();
  }

  Future<void> loadAyahOfTheMoment() async {
    final String response =
        await rootBundle.loadString('assets/quran/quran_combined.json');
    final List<dynamic> data = json.decode(response);
    final List<Ayah> ayahs = data.map((e) => Ayah.fromJson(e)).toList();

    final random = Random();
    if (mounted) {
      setState(() {
        randomAyah = ayahs[random.nextInt(ayahs.length)];
      });
    }
  }

  Future<void> loadAzkaar() async {
    final String response =
        await rootBundle.loadString('assets/Azkaar/azkaar_combined.json');
    final List<dynamic> data = json.decode(response);
    // ignore: non_constant_identifier_names
    final List<AzkaarModel> Azkaars =
        data.map((e) => AzkaarModel.fromJson(e)).toList();

    final random = Random();
    if (mounted) {
      setState(() {
        randomAzkaar = Azkaars[random.nextInt(Azkaars.length)];
      });
    }
  }

  Future<void> loadHadith() async {
    final String response =
        await rootBundle.loadString('assets/hadith/hadith_combined.json');
    final List<dynamic> data = json.decode(response);
    final List<HadithModel> hadith =
        data.map((e) => HadithModel.fromJson(e)).toList();

    final random = Random();
    if (mounted) {
      setState(() {
        randomHadith = hadith[random.nextInt(hadith.length)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 246, 253, 245),
          backgroundColor: Color(0xFFFDF8F3),
          leadingWidth: 2,
          leading: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share_rounded,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.info, color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            ),
          ),
          title: Center(
            child: Text(
              'Muslims Studio',
              style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: Color(0xFF6A4D3B),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(children: [
              Container(
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  children: List.generate(3, (index) {
                    IconData icon;
                    if (index == 0) {
                      icon = Icons.bookmark;
                    } else if (index == 1) {
                      icon = Icons.star;
                    } else {
                      icon = Icons.message;
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                            if (index == 0) {
                              loadAyahOfTheMoment();
                            } else if (index == 1) {
                              loadHadith();
                            } else
                              (loadAzkaar());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: selected == index
                                ? Color(0xFF6A4D3B)
                                : Color(0XFFF6EAD9),
                            border: Border.all(

                                /*  right: index < 2
                                  ? BorderSide(color: Color(0xFF6A4D3B),)
                                  : BorderSide.none,*/
                                ),
                          ),
                          child: Center(
                            child: Icon(icon, size: screenWidth * 0.06),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                ),
                child: selected == 1
                    ? (randomHadith == null
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Hadith Of The Moment',
                                style: TextStyle(
                                  color: Color(0xFF6A4D3B),
                                  fontWeight: FontWeight.w900,
                                  fontSize: screenWidth * 0.05,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              Text(
                                'Hadith #${randomHadith!.id}\n${randomHadith!.arabic}',
                                style: TextStyle(
                                  fontFamily: 'QuranFont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05, height: screenHeight*0.003,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                showEnglish
                                    ? randomHadith!.english
                                    : randomHadith!.urdu,
                                textAlign: showEnglish
                                    ? TextAlign.left
                                    : TextAlign.right,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.04,
                                    right: screenWidth * 0.04),
                                child: Container(
                                  height: screenHeight * 0.06,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0XFFF6EAD9)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showEnglish = !showEnglish;
                                        });
                                      },
                                      child: Text(
                                        showEnglish
                                            ? 'Show Urdu Translation'
                                            : 'Translate it in English',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    : selected == 2
                        ? (randomAzkaar == null
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Azkaar of the moment',
                                    style: TextStyle(
                                      color: Color(0xFF6A4D3B),
                                      fontWeight: FontWeight.w900,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                  Text(
                                    randomAzkaar!.category,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.05),
                                  ),
                                  SizedBox(),
                                  Text(
                                    randomAzkaar!.arabic,
                                    style: TextStyle(
                                      fontFamily: 'QuranFont',
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.05, height: screenHeight*0.003,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  Text(
                                    showEnglish
                                        ? randomAzkaar!.english
                                        : randomAzkaar!.urdu,
                                    textAlign: showEnglish
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.04,
                                        right: screenWidth * 0.04),
                                    child: Container(
                                      height: screenHeight * 0.06,
                                      // width: screenWidth*0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(),
                                          color: Color(0XFFF6EAD9)),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showEnglish = !showEnglish;
                                            });
                                          },
                                          child: Text(
                                            showEnglish
                                                ? 'Show Urdu Translation'
                                                : 'Translate it in English',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        : randomAyah == null
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Ayah Of The Moment',
                                    style: TextStyle(
                                      color: Color(0xFF6A4D3B),
                                      fontWeight: FontWeight.w900,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                  Text(
                                    randomAyah!.arabic,
                                    style: TextStyle(
                                      fontFamily: 'QuranFont',
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.06,
                                       height: screenHeight*0.003,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  Text(
                                    showEnglish
                                        ? randomAyah!.english
                                        : randomAyah!.urdu,
                                    textAlign: showEnglish
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.04,
                                        right: screenWidth * 0.04),
                                    child: Container(
                                      height: screenHeight * 0.06,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0XFFF6EAD9),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showEnglish = !showEnglish;
                                            });
                                          },
                                          child: Text(
                                            showEnglish
                                                ? 'Show Urdu Translation'
                                                : 'Translate it in English',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuranScreen()));
                  },
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03, top: screenWidth * 0.02),
                        child: Text(
                          'Read & Understand Quran',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A4D3B),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: SizedBox(
                                width: screenWidth * 0.6,
                                child: Text(
                                  '"Discover the timeless wisdom of the Holy Quran with easy translations in Urdu and English.'
                                  ' Strengthen your connection with Allah by understanding each verse with clarity and reflection."',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: screenWidth * 0.04,

                              /// bottom: screenHeight * 0.1
                            ),
                            child: Image.asset(
                              "assets/images/Quran.png",
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.08,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                //height: screenHeight * 0.32,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Read Islamic Books',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6A4D3B),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AzkaarScreen()));
                                    },
                                    child: Image.asset(
                                      "assets/images/azkaar.png",
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.15,
                                    ),
                                  ),
                                  SizedBox(
                                      width: screenWidth * 0.13,
                                      child: Center(
                                          child: Text(
                                        "Azkaar & Duain",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.02),
                                      )))
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HadithScreens()));
                                    },
                                    child: Image.asset(
                                      "assets/images/books.png",
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.26,
                                    ),
                                  ),
                                  Text(
                                    'Hadith books',
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.02),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              SeerahPDFScreen())));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/Muhammad.png",
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.15,
                                    ),
                                    //SizedBox(height: 12,),
                                    SizedBox(
                                        width: screenWidth * 0.14,
                                        child: Text(
                                          'Seerat-un-Nabi (SAW)',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.02),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
