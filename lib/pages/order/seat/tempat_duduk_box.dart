import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/models/tempat_duduk_model.dart';

class TempatDudukBox extends StatelessWidget{

  final TempatDuduk tempatDuduk;
  TempatDudukBox({this.tempatDuduk});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: sizeHorizontal * tempatDuduk.y,
      left: sizeHorizontal * tempatDuduk.x,
      child: GestureDetector(
        onTap: (){
          print(tempatDuduk.id.toString() +' is clicked');
        },
        child: Container(
          height: (tempatDuduk.orientation == 'horizontal')?sizeHorizontal * 2 * 5: sizeHorizontal * tempatDuduk.size * 3.5,
          width: (tempatDuduk.orientation == 'horizontal')?sizeHorizontal * tempatDuduk.size * 3.5: sizeHorizontal * 2 * 7,
          decoration: BoxDecoration(
            color: (tempatDuduk.condition == 'full')?kursiPenuh:(tempatDuduk.condition == 'half')?kursiTerisi:kursiKosong,
            // borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 2),child: Text(tempatDuduk.id.toString(),style: t4Black)),
            ],
          ),
        ),
      ),
    );
  }
}