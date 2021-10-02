import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
// import '../../../widgets/menu_widget.dart';
import '../../account_home/controllers/account_home_controller.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_new_account.dart';

class HomeView extends GetView<HomeController> {
  final _auth = Get.find<AuthController>();
  final _controller = Get.put(AccountHomeController());

  String subString(String name) {
    return name.substring(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getAccount(_auth.user!),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return InkWell(
                            onTap: () async {
                              Get.defaultDialog(
                                title: "Getting information",
                                content: Center(
                                  child: CircularProgressIndicator(),
                                ),
                                barrierDismissible: false,
                              );
                              await _controller
                                  .getAccountInfo(data['address'])
                                  .then((value) => Get.back());
                              Get.toNamed(
                                Routes.ACCOUNT_HOME + '?id=' + data['address'],
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                leading: CircleAvatar(
                                  child: Text(subString(data['name'])),
                                ),
                                title: Text(
                                  data['name'],
                                  style: GoogleFonts.openSans(fontSize: 20),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('You don\'t have any account yet, add some?'),
                    );
                  }
                  return Center(child: Text('Something went wrong'));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.bottomSheet(
          AddNewAccount(),
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        label: Text(
          'ADD NEW ACCOUNT',
          style: TextStyle(letterSpacing: 0.4),
        ),
        icon: Icon(Icons.add),
      ),
    );
  }
}
