import 'package:flutter/material.dart';
import 'cardd.dart';
import 'BoxCard.dart';
import 'data.dart';
import 'package:cnn/views/populer.dart';

const mBackgroundColor = Color(0xffF5F6F8);

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title,}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState(title);
}


class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.
  String pictures="Landingpage.jpg";
  String title;
  _HomePageState(this.title);
  var value=0;
  bool load = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: GestureDetector(
          onTap: (){
            setState(() {
              if(load) {
                load = false;
              } else {
                load = true;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 8),
            child: Image.asset('assets/CnnLogo.png',width: 60.0,height: 80.0,),
          ),
        ),
        actions:<Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 28.0,
                ),
              )
          ),
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 320,
                  padding: EdgeInsets.only(right: 10.0,top: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:16.0,bottom: 7.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(width: 3.0,color: Colors.white)
                              ),
                            ),
                            child: Text("Home",
                              style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:16.0,bottom: 7.0),
                          child: Text("Fokus",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:16.0,bottom: 7.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/populer');
                            },
                            child: Text("Populer",
                              style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:16.0,bottom: 7.0),
                          child: Text("Nasional",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:16.0,bottom: 7.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profil');
                            },
                            child: Text("Home",
                              style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 40.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0,bottom: 3.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body:
      load ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                          onTap: () {
                             setState(() {
                               value++;
                               if((value % 2) == 0){
                                 pictures="Landingpage.jpg";
                               }else{
                                 pictures="metropolitan.jpg";
                               };
                             });
                          },
                          child: Image.asset('assets/'+pictures,)
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(left:10.0,top: 10.0),
                          width: 300.0,
                          child: Column(
                            children: [
                              Text("Pengamat: Kementrian Sektor Pangan Harus Dievaluasi",
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                            ],
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:10.0,top:4.0,right: 8.0),
                      child: Column(
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18.0,color: Colors.grey[500]),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top:8.0, bottom: 8.0),
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
              ),
              //Untuk scroll horizontal card
              Container(
                padding: EdgeInsets.all(10.0),
                color: mBackgroundColor,
                child: Column(
                  children: [
                    Row(
                      children: [
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
                padding: EdgeInsets.only(bottom: 10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    cardd(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", picture: "metropolitan.jpg",time: "16 menit yang lalu",),
                    cardd(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", picture: "metropolitan.jpg",time: "16 menit yang lalu",),
                    cardd(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", picture: "metropolitan.jpg",time: "16 menit yang lalu",),
                    cardd(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", picture: "metropolitan.jpg",time: "16 menit yang lalu",),
                  ],
                ) ,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/tv.png"),
              color: Colors.black38,
              size: 33,),
            label: 'CNN TV',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5.0,top: 5.0),
              child: ImageIcon(
                AssetImage("assets/profile.png"),
                color: Colors.black38,
                size: 23,),
            ),
            label: 'PROFILE',
            backgroundColor: Colors.purple,
          ),

        ],
      ),
    );
  }

}

