import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme_states.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(ChangeAppTheme());

  static AppThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppTheme() {
    isDark = !isDark;
    emit(ChangeAppTheme());
  }
}
