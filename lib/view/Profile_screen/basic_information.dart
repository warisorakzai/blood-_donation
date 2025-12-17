import 'package:blood_donation/view/Profile_screen/image_screen.dart';
import 'package:blood_donation/view/Profile_screen/personel_information.dart';
import 'package:blood_donation/widgets/custom_dropdown_form_field.dart';
import 'package:blood_donation/widgets/custom_text_field.dart';
import 'package:blood_donation/widgets/dropdownheader.dart';
import 'package:blood_donation/widgets/header.dart';
import 'package:blood_donation/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  String? selectedGender;
  String? selectedOption;
  final List<String> Genders = ['Male', 'Female', 'Others'];
  final List<String> Options = ['Yes', 'No'];
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: Colors.grey, thickness: 0.5),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                'Profile Setup',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                'Almost Done to set your profile,fill up below\ninformation, its easy just 3 steps',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            SizedBox(height: 20.h),

            Divider(color: Colors.grey, thickness: 0.5.h),

            profileContainer(
              height: 900.h,
              icon: Icons.perm_device_information_outlined,
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Personel Information',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    readOnly: true,
                    controller: dateController,
                    hintText: 'Select Date',
                    labelText: 'Date of Birth ',
                    focusedBorderColor: Colors.red,
                    suffixIcon: Icon(Icons.calendar_month),
                    onTap: () async {
                      DateTime? pickDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                      );
                      if (pickDate != null) {
                        dateController.text =
                            "${pickDate.day}/${pickDate.month}/${pickDate.year}";
                      }
                    },
                  ),
                  Dropdownheader(name: 'Gender'),
                  CustomDropdownFormField(
                    hintText: 'Select gender',
                    value: selectedGender,
                    items: Genders,
                    itemToString: (item) => item,
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    },
                  ),
                  Dropdownheader(name: 'I want to donate blood'),
                  CustomDropdownFormField(
                    value: selectedOption,
                    items: Options,
                    itemToString: (items) => items,
                    onChanged: (val) {
                      selectedOption = val;
                    },
                  ),
                  // Dropdownheader(name: 'About yourself'),
                  CustomTextField(
                    hintText: 'Type about yourself',
                    focusedBorderColor: Colors.red,
                    labelText: "About Your Self",
                    maxLines: 7,
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageScreen()),
                      );
                    },
                    child: ReusableButton(label: 'Next'),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
