
import '../../data/repositry/placeSuggestion.dart';
import '../../modules/forthmap/place_Direction.dart';
import '../../modules/thirdmap/place.dart';

abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<PlaceSuggestion> places;

  PlacesLoaded(this.places);

}
class PlaceLocationLoaded extends MapsState {
   final Place? place;

  PlaceLocationLoaded(this.place);

}
class DirectionsLoaded extends MapsState {
   final PlaceDirections? placeDirections;

  DirectionsLoaded(this.placeDirections);

}


