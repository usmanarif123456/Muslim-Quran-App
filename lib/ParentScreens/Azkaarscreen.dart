// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:muslim_history_app/ParentScreens/seerahscreen.dart';
import 'package:muslim_history_app/screens/Detailed_Azkaar.dart';
import 'package:muslim_history_app/screens/about_quran.dart';

class AzkaarScreen extends StatefulWidget {
  const AzkaarScreen({super.key});

  @override
  State<AzkaarScreen> createState() => _AzkaarScreenState();
}

class _AzkaarScreenState extends State<AzkaarScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0XFFF6EAD9),
        //backgroundColor: Color(0xFFE0F7FA), // Light Cyan
         //backgroundColor: Color(0xFFF5F5F5), // Light grey
//backgroundColor: Colors.white,
// backgroundColor: Color(0xFFF4F4F3),
         //backgroundColor: Color(0xFFFFF8E1),
        title: Center(
            child: Text(
          'Azkaar',
          textAlign: TextAlign.center,
          style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: Color(0xFF6A4D3B),
                  fontWeight: FontWeight.bold
                  
                  ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.08,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(onTap: () {
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
                                "Prophet Seerah",
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
                    ]),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.07,
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
                                builder: (context) => DetailedAzkaar(
                                    title: "Morning Azkaar",
                                    jsonFile:
                                        "assets/Azkaar/morning_azkaar.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/morning.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Morning\nAzkaars',
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Night Azkaars",
                                    jsonFile:
                                        "assets/Azkaar/night_azkaars.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/night.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Night\nAzkaars'))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Evening Azkaars",
                                    jsonFile:
                                        "assets/Azkaar/evening_azkaar.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/evening.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Evening\nAzkaars'))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Namaz-e-Janaza",
                                    jsonFile:
                                        "assets/Azkaar/namaz_e_janaza.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/NamazJanaza.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Namaz-e-Janaza'))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Namaz",
                                    jsonFile:
                                        "assets/Azkaar/namaz.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/Namaz.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Namaz'))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Quran",
                                    jsonFile:
                                        "assets/Azkaar/quranic_Duain.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/quran (2).png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Quranic Duain'))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.07,
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
                                builder: (context) => DetailedAzkaar(
                                    title: "Darood Sharif",
                                    jsonFile:
                                        "assets/Azkaar/darood_sharif.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/Darood.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Darood Sharif'))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Asma-ul-Husna",
                                    jsonFile:
                                        "assets/Azkaar/Allah_Names.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/Allah.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Asma ul Husna '))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedAzkaar(
                                    title: "Kalmas",
                                    jsonFile:
                                        "assets/Azkaar/kalmas.json")));
                      },
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/kalma.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Center(child: Text('Kalmas'))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
