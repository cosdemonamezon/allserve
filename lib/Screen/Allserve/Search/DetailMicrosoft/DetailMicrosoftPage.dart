import 'package:allserve/Screen/Allserve/Search/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailMicrosoftPage extends StatefulWidget {
  const DetailMicrosoftPage({super.key, required this.id});
  final int id;
  @override
  State<DetailMicrosoftPage> createState() => _DetailMicrosoftPageState();
}

class _DetailMicrosoftPageState extends State<DetailMicrosoftPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    await context.read<SearchController>().microsoftDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'รายละเอียด',
          ),
        ),
        body: controller.detailMicrosoft == null
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: controller.detailMicrosoft?.image == null
                              // ? Center(child: CircularProgressIndicator())
                              ? Image.asset('assets/No_Image_Available.jpg')
                              : Image.network(controller.detailMicrosoft!.image!),
                        ),
                        Divider(
                          thickness: 5,
                        ),
                        Center(
                          child: Text(
                            controller.detailMicrosoft?.name ?? '',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Wrap(
                          children: [
                            Text('รายละเอียด:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              controller.detailMicrosoft?.description ?? '',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
