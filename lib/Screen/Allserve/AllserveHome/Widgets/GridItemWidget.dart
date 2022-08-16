import 'package:allserve/Screen/Allserve/AllserveHome/LogisticScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/RecruitScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/ScrapScreen.dart';
import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  GridItemWidget({Key? key, required this.data, required this.press})
      : super(key: key);
  Map<String, dynamic> data;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.deepOrange.withOpacity(0.08),
      onTap: () {
        if (data['name'] == "Recruit") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RecruitScreen()));
        }else if(data['name'] == "Scrap Environment"){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScrapScreen()));
        }else if(data['name'] == "Logistic"){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LogisticScreen()));
        }
        else{}
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(1),
                      Colors.blueAccent.withOpacity(0.1)
                    ],
                    begin: AlignmentDirectional.topStart,
                    //const FractionalOffset(1, 0),
                    end: AlignmentDirectional.bottomEnd,
                    stops: [0.1, 0.9],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Image.asset(
                data['imgurl'],
                //color: Colors.blue,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data['name'],
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: false,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
