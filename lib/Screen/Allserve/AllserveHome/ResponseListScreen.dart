import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ResponseListScreen extends StatefulWidget {
  ResponseListScreen({Key? key}) : super(key: key);

  @override
  State<ResponseListScreen> createState() => _ResponseListScreenState();
}

class _ResponseListScreenState extends State<ResponseListScreen> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fromAsset('assets/images/reciept.pdf', 'reciept.pdf').then((f) {
      setState(() {
        corruptedPathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  List<Map<String, dynamic>> comtlist = [
    {
      "title": "บริษัท อาชาเทค สาขา A",
      "subtitle": "20,000",
    },
    {
      "title": "บริษัท อาชาเทค สาขา B",
      "subtitle": "50,000",
    },
    {
      "title": "บริษัท อาชาเทค สาขา C",
      "subtitle": "70,00",
    },
    {
      "title": "บริษัท อาชาเทค สาขา D",
      "subtitle": "80,000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการตอบรับใบเสนอราคา'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                    comtlist.length,
                    (index) => Column(
                          children: [
                            ListTile(
                              title: Text(comtlist[index]['title']),
                              subtitle: Text('ราคา ' + comtlist[index]['subtitle'] + ' บาท'),
                              trailing: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ScrapPDF(
                                  //               path: corruptedPathPDF,
                                  //             )));
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.08,
                                  color: Colors.blueAccent,
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 28,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
