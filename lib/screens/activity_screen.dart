import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:send_money/constants.dart';

import '../utils/loader.dart';

class ActivityScreen extends StatefulWidget {
  static const routeName = '/activity_screen';
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Activity',
                    style: kHeadingStyle1a,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // RideModel ride = RideModel.fromJson(
                      //     snapshot.data!.docs[index].data());
                      // print(snapshot.data!.docs[index].data());
                      // print(ride.distance);
                      return ActivityTile(
                          isVisa: index % 2 == 0 ? true : false,
                          bankName: 'NIG ',
                          cash: '40',
                          dateTime: DateTime.now());
                    },
                  )
                  // StreamBuilder(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('users')
                  //         .doc(FirebaseAuth.instance.currentUser!.uid)
                  //         .collection('rides').orderBy('dateTime',descending: true)
                  //         .snapshots(),
                  //     builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                  //     snapshot){
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return Padding(
                  //             padding: EdgeInsets.all(30.h), child: spinKit());
                  //       }
                  //       if (snapshot.data!.docs.isEmpty) {
                  //         return Align(
                  //             alignment: Alignment.topLeft,
                  //             child: Padding(
                  //               padding:
                  //               EdgeInsets.only(left: 20.0.w, top: 30.h),
                  //               child: Text(
                  //                 'There are no Activities',
                  //                 style: kBodyStyle8,
                  //               ),
                  //             ));
                  //       }
                  //       return ListView.builder(
                  //         scrollDirection: Axis.vertical,
                  //         shrinkWrap: true,
                  //         physics: const BouncingScrollPhysics(),
                  //         itemCount: snapshot.data!.docs.length,
                  //         itemBuilder: (context, index) {
                  //           // RideModel ride = RideModel.fromJson(
                  //           //     snapshot.data!.docs[index].data());
                  //           // print(snapshot.data!.docs[index].data());
                  //           // print(ride.distance);
                  //           return ActivityTile(kms: '22',  points:"22", isAlert: false);
                  //         },
                  //       );
                  //
                  //     }
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final bool isVisa;
  final String bankName;
  final String cash;
  final DateTime dateTime;
  const ActivityTile({
    Key? key,
    required this.isVisa,
    required this.bankName,
    required this.cash,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.w, 4.h),
              blurRadius: 4.r,
              color: Colors.black.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 33,
                  child: Container(
                    height: 76.h,
                    width: 76.w,
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                        child: Image.asset(
                      isVisa ? 'assets/visa.png' : 'assets/mater.png',
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0,
                          top: 5,
                          child: Text(
                            '${DateFormat.MMMd().format(dateTime)} - ${DateFormat.jm().format(dateTime)}',
                            style: kBodyStyle10,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
                        child: Text(
                          '$bankName Bank',
                          style: kBodyStyle9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '\$$cash',
              style: kBodyStyle9,
            )
          ],
        ),
      ),
    );
  }
}
