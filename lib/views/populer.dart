import 'boxcard.dart';
import 'data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cardd.dart';
const mBackgroundColor = Color(0xffF5F6F8);

class PopulerPage extends StatefulWidget {
  // Meminta argumen yang wajib diisi saat akan mengarah ke halaman ini


  final String title;
  const PopulerPage({Key? key, required this.title,}) : super(key: key);

  @override
  State<PopulerPage> createState() => _PopulerPageState(title);
}

class _PopulerPageState extends State<PopulerPage> {
  String title;

  _PopulerPageState(this.title);
  bool loading = true;
  List data = [];
  @override
  void initState() {

    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        loading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.only(top: 8),
          child: Image.asset('assets/CnnLogo.png',width: 60.0,height: 80.0,),
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
                            child: GestureDetector(
                              onTap: (){
                                 Navigator.pushNamed(context, '/home');
                              },
                              child: Text("Home",
                                style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
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
                          child: Text("Terpopuler",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
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
                          child: Text("Home",
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
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

      body:loading ? Align(
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //Untuk scroll
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    cardd(title: title, picture: "metropolitan.jpg",time: "16 menit yang lalu",),
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


