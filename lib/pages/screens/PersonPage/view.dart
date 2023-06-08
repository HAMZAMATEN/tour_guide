import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tours_guide/ReUsable/Components/app_colors.dart';
import 'package:tours_guide/ReUsable/Components/drawer.dart';
import 'package:tours_guide/pages/screens/PersonPage/update.dart';
import 'package:tours_guide/pages/sessionPages/sigin/view.dart';

import '../../../ReUsable/models/userModel.dart';
import 'controller.dart';

class PersonView extends GetView<PersonController> {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer.buildDrawer(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: controller.getUsersData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userModel = snapshot.data as UserModel;
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: ListTile(
                              onTap: () {
                                Get.to(() => UpdateScreen());
                              },
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0.w,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: controller.image == null
                                      ? userModel.photoUrl == ''
                                          ? Icon(
                                              Icons.person,
                                              size: 50,
                                              color: Colors.white,
                                            )
                                          : Image(
                                              image: NetworkImage(
                                                  userModel.photoUrl),
                                              fit: BoxFit.cover,
                                            )
                                      : Image.file(
                                          File(controller.image!.path).absolute,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              title: Text(
                                userModel.email,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(userModel.phone,
                                  style: TextStyle(color: Colors.white)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    leading: Icon(
                                      Icons.notifications,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      'Notifications',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.radio_button_on,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 5,
                                ),
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.dark_mode_outlined,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      'Dark Mode',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.radio_button_on_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 270,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'What\'s new',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.white, height: 5),
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'FAQ\'s / Contact us',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.grey, height: 5),
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'Community Guidelines',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.grey, height: 5),
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'Term of use',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.grey, height: 5),
                                Container(
                                  height: 50,
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'Privacy Policy',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                final auth = FirebaseAuth.instance;
                                auth.signOut().then((value) {
                                  Get.to(SignInPage());
                                  Get.snackbar(
                                    'Congrats',
                                    'Successfully logOut ',
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.green,
                                    backgroundColor:
                                        Colors.green.withOpacity(0.1),
                                  );
                                }).onError((error, stackTrace) {
                                  Get.snackbar(
                                    'Error',
                                    'Something went wrong + ' +
                                        error.toString(),
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.green,
                                    backgroundColor:
                                        Colors.green.withOpacity(0.1),
                                  );
                                });
                              },
                              child: InkWell(
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.buttonBgColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  controller.signOut();
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text("Login as Admin"),
                              onPressed: () {},
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              child: Text("Login as User"),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Text('Something went wrong');
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
