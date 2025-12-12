import 'package:blood_donation/view/Profile_screen/basic_information.dart';
import 'package:blood_donation/widgets/custom_dropdown_form_field.dart';
import 'package:blood_donation/widgets/custom_text_field.dart';
import 'package:blood_donation/widgets/dropdown%20.dart';
import 'package:blood_donation/widgets/dropdownheader.dart';
import 'package:blood_donation/widgets/header.dart';
import 'package:blood_donation/widgets/reusable_button.dart';
import 'package:blood_donation/widgets/reusable_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonelInformation extends StatefulWidget {
  const PersonelInformation({super.key});

  @override
  State<PersonelInformation> createState() => _PersonelInformationState();
}

class _PersonelInformationState extends State<PersonelInformation> {
  String? selectedBloodGroup;
  String? selectedCountry;
  String? selectedCity;

  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> countries = ['Pakistan', 'India', 'USA', 'UAE', 'Canada'];
  final List<String> citiesPakistan = [
    'Peshawar',
    'Lahore',
    'Karachi',
    'Islamabad',
  ];
  final List<String> citiesIndia = ['Delhi', 'Mumbai', 'Bangalore'];
  final List<String> citiesUSA = ['New York', 'Los Angeles', 'Chicago'];

  List<String> getCityList() {
    if (selectedCountry == 'Pakistan') {
      return citiesPakistan;
    }
    if (selectedCountry == 'India') {
      return citiesIndia;
    }
    if (selectedCountry == 'USA') {
      return citiesUSA;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Icon(Icons.arrow_back_ios_new_outlined)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey, thickness: 0.5),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.02),
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
              padding: EdgeInsets.symmetric(horizontal: height * 0.02),
              child: Text(
                'Almost Done to set your profile,fill up below\ninformation, its easy just 3 steps',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            SizedBox(height: height * 0.02),

            Divider(color: Colors.grey, thickness: 0.5.h),

            profileContainer(height: height, icon: Icons.person_2_outlined),
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    focusedBorderColor: Colors.red,
                    labelText: "Your Name",
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10.h),

                  CustomTextField(
                    focusedBorderColor: Colors.red,
                    labelText: "Mobile Number",
                    keyboardType: TextInputType.phone,
                  ),

                  Dropdownheader(name: 'Select Group'),

                  // header(name: 'Your Name'),

                  // header(name: 'Mobile Number'),
                  // SizedBox(height: 20.h),

                  // CustomDropdown(
                  //   hint: 'Blood Group',
                  //   items: bloodGroups,
                  //   selectedValue: selectedBloodGroup,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       selectedBloodGroup = value;
                  //     });
                  //   },
                  // ),
                  CustomDropdownFormField(
                    hintText: 'Select Blood Group',

                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down,
                    ), // IMPORTANT

                    value: selectedBloodGroup,
                    items: bloodGroups,
                    itemToString: (item) => item,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value;
                      });
                    },
                  ),

                  Dropdownheader(name: 'Select Your country'),
                  CustomDropdownFormField(
                    hintText: 'Select Your Country',
                    value: selectedCountry,
                    items: countries,
                    itemToString: (item) => item,
                    onChanged: (val) {
                      selectedCountry = val;
                    },
                  ),

                  Dropdownheader(name: 'Select Your City'),
                  CustomDropdownFormField(
                    value: selectedCity,
                    items: getCityList(),
                    itemToString: (item) => item,
                    hintText: 'Enter Your City ',
                  ),
                  SizedBox(height: 20.h),

                  // Dropdownheader(name: 'Country '),
                  // CustomDropdown(
                  //   hint: 'Select Country',
                  //   items: countries,
                  //   selectedValue: selectedCountry,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       selectedCountry = val;
                  //     });
                  //   },
                  // ),
                  // Dropdownheader(name: 'City '),
                  // CustomDropdown(
                  //   hint: 'Select City',
                  //   items: getCityList(),
                  //   selectedValue: selectedCity,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       selectedCity = val;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasicInformation()),
                  );
                },
                child: ReusableButton(label: 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class profileContainer extends StatelessWidget {
  const profileContainer({super.key, required this.height, required this.icon});

  final double height;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.11,
      // width: width * 0.20,v
      decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
      child: Center(
        child: Icon(icon, size: height * 0.05, color: Colors.red),
      ),
    );
  }
}
