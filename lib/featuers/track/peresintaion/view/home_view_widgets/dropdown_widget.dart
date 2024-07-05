import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/styles.dart';

class DropdownWithTitle extends StatefulWidget {
  final String title;
  final List<String> items;

  const DropdownWithTitle({super.key, required this.title, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _DropdownWithTitleState createState() => _DropdownWithTitleState();
}

class _DropdownWithTitleState extends State<DropdownWithTitle> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 10.h, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.orangeWithOp10Color,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: DropdownButton<String>(
              elevation: 0,
              value: _selectedValue,
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              underline: const Text(""),
              items: widget.items.map((item) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: item,
                  child: Text(
                    item,
                    style: Styles.textStyle10w700,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
