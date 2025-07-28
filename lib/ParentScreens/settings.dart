import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Color(0xFFFDF8F3),
        title: Center(child: const Text('Settings')),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms & Conditions'),
            onTap: () {
              _showDialog(
                context,
                'Terms & Conditions',
                '''
By using this app, you agree to use it only for educational and personal purposes. The content provided (Quranic verses, translations, and other materials) is intended to enhance your knowledge and spirituality.

The app does not guarantee complete accuracy, and users are advised to cross-reference with trusted sources if needed. Unauthorized copying or distribution of the app or its content is not allowed.
                ''',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              _showDialog(
                context,
                'Privacy Policy',
                '''
This app does not collect, store, or share any personal user data.

All content is accessed offline. No internet connection is required, and no user tracking, analytics, or data storage occurs.

We respect your privacy fully in accordance with Islamic values.
                ''',
              );
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: Text(content)),
        actions: [
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
