import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kau_carpool/pages/home/home_page.dart';
import 'package:kau_carpool/pages/more/more_page.dart';
import 'package:kau_carpool/pages/trips/trips_page.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    TripsPage(),
    MorePage(),
  ];

  void changeBottomNav(int index)
  {
    // if(index == 1)
    // {
    //   getAllUsers();
    // }
      currentIndex = index;
      emit(AppChangeBottomNav());
  }

  // home toggle
  int homeToggleIndex = 0;
  void homeToggleButton(int index)
  {
    if(index == 1)
    {
      homeToggleIndex = index;
      emit(OfferToggle());
    }else{
      homeToggleIndex = index;
      emit(FindToggle());
    }

  }


  // trips toggle
  int tripsToggleIndex = 0;
  void tripsToggleButton(int index)
  {
    if(index == 1)
    {
      tripsToggleIndex = index;
      emit(ScheduledTripsToggle());
    }else{
      tripsToggleIndex = index;
      emit(CurrentTripsToggle());
    }

  }
}
