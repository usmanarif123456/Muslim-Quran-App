import 'package:flutter/material.dart';

class AboutQuran extends StatelessWidget {
  const AboutQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Quran Sources'),
        backgroundColor: Color(0xFF6A4D3B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Text(
            '''
📖 **قرآن مجید کا ڈیٹا**

قرآن کا عربی متن، سورت، پارہ، رکوع کی معلومات حاصل کی گئی:

• From: Tanzil.net – Accurate Uthmani script Quran text  
• From: Quran.com API – JSON-based surah, ayah, translation & audio  
• From: alquran.cloud – Surah, Ayah, Translations (Urdu, English)  
• From: fawazahmed0/quran-api (GitHub) – Offline Quran JSON with multiple translations  
• From: Indo-Pak style Parah & Ruku breakdowns via semarketir/quranjson  

📜 **احادیث (صحیح بخاری، مسلم، ترمذی وغیرہ)**

احادیث کا ترجمہ، عربی متن اور تشریحات حاصل کی گئیں:

• From: Sunnah.com – Arabic & English texts of Sahih Bukhari, Muslim, Abu Dawood, etc.  
• From: HadithCollection.com – Urdu translations (available via public scraping or datasets)  
• From: maktabah.org or scanned books in PDF (if Urdu books used)  

🕋 **اذکار و دعائیں (Azkaar & Daily Duas)**

اذکار کا ڈیٹا درج ذیل جگہوں سے لیا گیا:

• From: Hisnul Muslim (Fortress of the Muslim) – Arabic, Urdu, English versions  
• From: IslamicFinder.org  
• From: duas.com – Daily Azkaar, Quranic Duas  
• From: Manually entered from authentic books like Muntakhab Ahadith or Daily Duas from Darussalam  
''',
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontFamily: 'NotoNastaliqUrdu',
              color: Colors.black,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
