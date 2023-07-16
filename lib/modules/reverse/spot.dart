import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/cubit/states.dart';
import 'package:parking_app/modules/parking_screen.dart';
import 'package:parking_app/modules/qr/qr_scanner.dart';
import 'package:parking_app/modules/reverse/timer.dart';
import 'package:parking_app/shared/components/components.dart';
import 'package:parking_app/modules/payment/register_integration/register_Integration_screen.dart';
import 'package:parking_app/shared/styles/colors.dart';
import 'package:parking_app/shared/styles/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/colors.dart';

class SpotScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParkingCubit()..getData(),
      child: BlocConsumer<ParkingCubit, ParkingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ParkingCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {
                        navigateAndFinish(context, ParkingScreen());
                      },
                    ),
                    Text(
                      'Spots',
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          //color: defaultColor5.withOpacity(0.2)
                          ),
                      child: Column(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(20, 20),
                                bottomRight: Radius.elliptical(20, 20),
                                topRight: Radius.elliptical(20, 20),
                              ),
                              color: defaultColor,
                            ),
                            child: Text(
                              '${cubit.spotNum()} Spot Avaliable',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          selectSpot(context,
                              cubit: cubit.ir1,
                              image: 'assets/Images/car2.jpg',
                              spotName: 'A-01'),
                          Divider(
                            color: Colors.grey,
                          ),
                          selectSpot(context,
                              cubit: cubit.ir2,
                              image: 'assets/Images/car.jpg',
                              spotName: 'A-02'),
                          Divider(
                            color: Colors.grey,
                          ),
                          selectSpot(context,
                              cubit: cubit.ir3,
                              image: 'assets/Images/car2.jpg',
                              spotName: 'A-03'),
                          Divider(
                            color: Colors.grey,
                          ),
                          selectSpot(context,
                              cubit: cubit.ir4,
                              image: 'assets/Images/car.jpg',
                              spotName: 'A-04'),
                          SizedBox(
                            height: 20,
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10)),
                          //   clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   child: defultButton(
                          //     function: () {
                          //       navigateAndFinish(context, QRScanner());
                          //     },
                          //     text: 'Parking'.toUpperCase(),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  if (cubit.ir1 == true ||
                      cubit.ir2 == true ||
                      cubit.ir3 == true ||
                      cubit.ir4 == true)
                    SlidingUpPanel(
                      panel: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          //color:defaultColor2
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: const Text(
                                  "Parking",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "SF Pro Disblay",
                                    color: Color(0xFF4B94A4),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Your Car number",
                                  style: TextStyle(
                                    color: Color(0xFF9C5B46),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "SF Pro Disblay Pro",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 340,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return "This Field cannot be empty!";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your car number',
                                    helperStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SF Pro Disblay ProRR",
                                      fontSize: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: const Color(0xFF9C5B46)
                                            .withOpacity(0.1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: const Color(0xFF9C5B46)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        navigateTo(context, QRScanner());
                                        // TODO : NAVIGATOR TO ANOTHER SCREEN OR DO SOMETHING
                                      } else {
                                        // TODO : SHow toast or something
                                        print("Not valid");
                                      }
                                    },
                                    child: Container(
                                      width: 205,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: defaultColor2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Continue",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily:
                                                    "SF Pro Disblay Pro",
                                                color: Colors.white),
                                          ),
                                          // Icon(
                                          //   Icons.arrow_right_alt,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      minHeight: 80,
                      maxHeight: MediaQuery.of(context).size.height / 2.6,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                ],
              ));
        },
      ),
    );
  }
}
