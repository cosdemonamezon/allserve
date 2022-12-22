import 'package:allserve/Screen/Widgets/PhoneFieldWidget.dart';
import 'package:allserve/Screen/Widgets/TextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/AppController.dart';

class ProfilePratnerScreen extends StatefulWidget {
  ProfilePratnerScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePratnerScreen> createState() => _ProfilePratnerScreenState();
}

class _ProfilePratnerScreenState extends State<ProfilePratnerScreen> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final user = context.read<AppController>().user;
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            'ดำเนินการเรียบร้อย',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          content: Text(
                            'ต้องการออกจากหน้านี้หรือไม่',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: Text(
                                'ยกเลิก',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                // ),
                              ),
                              onPressed: () => Navigator.of(context)
                                ..pop()
                                ..pop(),
                            )
                          ],
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    elevation: 0,
                    highlightElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                // MaterialButton(
                //   onPressed: () {},
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   color: Colors.white.withOpacity(0.1),
                //   elevation: 0,
                //   highlightElevation: 0,
                //   hoverElevation: 0,
                //   focusElevation: 0,
                //   child: Text("Reset", style: TextStyle(color: Colors.blue)),
                // ),
              ],
            ),
          ),
          body: Form(
            key: profileForm,
            child: ListView(
              primary: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 8,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 100,
                          child: ClipOval(
                              child: Image.network(
                            user!.image!,
                            width: 200,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) => Center(
                              child: Image.asset('assets/images/No_Image_Available.jpg'),
                            ),
                          )),
                        ),
                      ),
                      // Center(
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.all(Radius.circular(10)),
                      //     child: Image.network(
                      //       user!.image!,
                      //       height: 185,
                      //       width: 185,
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                TextFieldWidget(
                  onSaved: (input) => username.text = input!,
                  validator: (input) => input!.length < 3 ? "Should be more than 3 letters" : null,
                  initialValue: username.text,
                  hintText: user.name,
                  labelText: "Company",
                  iconData: Icons.person_outline,
                ),
                TextFieldWidget(
                  onSaved: (input) => email.text = input!,
                  validator: (input) => !input!.contains('@') ? "Should be a valid email" : null,
                  initialValue: email.text,
                  hintText: user.email,
                  labelText: "Email",
                  iconData: Icons.alternate_email,
                ),
                PhoneFieldWidget(
                    labelText: "Phone Number",
                    hintText: user.phone,
                    initialCountryCode: 'TH',
                    initialValue: phonenumber.text,
                    // onSaved: (phone) {
                    //   return controller.user.value.phoneNumber = phone.completeNumber;
                    // },
                    suffix: Text(
                      "Verified",
                      style: TextStyle(color: Colors.green),
                    )
                    // : Text(
                    //     "Not Verified".tr,
                    //     style: Get.textTheme.caption.merge(TextStyle(color: Colors.redAccent)),
                    //   ),
                    ),
                TextFieldWidget(
                  onSaved: (input) => address.text = input!,
                  validator: (input) => input!.length < 3 ? "Should be more than 3 letters" : null,
                  initialValue: address.text,
                  hintText: "123 Street, City 136, State, Country",
                  labelText: "Address",
                  iconData: Icons.map_outlined,
                ),
                // TextFieldWidget(
                //     labelText: "Password",
                //     hintText: "••••••••••••",
                //     onSaved: (input) => password.text = input!,
                //     onChanged: (input) => password.text = input,
                //     validator: (input) =>
                //         input!.length > 0 && input.length < 3 ? "Should be more than 3 letters" : null,
                //     initialValue: password.text,
                //     obscureText: true,
                //     iconData: Icons.lock_outline,
                //     keyboardType: TextInputType.visiblePassword,
                //     suffixIcon: IconButton(
                //       onPressed: () {},
                //       color: Theme.of(context).focusColor,
                //       icon: Icon(Icons.visibility_outlined
                //           //Icons.visibility_off_outlined
                //           ),
                //     )),
              ],
            ),
          ),
        );
      },
    );
  }
}
