// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:muslim_history_app/screens/detailed_Hadith.dart';

class HadithScreens extends StatefulWidget {
  const HadithScreens({super.key});

  @override
  State<HadithScreens> createState() => _HadithScreensState();
}

class _HadithScreensState extends State<HadithScreens> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String,dynamic>> HadithBooksNames = [
    {
      'title':' Sahih al-Bukhari',
      'icon':Icons.menu_book,
      'color':Color(0xFF007B83)
    },
   { 
    "title":"Sunan Abu Dawood",
    'icon':Icons.menu_book,
    'color':Color(0xFFF4A261)
   },
    {
      "title":'Sunan Ibn Majah',
      'icon':Icons.menu_book,
      'color':Color(0xFFE76F51)
      },

    {
      "title":'Sunan_Nasai',
      'icon':Icons.menu_book,
      'color':Color(0xFF2A9D8F)
      },
  ];
  bool isSearching = false;
  List<Map<String,dynamic>> filteredHadithBooks = [];
  @override
  void initState() {
    super.initState();
    filteredHadithBooks = List<Map<String, dynamic>>.from(HadithBooksNames);
  }

  void filtered(String query) {
    setState(() {
      filteredHadithBooks = HadithBooksNames.where(
          (item) => item['title'].toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     //
     
     // backgroundColor: Color(0xFFF4F4F3),
      appBar: AppBar(
          // backgroundColor: Colors.amber, 
          backgroundColor:  Color(0XFFF6EAD9),
          title: Center(
              child: Text(
        'Hadith',
        style: TextStyle(color:Color(0xFF6A4D3B),fontWeight: FontWeight.bold,
        fontSize: screenWidth*0.055
        ),
      ))),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.07,
            child: Row(
              children: [
                Expanded(
                  child: Focus(
                    onFocusChange: (hasfocus) {
                      setState(() {
                        isSearching = hasfocus;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xFF6A4D3B),),
                          ),
                          hintText: ('Search Hadith books'),
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          prefixIcon: Icon(Icons.search,color: Color(0xFFA0A4A8),),
                          fillColor:  Color(0XFFF6EAD9),
                          //Color(0xFFF1F3F5),
                          filled: true,
                        ),
                        onChanged: filtered,
                      ),
                    ),
                  ),
                ),
                if (isSearching)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        searchController.clear();
                      });
                    },
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.black)),
                  )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filteredHadithBooks.length,
                itemBuilder: (context, index) {
                  final book=HadithBooksNames[index];
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: screenHeight * 0.17,
                      decoration: BoxDecoration(
                          color: Colors.white
                          ,
                          borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF6A4D3B),)
                        ),
                      child: ListTile(
                        leading:Icon(book['icon'],color: book['color'],) ,
                        title: Text(
                          filteredHadithBooks[index]["title"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Authentic Saying Of Prophet Muhammad (PBUH)'),
                        onTap: () {
                          String selectedBook = filteredHadithBooks[index]["title"];
                          String jsonFile = '';
                          switch (selectedBook) {
                            case 'Sahih al-Bukhari':
                              jsonFile = 'hadith_combined.json';
                              break;

                            case 'Sunan Abu Dawood':
                              jsonFile = 'sunan_abi_dawood_all.json';
                              break;

                            case 'Sunan Ibn Majah':
                              jsonFile = 'sunan_ibn_majah_all.json';
                              break;

                            case 'Sunan_Nasai':
                              jsonFile = 'sunan_nasai_all.json';
                              break;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedHadith(
                                        bookTitle: filteredHadithBooks[index]["title"],
                                        jsonFile: jsonFile,
                                      )));
                        },
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
