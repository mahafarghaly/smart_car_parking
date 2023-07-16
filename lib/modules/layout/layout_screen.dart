import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/cubit/states.dart';
import 'package:parking_app/shared/components/components.dart';
import 'package:parking_app/shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = ParkingCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      // image:DecorationImage(
                      //     image: AssetImage('assets/Images/x4.png'),
                      //     fit: BoxFit.cover,colorFilter: ColorFilter.linearToSrgbGamma()
                      // )
                      color: defaultColor),
                  // currentAccountPicture:Image(image:AssetImage('assets/Images/x3.png',),fit: BoxFit.cover,),
                  accountName: Text('Maha Farghaly'),
                  accountEmail: Text('maha@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/Images/girl.jpg'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Icon(Icons.brightness_4),
                  title: Text('Theme Mode'),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                ),
              ],
            ),
          ),

          // appBar: AppBar(
          //   title: Text(
          //     cubit.titles[cubit.currentIndex],
          //     // style: TextStyle(
          //     // //  color: Theme.of(context).appBarTheme.titleTextStyle.color,
          //     // ),
          //   ),

          // ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_parking), label: ''),
            ],
          ),
        );
      },
    );
  }
}
