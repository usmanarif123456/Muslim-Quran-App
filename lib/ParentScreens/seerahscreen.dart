import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class SeerahPDFScreen extends StatefulWidget {
  const SeerahPDFScreen({super.key});

  @override
  State<SeerahPDFScreen> createState() => _SeerahPDFScreenState();
}

class _SeerahPDFScreenState extends State<SeerahPDFScreen> {
  String? localPath;
  bool isLoading = true;
  int? totalPages;
  final TextEditingController _searchController = TextEditingController();
  // ignore: unused_field
  final PDFViewController? _pdfViewController = null;
  int currentPage = 0;

  PDFViewController? pdfController;

  @override
  void initState() {
    super.initState();
    _preparePdf();
  }

  Future<void> _preparePdf() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/seerah.pdf';
      final file = File(filePath);

      // Copy only if not already copied
      if (!await file.exists()) {
        final byteData = await rootBundle.load('assets/seerah/seerah.pdf');
        await file.writeAsBytes(byteData.buffer.asUint8List());
      }

      setState(() {
        localPath = file.path;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _jumpToPage() {
    final input = _searchController.text.trim();
    if (input.isEmpty || pdfController == null) return;

    final pageNumber = int.tryParse(input);
    if (pageNumber != null &&
        pageNumber > 0 &&
        totalPages != null &&
        pageNumber <= totalPages!) {
      pdfController!.setPage(pageNumber - 1); // Page is 0-based
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid page number")),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seerah PDF'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Go to Page'),
                  content: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter page number',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _jumpToPage();
                      },
                      child: const Text('Go'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : localPath != null
              ? PDFView(
                  filePath: localPath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  onRender: (pages) {
                    setState(() {
                      totalPages = pages;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    pdfController = vc;
                  },
                  onError: (error) {
                    print('PDF error: $error');
                  },
                )
              : const Center(child: Text('Failed to load PDF')),
    );
  }
}
