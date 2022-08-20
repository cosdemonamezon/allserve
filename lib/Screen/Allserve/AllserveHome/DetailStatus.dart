import 'package:flutter/material.dart';

class DetailStatus extends StatefulWidget {
  DetailStatus({Key? key}) : super(key: key);

  @override
  State<DetailStatus> createState() => _DetailStatusState();
}

class _DetailStatusState extends State<DetailStatus> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สถานะขนส่ง',
          //style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}