import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/models/parking_model.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/cubit/states.dart';
import 'package:parking_app/modules/layout/layout_screen.dart';
import 'package:parking_app/modules/reverse/spot.dart';
import 'package:parking_app/modules/reverse/timer.dart';
import 'package:parking_app/shared/components/components.dart';
import 'package:parking_app/shared/styles/colors.dart';
import 'package:parking_app/modules/payment/register_integration/register_Integration_screen.dart';

class ParkingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ParkingCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Parking Details',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),

          // resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/Images/p4.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'ESMART',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 20),
                          ),
                        ),

                        Icon(
                          Icons.star_sharp,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        ),
                        // style: ButtonStyle(
                        //     backgroundColor:MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.4)) ,
                        //     shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                        //       RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(18.0),
                        //         // side:(BorderSide(color:Colors.red,))
                        //
                        //       ),
                        //     )
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20, color: Colors.grey),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                              'Faculty of Engineering,Al_azhar University',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.subtitle1
                              //.copyWith(color: Colors.grey),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text('10 LE',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: defaultColor2, fontSize: 18)),
                        Expanded(
                            child: Text(
                          ' /per hour',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey),
                        )),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.local_parking_rounded,
                          size: 15,
                          color: Colors.grey,
                        ),
                        Text(
                          '4 spot available',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: defaultTextButton2(
                      text: 'call',
                      function: () {},
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: defaultTextButton2(
                      text: 'Map',
                      function: () {},
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    // Expanded(child: defaultTextButton2(text: 'Save', function: (){},))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Spacer(),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: defultButton(
                    function: () {
                      navigateAndFinish(
                          context,
                          //ReverseScreen()
                          SpotScreen());
                    },
                    text: 'View Garage'.toUpperCase(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
