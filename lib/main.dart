import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/modules/login/shop_login_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shop_layout.dart';
import 'components/constants.dart';
import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  // bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

   token = CacheHelper.getData(key: 'token');

   print(token);

  // print(onBoarding);
  // print(token);

  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // final bool isDark;
  final Widget startWidget;

  MyApp({this.startWidget});
  // MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => ShopCubit()),
        BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          ),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            backwardsCompatibility: false,
            titleTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(
              color: Colors.blue,
            ),
            iconTheme: IconThemeData(
              color: Colors.blue,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedIconTheme:IconThemeData(
              color: Colors.green,
            ),
            elevation: 20.0,
            backgroundColor: Colors.white,
          ),
          fontFamily: 'Jannah',
        ),
        home: startWidget,
      ),
    );
  }
}

// darkTheme: ThemeData(
// primarySwatch: Colors.deepOrange,
// scaffoldBackgroundColor: HexColor('333739'),
// appBarTheme: AppBarTheme(
// titleSpacing: 20.0,
// backwardsCompatibility: false,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: HexColor('333739'),
// statusBarIconBrightness: Brightness.light
// ),
// backgroundColor: HexColor('333739'),
// elevation: 0.0,
// iconTheme: IconThemeData(
// color: Colors.white,
// ),
// titleTextStyle: TextStyle(
// color: Colors.white,
// fontSize: 20.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// floatingActionButtonTheme: FloatingActionButtonThemeData(
// backgroundColor: Colors.deepOrange,
// ),
// bottomNavigationBarTheme: BottomNavigationBarThemeData(
// type: BottomNavigationBarType.fixed,
// selectedItemColor: Colors.deepOrange,
// unselectedItemColor: Colors.grey,
// elevation: 20.0,
// backgroundColor: HexColor('333739'),
// ),
// textTheme: TextTheme(
// bodyText1: TextStyle(
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// color: Colors.white,
// ),
// ),
//
// ),
