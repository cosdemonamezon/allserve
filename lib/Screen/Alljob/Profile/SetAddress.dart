import 'package:flutter/material.dart';

class SetAddress extends StatefulWidget {
  SetAddress({Key? key}) : super(key: key);

  @override
  State<SetAddress> createState() => _SetAddressState();
}

class _SetAddressState extends State<SetAddress> {
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(vertical: 5, horizontal: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ที่อยู่ของคุณ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: padding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('ที่อยู่',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.star,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('บริษัท ทดลอง จำกัด'),
                      subtitle: Text(
                          '503/32 อาคาร เค.เอส.แอล. ทาวเวอร์, ชั้น 18, ถนนศรีอยุธยา แขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400'),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          '+ เพิ่มที่อยู่',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
