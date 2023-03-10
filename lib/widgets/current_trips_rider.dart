
import 'package:flutter/material.dart';
import 'package:kau_carpool/helper/constant.dart';
import 'package:kau_carpool/helper/resources/color_manager.dart';
import 'package:kau_carpool/models/trips_model.dart';
import 'package:kau_carpool/pages/map/map_page.dart';
import 'package:kau_carpool/widgets/custom_button.dart';

class CurrentTripsRiderWidget extends StatelessWidget {
  CurrentTripsRiderWidget({
    required this.model,
    required this.context,
    required this.index,
  });
  BuildContext context;
  int index;
  TripsModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 240,
            decoration: BoxDecoration(
                color: ColorManager.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 20,
                    color: ColorManager.white,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      'Phone Number : ${model.phone}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/min_person_ic.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Driver : ${model.name}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/drop_off_ic.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Destinition : ${model.dropOffLocation}',
                          maxLines: 2,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        text: "Track",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapPage(
                                startLat: StartLat,
                                startLng: StartLng,
                                endLat: EndLat,
                                endLng: EndLng,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
