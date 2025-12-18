import 'package:blood_donation/widgets/menu_tile.dart';
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

          Divider(),
          SizedBox(height: 40.h),

          Stack(
            clipBehavior: Clip.none,

            children: [
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              Positioned(
                top: -20.h,
                right: 155.h,
                child: CircleAvatar(radius: 40.h),
              ),
              Positioned(
                top: 80.h,
                left: 100.h,
                child: Column(
                  children: [
                    Text(
                      'Brooklyn Simmons',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Blood Group: B+',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                MenuTile(icon: Icons.bloodtype, title: 'Create Blood request'),

                MenuTile(
                  icon: Icons.add_box_sharp,
                  title: 'Create Donot Blood ',
                ),
                MenuTile(
                  icon: Icons.bus_alert_outlined,
                  title: 'Blood Donat Oraganization',
                ),
                MenuTile(icon: Icons.bus_alert, title: 'Ambulence'),
                MenuTile(icon: Icons.forward_to_inbox_sharp, title: 'Inbox'),
                MenuTile(
                  icon: Icons.add_reaction_sharp,
                  title: 'Work as volunteer',
                ),
                MenuTile(icon: Icons.takeout_dining, title: 'Tags'),
                MenuTile(icon: Icons.settings, title: 'settings'),
                MenuTile(icon: Icons.favorite, title: 'Donate Us'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
