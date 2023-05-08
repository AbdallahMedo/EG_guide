
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ttttt/data/repositry/placeSuggestion.dart';

import '../../modules/forthmap/place_Direction.dart';
import '../../modules/thirdmap/place.dart';
import '../wepservice/placesWepServices.dart';

class mapRepositry {
  late final placesWepServices wepServices;

  mapRepositry(this.wepServices);

  Future<List<PlaceSuggestion>> feachSuggestion(
      String place, String sessiontoken) async {
    final suggestion =
        await placesWepServices().feachSuggestion(place, sessiontoken);
    return suggestion
        .map((suggestion) =>PlaceSuggestion.fromJson(suggestion))
        .toList();
  }
  Future<Place> getPlaceLocation(
      String placeId, String sessiontoken) async {
    final place =
        await placesWepServices().getPlaceLocation(placeId, sessiontoken);

    return Place.fromJson(place);
  }
  Future<PlaceDirections> getDirections(
      LatLng origin,
      LatLng destination) async {
    final directions =
        await placesWepServices().getDirections(origin, destination);

    return PlaceDirections.fromJson(directions);
  }
}
