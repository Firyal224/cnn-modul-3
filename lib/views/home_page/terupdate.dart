// ignore_for_file: unnecessary_string_interpolations

import 'package:cnn_app/api_url.dart';
import 'package:cnn_app/services/api_services.dart';
import 'package:cnn_app/widget/alert.dart';
import 'package:flutter/material.dart';

class TerUpdatePage extends StatefulWidget {
  TerUpdatePage({Key? key}) : super(key: key);

  @override
  State<TerUpdatePage> createState() => _TerUpdatePageState();
}

class _TerUpdatePageState extends State<TerUpdatePage> {
  List data = [];
  bool loading = true;
  TextEditingController judulController = TextEditingController();
  TextEditingController kontenController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  //
  TextEditingController eDjudulController = TextEditingController();
  TextEditingController eDkontenController = TextEditingController();
  TextEditingController eDkategoriController = TextEditingController();


  @override
  void initState() {
    getData();
    super.initState();
  }



  Future getData() async {
    print(ApiUrl.fetchData);
    ApiServices apiServices = ApiServices();
    apiServices.getDataV2(
      url: ApiUrl.fetchData
    ).then((value) {
      print(value);
      setState(() {
       data = value.data["data"];  
       loading = false;
      });
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
                      "http://192.168.1.45:8000/images/${data[index]["images"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertForEditDelete(
                          judulController: eDjudulController,
                          kategoriController: eDkategoriController,
                          kontenController: eDkontenController,
                          data: data[index],
                          deleteData: (){
                            delteBerita(int.parse(data[index]["id"].toString()));
                            setState(() {
                              getData();
                            });
                          },
                          editData: (){
                            setState(() {
                              getData();
                            });
                          },
                        );
                        
                    });
                  },
                );
              }
              ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Tambah berita"),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: judulController,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            isDense: true,
                            fillColor: Colors.grey.shade100,
                            labelText: "Judul",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Masukkan judul",
                          ),
                        ),
                        SizedBox(height: 8,),
                         TextField(
                          controller: kontenController,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            isDense: true,
                            fillColor: Colors.grey.shade100,
                            labelText: "Konten",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Masukkan konten",
                          ),
                        ),
                        SizedBox(height: 8,),
                         TextField(
                          controller: kategoriController,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            isDense: true,
                            fillColor: Colors.grey.shade100,
                            labelText: "Katogeri ID",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Masukkan Katogori ID",
                          ),
                        ),
                        SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);},
                      child: const Text("Cancel", style: TextStyle(color: Colors.red),)),
                    TextButton(
                        onPressed: (){
                          if(kategoriController.text == "1" ||
                             kategoriController.text == "2" ||
                             kategoriController.text == "3"  
                          ){
                            addBerita().then((value) {
                              Navigator.pop(context);
                              setState(() {
                                loading = true;
                                
                                getData();
                                judulController.clear();
                                kontenController.clear();
                                kategoriController.clear();
                              });
                            });
                          } else {
                            print("Id kategori belum teridentifikasi");
                          }
                        },
                        child: const Text("Tambah", style: TextStyle(color: Colors.blue),)),
                  ],
                );
              });
        },
        child: const Icon(Icons.add,),
      ),
    );
  }



  Future addBerita() async {
    ApiServices apiServices = ApiServices();
    await apiServices.postDataWithTokenV2(
      url: ApiUrl.baseUrl + "v1/admin/store", 
      parameters: {
        "judul" : judulController.text,
        "konten" : kontenController.text,
        "kategori_id": kategoriController.text,
      }, 
      isJson: true
    );
  }

  Future delteBerita(int id) async {
    ApiServices apiServices = ApiServices();
    await apiServices.deleteWithtoken(
      url: ApiUrl.baseUrl + "v1/admin/delete/$id"
    ).then((value) {
      print(value);
    });
  }
}