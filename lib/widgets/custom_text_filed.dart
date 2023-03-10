
import 'package:flutter/material.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({Key? key,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    required this.controller,
    required this.type,
    this.suffix,
    this.suffixPressed,
    required this.validator,
  }) : super(key: key);
  Function(String)? onChanged;
  String? hintText;
  String? labelText;
  IconData? suffix;
  TextEditingController controller;
  TextInputType? type;
  Function? suffixPressed;
  String? Function(String? val)? validator;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$labelText",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: obscureText!,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  suffix,
                  size: 20,
                  color: ColorManager.darkGrey,
                ),
                onPressed: () {
                  suffixPressed!();
                },
              ),
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              hintStyle: TextStyle(
                color: ColorManager.darkGrey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorManager.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorManager.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
