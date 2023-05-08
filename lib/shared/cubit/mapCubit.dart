import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/repositry/map_repo.dart';
import 'mapState.dart';


class MapsCubit extends Cubit<MapsState> {
  final mapRepositry mapreposiry;

  MapsCubit(this.mapreposiry) : super(MapsInitial());
  static MapsCubit get(context)=>BlocProvider.of(context);


  void emitPlaceSuggestions(String place, String sessiontoken) {
    mapreposiry.feachSuggestion(place, sessiontoken).then((suggestion) {
      emit(PlacesLoaded(suggestion));
    });
  }
  void emitPlaceLocation(String placeId, String sessiontoken) {
    mapreposiry.getPlaceLocation(placeId, sessiontoken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }
  void emitPlaceDirections(LatLng origin,LatLng destination) {
    mapreposiry.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }


}
