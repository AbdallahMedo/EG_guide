 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../forthmap/place_Direction.dart';

class DistanceAndTime extends StatelessWidget {
  final PlaceDirections? placeDirections;
  final isTimeAndDistanceVisiable;
  const DistanceAndTime({Key? key,this.placeDirections,required this.isTimeAndDistanceVisiable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTimeAndDistanceVisiable!,
        child: Positioned(
          child:Row(
            children: [
              Flexible(
                  child:Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),

                    ),
                    margin: EdgeInsets.only(
                      left: 20,
                      top: 50,
                      right: 20,
                    ),
                    color: Colors.white,
                    child: ListTile(
                      horizontalTitleGap: 0,
                      dense: true,
                      leading: Icon(Icons.access_time_filled,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      title: Text(
                        '${placeDirections!.totalDuration}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                    flex: 1,
              ),
                  SizedBox(width: 30.0,),
              Flexible(
                child:Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 50,
                    right: 20,
                  ),
                  color: Colors.white,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    leading: Icon(Icons.directions_car_filled,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                    title: Text(
                      placeDirections!.totalDistance,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                flex: 1,
              ),

            ],
          ),
          top: 0,
          bottom: 575.0,
          left: 0,
          right: 0,
        )

    );
  }
}
