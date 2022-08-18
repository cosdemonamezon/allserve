import 'package:flutter/material.dart';

class DetailProducts extends StatefulWidget {
  DetailProducts({Key? key}) : super(key: key);

  @override
  State<DetailProducts> createState() => _DetailProductsState();
}

class _DetailProductsState extends State<DetailProducts> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดสินค้าที่ต้องการซื้อ',
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFF3F3F3),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('การซื้อ'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text('ชื่อ :'),
                          Text(' คอมพิวเตอร์ และอุปกรณ์สำนักงาน'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text('จำนวน :'),
                          Text(' 1000 ชิ้น'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text('วันที่ใช้งาน :'),
                          Text(' 19/08/2022'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        //shape: CircularNotchedRectangle(),
        elevation: 25,
        child: Container(
          height: size.height * 0.10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.32,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                        child: Text(
                      'ยืนยัน',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
