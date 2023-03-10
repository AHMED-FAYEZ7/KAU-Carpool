
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kau_carpool/cubit/app_cubit.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';
import 'package:kau_carpool/pages/trips/trips_page.dart';
import 'package:kau_carpool/widgets/custom_button.dart';

import '../../layout/app_layout.dart';

class ConfirmPage extends StatelessWidget {
  ConfirmPage({Key? key}) : super(key: key);
  static String id = 'ConfirmPage';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context ,state){},
      builder: (context ,state){
        return Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: ColorManager.backgroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                    height: 80,
                  ),
                const SizedBox(
                  height: 20,
                ),
                if(state is AppSelectedTripsAcceptedState)
                  Container(
                    height: MediaQuery.of(context).size.height * 80 / 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          blurRadius: 20,
                          color: ColorManager.white,
                        ),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/cong3_ic.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                "Congratulations",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black,
                                  fontFamily: "Jost",
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                "Your Carpooling has been confirmed.",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.blueWithOpacity,
                                  fontFamily: "Jost",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            width: 150,
                            text: "My Trip",
                            onTap: () {
                              AppCubit.get(context).getAcceptedTrips(state.tripId);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TripsPage(),
                                  ), (route) {
                                return false;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
