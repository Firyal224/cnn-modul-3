import 'package:cnn_app/api_url.dart';
import 'package:cnn_app/services/api_services.dart';
import 'package:flutter/material.dart';

class TerUpdatePage extends StatefulWidget {
  TerUpdatePage({Key? key}) : super(key: key);

  @override
  State<TerUpdatePage> createState() => _TerUpdatePageState();
}

class _TerUpdatePageState extends State<TerUpdatePage> {
  List data = [];
  bool loading = true;


  @override
  void initState() {
    getData();
    super.initState();
  }



  getData() async {
    print(ApiUrl.fetchData);
    ApiServices apiServices = ApiServices();
    apiServices.getDataV2(
      url: ApiUrl.fetchData
    ).then((value) {
      print(value);
      // setState(() {
      //  data = value.data["data"];  
      //  loading = false;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height  * 0.7,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  title: Text("${data[index]["judul"]}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),                  
                  ),
                  subtitle: Text("${data[index]["konten"]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),                  
                  ),
                  trailing: SizedBox(
                    height: 180,
                    width: 120,
                    child:data[index]["images"] == "" ? SizedBox()
                    : Image.network(
                      "http://10.0.2.2:8000/images/${data[index]["images"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          alignment: Alignment.center,
                          title: Center(
                            child: Text(data[index]["judul"],
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        );
                    });
                  },
                );
              }
              ),
          ),
        ),
      )
    );
  }
}