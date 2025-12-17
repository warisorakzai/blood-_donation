import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Text(
            'More',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),

          Divider(),
          SizedBox(height: 50.h),

          Stack(
            clipBehavior: Clip.none,

            children: [
              Container(
                height: 150.h,
                decoration: BoxDecoration(color: Colors.redAccent),
              ),

              Positioned(
                top: -40.h,
                right: 155.h,
                child: CircleAvatar(radius: 40.h),
              ),
              Positioned(
                top: 40,
                left: 40 ,
                child: Column(
                  children: [
                    Text(
                  'Brooklyn Simmons',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
