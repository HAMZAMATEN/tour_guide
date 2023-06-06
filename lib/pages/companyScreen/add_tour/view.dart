import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tours_guide/ReUsable/Components/app_colors.dart';
import 'package:tours_guide/ReUsable/Components/round_button.dart';
import 'package:tours_guide/pages/companyScreen/add_tour/controller.dart';

class CompanyAddTourScreen extends GetView<CompanyAddTourController> {
  CompanyAddTourScreen({Key? key}) : super(key: key);

  Widget _textField(TextEditingController contr, FocusNode focNode,
      String labelText, String descrip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        controller: contr,
        focusNode: focNode,
        validator: (value) {},
        onFieldSubmitted: (value) {},
        decoration: InputDecoration(
          hintText: descrip,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(40.r),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCatList() {
    return Obx(
      () => Expanded(
        flex: 0,
        child: DropdownButton(
          iconEnabledColor: AppColors.SuccessColor,
          iconSize: 40.0.h,
          hint: controller.state.catValue.value == ""
              ? Text("Category")
              : Text(controller.state.catValue.value),
          items: [
            DropdownMenuItem(
              child: Text("Adventure"),
              value: "Adventure",
            ),
            DropdownMenuItem(
              child: Text("Cultural"),
              value: "Cultural",
            ),
            DropdownMenuItem(
              child: Text("Hiking"),
              value: "Hiking",
            ),
            DropdownMenuItem(
              child: Text("Mountains"),
              value: "Mountains",
            ),
          ],
          onChanged: (String? value) {
            controller.state.catValue.value = value!;
          },
        ),
      ),
    );
  }

  Widget _buildPeopleList() {
    return Obx(
      () => Expanded(
        flex: 0,
        child: DropdownButton(
          iconEnabledColor: AppColors.SuccessColor,
          iconSize: 40.0.h,
          hint: controller.state.tourPeople.value == ""
              ? Text("1 to 10")
              : Text(controller.state.tourPeople.value),
          items: [
            DropdownMenuItem(
              child: Text("1"),
              value: "1",
            ),
            DropdownMenuItem(
              child: Text("2"),
              value: "2",
            ),
            DropdownMenuItem(
              child: Text("3"),
              value: "3",
            ),
            DropdownMenuItem(
              child: Text("4"),
              value: "4",
            ),
            DropdownMenuItem(
              child: Text("5"),
              value: "5",
            ),
            DropdownMenuItem(
              child: Text("6"),
              value: "6",
            ),
            DropdownMenuItem(
              child: Text("7"),
              value: "7",
            ),
            DropdownMenuItem(
              child: Text("8"),
              value: "8",
            ),
            DropdownMenuItem(
              child: Text("9"),
              value: "9",
            ),
            DropdownMenuItem(
              child: Text("10"),
              value: "10",
            ),
          ],
          onChanged: (String? value) {
            controller.state.tourPeople.value = value!;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: SafeArea(
            child: SingleChildScrollView(
          // reverse: true,

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  child: InkWell(
                    onTap: () {
                      _showCustomDialog(context, controller);
                    },
                    child: Container(
                      height: 150.h,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: controller.image == null
                            ? Icon(
                                Icons.person,
                                size: 50,
                              )
                            : Image.file(
                                File(controller.image!.path).absolute,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                _textField(
                    controller.state.titleController,
                    controller.state.titleNode,
                    "Title",
                    "Enter name for your tour"),
                _textField(
                    controller.state.locationController,
                    controller.state.locationNode,
                    "Location",
                    "Enter Location of your tour"),
                _textField(
                    controller.state.priceController,
                    controller.state.priceNode,
                    "Price",
                    "Enter Price for your tour in Rs"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text("Choose Category",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 20.sp)),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      _buildCatList(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text("No of People",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 20.sp)),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      _buildPeopleList(),
                    ],
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Tour Description",
                      hintText: "Enter long description about you tour",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      )),
                  maxLines: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: RoundButton(
                    title: "Add Tour",
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

void _showCustomDialog(
    BuildContext context, CompanyAddTourController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose an Option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                print("insdie camera code");
                controller.pickedImageFromCamera(context);

                // Handle Camera onTap
                // _handleCameraTap(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                controller.pickedImageFromGallery(context);
                // Handle Gallery onTap
                // _handleGalleryTap(context);
              },
            ),
          ],
        ),
      );
    },
  );
}