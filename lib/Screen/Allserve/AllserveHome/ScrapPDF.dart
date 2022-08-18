import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class ScrapPDF extends StatefulWidget {
  final String? path;
  ScrapPDF({Key? key,this.path}) : super(key: key);

  @override
  State<ScrapPDF> createState() => _ScrapPDFState();
}

class _ScrapPDFState extends State<ScrapPDF> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เอกสารใบสั่งซื้อ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: PDFView(
        filePath: widget.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
      ),
    );
  }
}