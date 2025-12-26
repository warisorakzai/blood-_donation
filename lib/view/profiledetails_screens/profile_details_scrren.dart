import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            "Profile Details",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),

              /// PROFILE IMAGE
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
              ),

              SizedBox(height: 12.h),

              /// NAME
              const Text(
                "Cameron Williamson",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 4.h),

              /// BLOOD GROUP
              const Text("A+ Blood", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 16.h),

              /// CHAT & CALL BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _actionButton(
                    text: "Chat Now",
                    color: Colors.red,
                    onTap: () {},
                  ),
                  SizedBox(width: 12.w),
                  _outlineButton(text: "Call", onTap: () {}),
                ],
              ),

              SizedBox(height: 20.h),

              /// TAB BAR
              const TabBar(
                indicatorColor: Colors.red,
                indicatorWeight: 2,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Create Ads"),
                ],
              ),

              SizedBox(height: 16.h),

              /// TAB CONTENT
              SizedBox(
                height: 420.h,
                child: TabBarView(
                  children: [
                    /// ABOUT TAB
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoCard(),
                        SizedBox(height: 16.h),

                        Text(
                          "About User",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8.h),

                        const Text(
                          "Libero tempore, cum soluta nobis est eligendi optio "
                          "cumque nihil impedit quo minus id quod maxime placeat "
                          "facere possimus.",
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 20.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _socialIcon(Icons.facebook),
                            _socialIcon(Icons.alternate_email),
                            _socialIcon(Icons.send),
                            _socialIcon(Icons.business),
                          ],
                        ),
                      ],
                    ),

                    /// CREATE ADS TAB
                    Center(
                      child: Text(
                        "No Ads Created",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// RED BUTTON
  static Widget _actionButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }

  /// OUTLINE BUTTON
  static Widget _outlineButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(color: Colors.red)),
      ),
    );
  }

  /// INFO CARD
  static Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
      ),
      child: Column(
        children: [
          _infoRow("Age", "30"),
          _infoRow("Gender", "Male"),
          _infoRow("City", "Dhaka"),
          _infoRow("Country", "Bangladesh"),
          _infoRow("Mobile", "+880 1112233344"),
          _infoRow("Email", "demo@email.com"),
        ],
      ),
    );
  }

  /// INFO ROW
  static Widget _infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  /// SOCIAL ICON
  static Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }
}
