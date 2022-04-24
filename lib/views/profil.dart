import 'package:flutter/material.dart';



class Profil extends StatefulWidget {
  final String title;
  const Profil({Key? key, required this.title,}) : super(key: key);
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  Widget portrait(){
    return Column(
          children:<Widget>  [
            Container(
              height: 100.0,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    margin: EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 100,
                      child: Text(
                        'Me',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ), //Text
                    ),
                  ),
                ],
              ) ,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                        leading: Icon(Icons.list),
                        trailing: Text("GFG",
                          style: TextStyle(
                              color: Colors.green,fontSize: 15),),
                        title:Text("List item $index")
                    );
                  }
              ),
            ),
          ],
        );


  }
  Widget landscape(){
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/home');
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
                child: const  Icon(
                  Icons.search,
                  size: 28.0,
                ),
              )
          ),
        ],
      ),

      body: OrientationBuilder(
        builder: (context,orientation){
          if(orientation == Orientation.portrait){
            return portrait();
          }else{
            return landscape();
          }
        },
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
