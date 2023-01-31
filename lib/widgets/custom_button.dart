// ignore_for_file: unnecessary_string_interpolations, must_be_immutable, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text, this.width});
  VoidCallback? onTap;
  String text;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
              fontFamily: "Jost",
              fontStyle: FontStyle.normal,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
          ),
        ),
      ),
    );
  }
}
