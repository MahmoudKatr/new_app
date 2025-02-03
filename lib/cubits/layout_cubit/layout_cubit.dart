import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/layout_cubit/layout_state.dart';
import 'package:news_app/views/apple_screen.dart';
import 'package:news_app/views/bussiness_screen.dart';
import 'package:news_app/views/tesla_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const AppleScreen(),
    const TeslaScreen(),
    const BussinessScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
