import 'package:allserve/Screen/Register/RegisterAllserveScreen.dart';
import 'package:allserve/Screen/Register/RegisterPartnerScreen.dart';
import 'package:allserve/Screen/Register/RegisterScreen.dart';
import 'package:allserve/Screen/Widgets/ButtonJobSelect.dart';
import 'package:flutter/material.dart';

class SelectRegister extends StatefulWidget {
  SelectRegister({Key? key}) : super(key: key);

  @override
  State<SelectRegister> createState() => _SelectRegisterState();
}

class _SelectRegisterState extends State<SelectRegister> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เลือกวิธีการสมัคร',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.70,
                  child: ButtonJobSelect(
                    text: 'สมัคร Alljob',
                    color: Colors.blue,
                    textColor: Colors.white,
                    iconImage: 'assets/icons/note-text.svg',
                    iconColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.70,
                  child: ButtonJobSelect(
                    text: 'สมัคร AllPartner',
                    color: Colors.blue,
                    textColor: Colors.white,
                    iconImage: 'assets/icons/note-text.svg',
                    iconColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPartnerScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.70,
                  child: ButtonJobSelect(
                    text: 'สมัคร Allserve',
                    color: Colors.blue,
                    textColor: Colors.white,
                    iconImage: 'assets/icons/note-text.svg',
                    iconColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterAllserveScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
