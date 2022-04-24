import 'package:flutter/material.dart';
import 'home_page.dart';
import 'populer.dart';
import 'profil.dart';
class mainPage extends StatefulWidget {
  const mainPage({ Key? key }) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
           body: const TabBarView(
                children: [
                  HomePage(title: "",),
                  Text("page belum dibuat"),
                  Profil(title: ""),
      
                ],
              ),
        bottomNavigationBar: TabBar(
              tabs: [
                Tab(icon: 
                Column(
                  children: [
                    Icon(Icons.home, color: Colors.grey[500],),
                    Text("Home" ,style: TextStyle(fontSize: 14,color: Colors.grey[500],))
                  ],
                )
                ),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
        ),
      ),
    );
  }
}