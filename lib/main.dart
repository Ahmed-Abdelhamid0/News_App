// @dart=2.9
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/news_layout.dart';
import 'package:untitled1/shared/bloc_observer.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';
import 'package:untitled1/shared/network/local/cache_helper.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';
import 'package:untitled1/shared/styles/themes.dart';

//------------------------------------------------------------------------------
void main() async
{

  //Ensure that everything in this method is done first then open application
   WidgetsFlutterBinding.ensureInitialized();

   Bloc.observer=MyBlocObserver();
   DioHelper.init();

   await CacheHelper.init();
   bool isDark=CacheHelper.getBoolean(key: 'isDark');

   runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget
{

    final bool isDark;       MyApp(this.isDark);

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(  create: (BuildContext context)=>AppCupit()..changeAppMode(
          fromShared: isDark,
        ),),
      ],
      child: BlocConsumer<AppCupit,AppStates>(
        listener:(context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

//------------------------------------------------------------------------------
            //light mode
            theme:lightTheme,
//------------------------------------------------------------------------------
            //dark mode
            darkTheme: darkTheme,
            themeMode: AppCupit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
//------------------------------------------------------------------------------
            //TODOAPP Theme

            //   theme: ThemeData(
            //   scaffoldBackgroundColor:Colors.white,
            //   appBarTheme: AppBarTheme(
            //     backwardsCompatibility: false,
            //     systemOverlayStyle: SystemUiOverlayStyle(
            //       statusBarColor: Colors.purple[800],
            //
            //     ),
            //     backgroundColor: Colors.purple[800],
            //     elevation: 0.0,
            //     titleTextStyle: TextStyle(
            //       color:Colors.white,
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     iconTheme: IconThemeData(
            //       color: Colors.white,
            //       size: 25.0,
            //     ),
            //   ),
            //   floatingActionButtonTheme: FloatingActionButtonThemeData(
            //     backgroundColor: Colors.purple[800],
            //   ),
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //     type: BottomNavigationBarType.fixed,
            //     selectedItemColor:Colors.purple[800],
            //     elevation: 30.0,
            //
            //   ),
            // ),
//------------------------------------------------------------------------------
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout(),
            ),
          );
        },
      ),
    );

  }


}
