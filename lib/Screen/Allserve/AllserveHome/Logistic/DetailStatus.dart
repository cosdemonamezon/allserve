import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines/timelines.dart';

class DetailStatus extends StatefulWidget {
  DetailStatus({Key? key}) : super(key: key);

  @override
  State<DetailStatus> createState() => _DetailStatusState();
}

class _DetailStatusState extends State<DetailStatus> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.7227321875, 100.766264232),
    zoom: 15.4746,
  );

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 100.766264232,
      target: LatLng(13.7227321875, 100.766264232),
      tilt: 13.7227321875,
      zoom: 14.151926040649414);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                width: size.width * 0.95,
                //color: Colors.redAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimelineTile(
                      // oppositeContents: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text('opposite\ncontents'),
                      // ),
                      contents: Card(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text('ลาดกระบัง 21/08/65'),
                        ),
                      ),
                      node: TimelineNode(
                        indicator: DotIndicator(),
                        //startConnector: SolidLineConnector(),
                        endConnector: SizedBox(
                            height: size.height * 0.05,
                            child: SolidLineConnector()),
                      ),
                    ),
                    TimelineTile(
                      oppositeContents: Card(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text('อ่อนนุชซอย  21/08/65'),
                        ),
                      ),
                      // contents: Card(
                      //   child: Container(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Text('contents'),
                      //   ),
                      // ),
                      node: TimelineNode(
                        indicator: DotIndicator(),
                        startConnector: SizedBox(
                            height: size.height * 0.05,
                            child: SolidLineConnector()),
                        endConnector: SizedBox(
                            height: size.height * 0.05,
                            child: DashedLineConnector()),
                      ),
                    ),
                    TimelineTile(
                      // oppositeContents: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text('opposite\ncontents'),
                      // ),
                      contents: Card(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text('หนองจอก 21/08/65'),
                        ),
                      ),
                      node: TimelineNode(
                        indicator: OutlinedDotIndicator(),
                        startConnector: SizedBox(
                            height: size.height * 0.05,
                            child: DashedLineConnector()),
                        //endConnector: DashedLineConnector(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                //color: Colors.blueAccent,
                height: size.height * 0.77,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
