import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../shared/components/constants.dart';

class placesWepServices {
  Dio? dio;

  placesWepServices() {
    BaseOptions options = BaseOptions(
      // connectTimeout: Duration(microseconds: 200000000000),
      // receiveTimeout: Duration(microseconds: 20000000000000000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> feachSuggestion(
      String place, String sessiontoken) async {
    try {
      Response response = await dio!.get(googleMapPlacesUrl, queryParameters: {
        'input': place,
        // 'type': 'address',
        'components': 'country:eg',
        'key': googleMapKey,
        'sessiontoken': sessiontoken,
      });
      return response.data['predictions'];
    } catch (error) {
      return [];
    }
  }
  Future<dynamic> getPlaceLocation(
      String placeId, String sessiontoken) async {
    try {
      Response response = await dio!.get(PlaceLocationUrl, queryParameters: {
        'place_id': placeId,
        // 'type': 'address',
        'fields': 'geometry',
        'key': googleMapKey,
        'sessiontoken': sessiontoken,
      },);
      return response.data;
    } catch (error) {
      return Future.error("Place Location Error",StackTrace.fromString(("Trace")));
    }
  }
  Future<dynamic> getDirections(
      LatLng origin,
      LatLng destination) async {
    try {
      Response response = await dio!.get(
        directionsBaseUrl,
        queryParameters: {
        'origin':'${origin.latitude},${origin.longitude}',
        // 'type': 'address',
        'destination':'${destination.latitude},${destination.longitude}',
        'key': googleMapKey,

      },);
     // print('nnininininin');
      //print(response.data);
      return response.data;
    } catch (error) {
      return Future.error("Place Location Error",StackTrace.fromString(("Trace")));
    }
  }
}
