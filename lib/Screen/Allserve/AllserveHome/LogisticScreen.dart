import 'package:flutter/material.dart';

class LogisticScreen extends StatefulWidget {
  LogisticScreen({Key? key}) : super(key: key);

  @override
  State<LogisticScreen> createState() => _LogisticScreenState();
}

class _LogisticScreenState extends State<LogisticScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Logistic Page'),
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
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
              child: Row(
                children: [
                  Text('Package size'),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: size.width * 0.09,
                    height: size.height * 0.15,
                    child: Column(
                      children: [
                        SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.18,
                            child: Image.asset(
                              'assets/icons/box1.png',
                              fit: BoxFit.fill,
                            )),
                        Text('1 - 10 kg')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: size.width * 0.09,
                    height: size.height * 0.15,
                    child: Column(
                      children: [
                        SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.18,
                            child: Image.asset(
                              'assets/icons/box2.png',
                              fit: BoxFit.fill,
                            )),
                        Text('20 - 30 kg')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: size.width * 0.09,
                    height: size.height * 0.15,
                    child: Column(
                      children: [
                        SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.18,
                            child: Image.asset(
                              'assets/icons/box3.png',
                              fit: BoxFit.fill,
                            )),
                        Text('40 - 50 kg')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
              child: Row(
                children: [
                  Text('Service'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
