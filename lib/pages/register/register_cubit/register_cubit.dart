

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kau_carpool/models/user_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async{
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        name: name,
        email: email,
        phone: phone,
        gender: gender,
        uId: value.user!.uid,
      );
      emit(RegisterSuccess(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterError(error.toString()));
    });
  }

  // to verify email
  void emailVerified(String? uId) async {
    if(FirebaseAuth.instance.currentUser!.emailVerified == false){
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      await updateIsEmailVerified(uId);
      emit(SendVerificationSuccess());
    }
  }

  updateIsEmailVerified(String? uId,) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'isEmailVerified': true});
    print(uId);
  }


  void createUser({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      gender: gender,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccess(uId));
    }).catchError((error) {
      emit(RegisterCreateUserError(error.toString()));
    });
  }

  IconData suffix = Icons.remove_red_eye;
  bool isPassShown = true;

  void passVisibility() {
    isPassShown = !isPassShown;
    suffix =
        isPassShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterPassVisibility());
  }
}
