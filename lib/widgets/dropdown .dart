import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.004,
      ),
      child: Container(
        height: height * 0.06,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text(hint),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
          decoration: InputDecoration(border: InputBorder.none),
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomDropdown extends StatelessWidget {
//   final String hint;
//   final List<String> items;
//   final String? selectedValue;
//   final ValueChanged<String?> onChanged;

//   const CustomDropdown({
//     super.key,
//     required this.hint,
//     required this.items,
//     required this.selectedValue,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return DropdownButtonFormField<String>(
//       value: selectedValue,
//       hint: Text(hint),
//       dropdownColor: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//       icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
//       decoration: InputDecoration(border: InputBorder.none),
//       items: items.map((String value) {
//         return DropdownMenuItem<String>(value: value, child: Text(value));
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
