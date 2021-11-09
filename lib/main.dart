import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_theme/app_theme_cubit.dart';
import 'package:news_app/app_theme/app_theme_states.dart';
import 'package:news_app/app_theme/themes.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/screens/News_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: BlocProvider(
        create: (BuildContext context) => AppThemeCubit(),
        child: BlocConsumer<AppThemeCubit, AppThemeState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return MaterialApp(
                //light Mode
                theme: lightTheme,
                // dark Mode
                darkTheme: darkTheme,
                // Toggle between dark and light
                themeMode: AppThemeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,

                // remove debug banner
                debugShowCheckedModeBanner: false,
                title: 'News App',
                home: const NewsLayout(),
              );
            }),
      ),
    );
  }
}
