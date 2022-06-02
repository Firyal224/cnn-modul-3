// ignore_for_file: use_key_in_widget_constructors

import 'package:cnn_app/model/data.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String title;
  final String time;
  final String picture;

  const CardCustom({
    required this.title,
    required this.time,
    required this.picture,

  });


  @override
  Widget build(BuildContext context) {
    Data data = Data(
      title: title,
      time: time,
      picture: picture
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3.0,color: (Colors.grey[200])!),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 130,
              child:GestureDetector(child:
              Image.asset('assets/'+data.getPicture(), width: 130)),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 25.0),
                width: 220,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,top: 2.0,bottom: 3.0),
                      child: Text(data.getTitle(),   maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0,top: 20.0,bottom: 3.0),
                        child: Text(data.time!,
                          style: TextStyle(
                            fontSize: 12.0, color: Colors.grey[400],
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}