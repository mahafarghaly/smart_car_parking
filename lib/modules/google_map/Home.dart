import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/modules/google_map/wedgets/place_suggestion.dart';
import 'package:parking_app/modules/login/home.dart';
import 'package:uuid/uuid.dart';
import 'package:parking_app/shared/styles/colors.dart';
import 'blocs/bloc/autocomplete_bloc.dart';
import 'calc_distance.dart';
import 'home_search_box.dart';
import 'package:parking_app/modules/parking_screen.dart';

class Home extends StatefulWidget {
  static const String routeName = '/Home';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => Home(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController controller;
  Set<Marker> markers = {};
  onmapcreated(GoogleMapController mapController) {
    controller = mapController;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AutocompleteBloc, AutocompleteState>(
      listener: (context, state) {
        if (state is PlaceDetailsLoaded) {
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                zoom: 17,
                target: LatLng(
                  state.placeDetailsModel.location.lat,
                  state.placeDetailsModel.location.lng,
                )),
          ));
          markers.clear();
          markers.add(Marker(
              markerId: MarkerId('1'),
              position: LatLng(
                state.placeDetailsModel.location.lat,
                state.placeDetailsModel.location.lng,
              )));
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Images/x33.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.linearToSrgbGamma())
                      //color: defaultColor
                      ),
                  // currentAccountPicture:Image(image:AssetImage('assets/Images/x3.png',),fit: BoxFit.cover,),
                  accountName: Text(''),
                  accountEmail: Text(''),
                  // currentAccountPicture: CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: AssetImage('assets/Images/girl.jpg'),
                  // ),
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
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  onMapCreated: onmapcreated,
                  markers: markers,
                  mapToolbarEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14,
                  ),
                  onTap: (LatLng) {
                    final distance =
                        calculateDistance(LatLng.latitude, LatLng.longitude);
                    final baseDistance = 5;

                    if (distance < baseDistance) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => (ParkingScreen()),
                        ),
                      );
                    }
                  },
                ),
              ),
              Positioned(
                  top: 20,
                  left: 12,
                  right: 12,
                  child: Column(
                    children: [
                      HomeSearchBox(),
                      BlocBuilder<AutocompleteBloc, AutocompleteState>(
                        builder: (context, state) {
                          if (state is AutocompleteLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is AutocompleteLoaded) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              height: 300,
                              color: state.autocomplete.length > 0
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.transparent,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.autocomplete.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        print(
                                            state.autocomplete[index].placeId);
                                        final sessiontoken = Uuid().v4();
                                        context.read<AutocompleteBloc>().add(
                                            GetPlaceDetails(
                                                placeId: state
                                                    .autocomplete[index]
                                                    .placeId,
                                                sessiontoken: sessiontoken));
                                      },
                                      child: PlaceSuggestionCard(
                                        suggestion: state.autocomplete[index],
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
