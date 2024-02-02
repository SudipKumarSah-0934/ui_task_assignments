import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_task_assignments/core/utils/enums.dart';
import 'package:ui_task_assignments/core/utils/themes/theme_constants.dart';


part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
   ThemeData?  themeData= appThemeData[AppTheme.lightTheme];
  ThemeBloc()
      : super(ThemeState(
            themeData: appThemeData[
                AppTheme.lightTheme]!)) {
    on<ThemeChanged>((event, emit) {
      emit.call(ThemeState(themeData: appThemeData[event.theme]!));
      themeData = appThemeData[event.theme];
    });
  }
}
