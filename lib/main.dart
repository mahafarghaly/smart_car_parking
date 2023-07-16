import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/google_map/blocs/bloc/autocomplete_bloc.dart';
import 'package:parking_app/modules/google_map/maps_services.dart';
import 'package:parking_app/modules/login/home.dart';
import 'package:parking_app/modules/login/otp.dart';
import 'package:parking_app/modules/login/phone.dart';
import 'package:parking_app/modules/parking_screen.dart';
import 'package:parking_app/modules/reverse/number_screen.dart';
import 'package:parking_app/shared/bloc_observer.dart';
import 'package:parking_app/shared/styles/colors.dart';
import 'modules/google_map/blocs/geolocation/geolocation_bloc.dart';
import 'modules/google_map/repositories/geolocation/geolocation_repository.dart';
import 'modules/google_map/repositories/places/places_repository.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'modules/qr/qr_scanner.dart';
import 'modules/reverse/timer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/local/dio_helper.dart';

void main() async {
  blocObserver:
  MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  await Firebase.initializeApp();
  await CacheHelper.init();

  Widget widget;
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  // String token = CacheHelper.getData(key: 'token');
  // if (onBoarding != null) {
  //  if (token != null)
  //     widget = MyHome();
  //   else
  //     widget = MyPhone();
  // } else {
  //   widget = OnBoardingScreen();
  // }
  runApp(MyApp()); //--startWidget: widget
}

class MyApp extends StatelessWidget {
  //final Widget? startWidget;

  // const MyApp({this.startWidget});
  // const ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository(),
          ),
          RepositoryProvider<PlacesRepository>(
            create: (_) => PlacesRepository(MapsServices(Dio())),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>()),
            ),
            BlocProvider(
              create: (context) => AutocompleteBloc(
                  placeRepository: context.read<PlacesRepository>()),
            ),
            BlocProvider(
              create: (context) => ParkingCubit(),
            ),
          ],
          child: MaterialApp(
            initialRoute: 'phone',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: defaultColor,
              ),
              bottomNavigationBarTheme:
                  BottomNavigationBarThemeData(selectedItemColor: defaultColor),
              buttonTheme: ButtonThemeData(buttonColor: defaultColor),
              textTheme: TextTheme(
                bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                subtitle1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              tabBarTheme: TabBarTheme(
                labelColor: defaultColor,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  //color:Colors.black,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: OnBoardingScreen(),
          ),
        ));
  }
}
