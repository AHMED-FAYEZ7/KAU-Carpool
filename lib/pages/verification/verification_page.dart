import 'package:flutter/material.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';
import 'package:kau_carpool/pages/login/login_page.dart';
import 'package:kau_carpool/widgets/custom_button.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "in less than a minute",
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorManager.blueWithOpacity,
                  ),
                ),
                const Image(
                  image: AssetImage("assets/images/verification.png"),
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 20,
                    color: ColorManager.white,
                  ),
                  ]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50
                    ),
                    child: Text(
                      'Please click the link sent to your email to verify\n your account and then login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.blueWithOpacity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CustomButton(
                      text: "Return to Login",
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ), (route) {
                        return false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
