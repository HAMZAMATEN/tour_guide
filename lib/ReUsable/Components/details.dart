import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'app_bar.dart';

class DetailScreen extends StatefulWidget {
  final String img;
  final String title;
  final String price;
  final String location;
  final String des;

  DetailScreen(
      {Key? key,
      required this.title,
      required this.price,
      required this.location,
      required this.des,
      required this.img})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.img),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.back();
                  },
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: PostBottomBar(
            title: widget.title,
            price: widget.price,
            location: widget.location,
            des: widget.des),
      ),
    );
  }
}

class PostBottomBar extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String des;

  const PostBottomBar({
    Key? key,
    required this.title,
    required this.price,
    required this.location,
    required this.des,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              Icons.location_on_outlined,
                              color: Colors.deepOrange,
                              size: 17.sp,
                            ),
                            Text(
                              location,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.sp
                                      // fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              price,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                // fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '/per person',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 80.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black54, blurRadius: 4),
                          ],
                        ),
                        child: Icon(
                          Icons.bookmark_border_outlined,
                          size: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 25.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
