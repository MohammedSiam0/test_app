import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  CustomTextFiled({
    super.key,
    required this.customValueController,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.validator,
    this.dynamicValue,
    this.title = 'title',
    this.lable = 'lable',
  });

  final TextEditingController customValueController;
  final String title;
  final String lable;
  dynamic dynamicValue;
  final dynamic maxLines;
  String? Function(String?)? validator;
  IconData? prefixIcon, suffixIcon;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(height: 2, fontSize: 16, color: Colors.black),
        ),
        TextFormField(
          controller: widget.customValueController,
          maxLines: widget.maxLines,
          minLines: 1,
          onChanged: (value) {
            setState(() {
              widget.dynamicValue = value;
            });
          },
          validator: widget.validator,
          decoration: InputDecoration(
            // Add a label on top of the TextField
            hintText: widget.lable,
            hintStyle:
                TextStyle(color: Colors.grey.shade300), // Set hint text color
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: Icon(widget.suffixIcon),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Colors.grey.shade300), // Set border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.grey.shade300), // Set focused border color
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
      ],
    );
  }
}
