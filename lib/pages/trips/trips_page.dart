
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kau_carpool/cubit/app_cubit.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';
import 'package:kau_carpool/widgets/current_trip_driver.dart';
import 'package:kau_carpool/widgets/custom_toggle_button.dart';

import '../../widgets/current_trips_rider.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          body: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                  height: 70,
                  child: CustomToggleButton(
                    tab1: 'Current\n Trips',
                    tab2: 'Scheduled\n Trips',
                    selectedIndex: cubit.tripsToggleIndex,
                    onItemSelected: (index) {
                      cubit.tripsToggleButton(index);
                      print(cubit.tripsToggleIndex);
                    },
                  )),
              SizedBox(
                height: 40,
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
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          blurRadius: 20,
                          color: ColorManager.white,
                        ),
                      ]),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        if (state is CurrentTripsToggle ||
                            state is! ScheduledTripsToggle)
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                            state is AppGetMyAcceptedTripSuccessState ?
                              CurrentTripsRiderWidget(
                                  model: cubit.myAcceptedTrips[index],
                                  context: context,
                                  index: index,
                                )
                                : CurrentTripsDriverWidget(
                                    model: cubit.myTrips[index],
                                    context: context,
                                    index: index,
                                    onTap: cubit.getAcceptedRiders(cubit.myTripId),
                                  ),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 5.0,
                            ),
                            itemCount: state is AppGetMyAcceptedTripSuccessState ?
                            cubit.myAcceptedTrips.length
                                :cubit.myTrips.length,
                          ),
                        if (state is ScheduledTripsToggle)
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => CurrentTripsRiderWidget(
                              model: cubit.trips[index],
                              context: context,
                              index: index,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 5.0,
                            ),
                            itemCount: cubit.trips.length,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
