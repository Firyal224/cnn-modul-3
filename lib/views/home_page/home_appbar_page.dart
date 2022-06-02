// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:cnn_app/model/data.dart';
import 'package:cnn_app/widget/card.dart';
import 'package:flutter/material.dart';

const mBackgroundColor = Color(0xffF5F6F8);
class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  var value=0;
  String pictures="Landingpage.jpg";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                          onTap: () {
                             setState(() {
                               value++;
                               if((value % 2) == 0){
                                 pictures="Landingpage.jpg";
                               }else{
                                 pictures="metropolitan.jpg";
                               }
                             });
                          },
                          child: Image.asset('assets/'+pictures,)
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: const EdgeInsets.only(left:10.0,top: 10.0),
                          width: 300.0,
                          child: Column(
                            children: const [
                              Text("Pengamat: Kementrian Sektor Pangan Harus Dievaluasi",
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left:10.0,top:4.0,right: 8.0),
                      child: Column(
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18.0,color: Colors.grey[500]),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                              child: Text("9 menit yang lau",
                                style: TextStyle(fontSize: 15.0,color:Colors.grey[500]),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                //Untuk scroll horizontal card
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: mBackgroundColor,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("Laporan Interaktif",
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          Spacer(),
                          Text("LIHAT SEMUA",
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.black),),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            BoxCard(title: "Kolong Kota: Bukan Metropolitan", time: "5 menit", picture: "metropolitan.jpg"),
                            Padding(
                              padding: const EdgeInsets.only(left:14.0),
                              child: BoxCard(title: "Kolong Kota: Bukan Metropolitan", time: "5 menit", picture: "metropolitan.jpg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:14.0),
                              child: BoxCard(title: "Kolong Kota: Bukan Metropolitan", time: "5 menit", picture: "metropolitan.jpg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:14.0),
                              child: BoxCard(title: "Kolong Kota: Bukan Metropolitan", time: "5 menit", picture: "metropolitan.jpg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:14.0),
                              child: BoxCard(title: "Kolong Kota: Bukan Metropolitan", time: "5 menit", picture: "metropolitan.jpg"),
                            ),

                          ],
                        ),
                      ),
                      //scroll vertikal
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                      CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                      CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                      CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                      CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg")
                    ],
                  ) ,
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class BoxCard extends StatelessWidget {
  final String title;
  final String? time;
  final String picture;
  const BoxCard({
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
            style: const TextStyle(fontSize: 16.0,color: Colors.black),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top:18.0),
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


