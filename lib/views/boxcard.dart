import 'package:flutter/material.dart';
import 'data.dart';
class boxCard extends StatelessWidget {
  final String title;
  final String? time;
  final String picture;
  boxCard({
    required this.title,
    this.time,
    required this.picture,
  });


  @override
  Widget build(BuildContext context) {
    Data data = Data(
        title: title,
        time: time,
        picture: picture
    );
    return  Container(
      padding: const EdgeInsets.only(top:30.0),
      width: 150,
      child: Column(
        children: [
          Image.asset('assets/'+data.getPicture()),
          Text(data.getTitle(), maxLines: 2,
            style: TextStyle(fontSize: 16.0,color: Colors.black),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Text("CNN", style: TextStyle(
                  fontSize: 12.0,color: Colors.red
              )),
            ),
          )
        ],
      ),
    );
  }
}
