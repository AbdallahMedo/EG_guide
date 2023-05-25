 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkerList extends StatefulWidget {
  const MarkerList({Key? key}) : super(key: key);

  @override
  _MarkerListState createState() => _MarkerListState();
}

class _MarkerListState extends State<MarkerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Choose your distnation'
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
                itemBuilder: (ctx,context){
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Text(
                        'Shepin'
                      ),
                      Icon(
                        Icons.arrow_forward
                      ),
                      Text('quesna'),
                    ],
                  ),
                );


                }
            ),
          ),
        ],
      ),
    );
  }
}
