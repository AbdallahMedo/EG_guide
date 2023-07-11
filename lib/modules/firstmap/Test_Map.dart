import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';
import '../../data/repositry/map_repo.dart';
import '../../data/repositry/placeSuggestion.dart';
import '../../data/wepservice/placesWepServices.dart';
import '../../map/location_helper.dart';
import '../../shared/cubit/mapCubit.dart';
import '../../shared/cubit/mapState.dart';
import '../distance_and_time/distance_and_time.dart';
import '../forthmap/place_Direction.dart';
import '../secondmap/placeItems.dart';
import '../thirdmap/place.dart';

class mapsscreen extends StatefulWidget {
  // const mapsscreen({Key? key}) : super(key: key);
  @override
  State<mapsscreen> createState() => _mapsscreenState();
}

class _mapsscreenState extends State<mapsscreen> {
  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
    // for(int i=0;i<latln.length;i++){
    //   markers.add(
    //       Marker(
    //         markerId: MarkerId(i.toString()),
    //         position: latln[i],
    //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen,),
    //
    //       )
    //   );
    //   setState(() {
    //
    //   });
    //   poly.add(
    //       Polyline(
    //         polylineId: PolylineId('1'),
    //         points: latln,
    //
    //       )
    //   );
    // }

  }




  Completer<GoogleMapController> _controller = Completer();
  FloatingSearchBarController controller = FloatingSearchBarController();
  static Position? position;

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation();

    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      // setState(() {});
    });
  }

  static final CameraPosition _CameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 15.0
  );


  ///Markers
  Set<Marker> markers = Set();
  PlaceSuggestion? placeSuggestion;
  Place? selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  CameraPosition? goToSearchedForPlace;
  void buildCameraNewPosition() {
    goToSearchedForPlace = CameraPosition(
      target: LatLng(
        selectedPlace!.result.geometry.location.lat,
        selectedPlace!.result.geometry.location.lng,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 13,
    );
  }

  ///End of markers
  ///variables for directions
  PlaceDirections? placeDirestion;
  var progressindicator = false;
  late List<LatLng> polyLinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisiable = false;
  late String time;
  late String distance;
  // final Set<Polyline>poly={};
  // List<LatLng>latln=[
  //   LatLng(30.558381341080032, 31.022182536588375),
  //   LatLng(30.562068534086237, 31.019395070205867),
  //   LatLng(30.513414520115774, 31.122635235081265),
  //   LatLng(30.550480193550566, 31.137552813214047),
  //   LatLng(30.54726159581984, 31.11986014936691),
  //   LatLng(30.558284031361787, 31.020189262517597),
  //   LatLng(30.5734876990458, 31.010635979993783),
  //   LatLng(30.513338593615753, 31.122747936917836),
  //
  //
  //
  //
  // ];

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _CameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: markers,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        setState(() {
          markers.add(
          Marker(
            markerId: MarkerId('3'),
            position: LatLng(30.54726159581984, 31.11986014936691),

               infoWindow:InfoWindow(
                    title: ("موقف قويسنا - شبين ")
                ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            onTap: (){
              BuildBottomSheet();
            },



          ),
          );
          markers.add(
           Marker(
               markerId:MarkerId('ashliem'),
                   position: LatLng(30.558284031361787, 31.020189262517597),
             infoWindow:InfoWindow(
                 title: ("موقف اتوبيسات قصر جامعه ")
             ),
             icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
             onTap: (){
                 BuildBottomSheet();
                 },



           )
          );
          markers.add(
              Marker(
                markerId:MarkerId('shepin'),
                position: LatLng(30.513338593615753, 31.122747936917836),
                infoWindow:InfoWindow(
                    title: ("موقف اشليم - قويسنا")
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                onTap: (){
                  BuildBottomSheet();
                },



              )
          );
          markers.add(
              Marker(
                markerId:MarkerId('shepin gamaa'),
                position: LatLng(30.5734876990458, 31.010635979993783),
                infoWindow:InfoWindow(
                    title: ("القصر")
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                onTap: (){
                  BuildBottomSheet();
                },



              )
          );
        });
      },
      polylines: placeDirestion != null
          ? {
        Polyline(
          polylineId: const PolylineId('my PolyLine_Id'),
          color: Colors.purple,
          width: 5,
          points: polyLinePoints,
          patterns: [PatternItem.dot, PatternItem.gap(15)],
        )
      }
          : {},
    );

  }


  Future<void> _goTomyCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_CameraPosition));
  }

  ///Searchbar

  Widget buildFloatingSearchBar(context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
      queryStyle: TextStyle(fontSize: 18),
      hint: ' Search Here..',
      progress: progressindicator,
      borderRadius: BorderRadius.circular(20.0),
      border: BorderSide(style: BorderStyle.none),
      // margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: 50,
      //iconColor: Colors.red,
      scrollPadding: const EdgeInsets.only(top: 5, bottom: 56),
      transitionDuration: const Duration(milliseconds: 100),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 100),
      // progress: progressIndicator,
      onQueryChanged: (query) {
        final sessionToken = Uuid().v4();
        BlocProvider.of<MapsCubit>(context)
            .emitPlaceSuggestions(query, sessionToken);
      },
      onFocusChanged: (_) {
        // hide distance and time row
        setState(() {
          isTimeAndDistanceVisiable = false;
        });
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: true,
          child: Row(
            children: [
              CircularButton(
                icon: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {},
              ),
              CircleAvatar(
                backgroundColor: Colors.blue[600],
                child: Text(
                  "KM",
                  style: TextStyle(fontSize: 15),
                ),
                radius: 15.0,
              ),
            ],
          ),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSuggestionsBloc(),
              buildSelectedPlaceLocationBloc(),
              buildDirectionsBloc(context),
            ],
          ),
        );
      },
    );
  }

  ///End of searchBar
  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationLoaded) {
          BuildBottomSheet();
          selectedPlace = (state).place;
          BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
            LatLng(position!.latitude, position!.longitude),
            LatLng(selectedPlace!.result.geometry.location.lat,
                selectedPlace!.result.geometry.location.lng),
          );
        };
      },
      child: Container(),
    );
  }

  Widget buildDirectionsBloc(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is DirectionsLoaded) {
          placeDirestion = (state).placeDirections;
          polyLinePoints = placeDirestion!.polyLinePoints
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList();
        }
        ;
      },
      child: Container(),
    );
  }
  Future<void> goToSearchedForLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace!));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      markerId: MarkerId('2'),
      position: goToSearchedForPlace!.target,
      onTap: () {
        // buildCurrentLocationMarker();
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisiable = true;
        });
      },
      infoWindow: InfoWindow(
        title: "${placeSuggestion!.description}",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  //Description for current location
  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(position!.latitude, position!.longitude),
      onTap: () {},
      infoWindow: InfoWindow(
        title: "Your Current Location",
      ),
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  List<PlaceSuggestion> places = [];

  //late PlaceSuggestion placeSuggestion;
  Widget buildPlacesList(BuildContext context) {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () async {
              placeSuggestion = places[index];
              controller.close();
              final sessiontoken = Uuid().v4();
              BlocProvider.of<MapsCubit>(context)
                  .emitPlaceLocation(placeSuggestion!.placeId, sessiontoken);
              polyLinePoints.clear();
              setState(() {
                markers.clear();
              });
            },
            child: PlaceItem(
              suggestion: places[index],
            ),
          );
        },
        shrinkWrap: true,
        physics: const ClampingScrollPhysics()
    );
  }

  Widget buildSuggestionsBloc() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = (state).places;
          if (places.length != 0) {
            return buildPlacesList(context);
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context1) {
    return BlocProvider(
      create: (context) => MapsCubit(mapRepositry(placesWepServices())),
      child: BlocConsumer<MapsCubit, MapsState>(
        listener: (context, state) {},
        builder: (context, state) {
          //var cubobj = MapsCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 0,
              ),
              child: FloatingActionButton(
                onPressed: _goTomyCurrentLocation,
                child: Icon(Icons.place),
              ),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                position != null
                    ? buildMap()
                    : Center(child: CircularProgressIndicator()),
                buildFloatingSearchBar(context),
                isSearchedPlaceMarkerClicked
                    ? DistanceAndTime(
                  isTimeAndDistanceVisiable: isTimeAndDistanceVisiable,
                  placeDirections: placeDirestion,
                )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
  Future BuildBottomSheet(){
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),


      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 450.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/icons/loc.jpg'),
                    opacity: 0.3,
                    fit: BoxFit.fitHeight
                ),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_forward,color: Colors.black,size: 30.0,),
                        SizedBox(width: 15.0,),
                        Text(
                          'Read Directions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0

                          ),
                        ),
                        SizedBox(width: 15.0,),
                        Icon(Icons.location_on,color: Colors.green,),



                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      goToSearchedForLocation();
                      buildCurrentLocationMarker();
                      Navigator.pop(context);
                    },
                    child:RichText(
                      text:TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "(1) اذهب مباشرة الي اول علامه\n (موقف مواصلات اشليم - قويسنا)\n قم باخذ السياره المتجهه لقويسنا \n\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          TextSpan(
                            text: "(2) انتظر حتي تاتي لثاني علامه\n(موقف مواصلات قويسنا - شبين الكوم) \nقم باخذ السياره المتجهه الي شبين الكوم \n\n ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,

                            )
                          ),
                          TextSpan(
                            text: "(3) انتظر حتي تاتي الي ثالث علامه\n (موقف اتوبيسات قصر والجامعه) \nقم باخذ الاتوبيس لمتوجه الي الجامعه\n\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          TextSpan(
                            text: "(4) انتظر حتي رابع علامه قم بالنزول من الاتوبيس واتبع الاتجاهات حتي تصل الي وجهتك\n${placeSuggestion?.description}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ]

                      )
                    )
                  ),
                ],
              ),
            ),
          ),
        );
      },



    );
  }

}
