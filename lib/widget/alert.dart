import 'package:cnn_app/api_url.dart';
import 'package:cnn_app/services/api_services.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String content;
  const InfoWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center,),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(content, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}



class AlertForEditDelete extends StatefulWidget {
  final Map data;
  final VoidCallback editData;
  final VoidCallback deleteData;
  final TextEditingController judulController;
  final TextEditingController kontenController;
  final TextEditingController kategoriController;
  const AlertForEditDelete({ Key? key, required this.data, required this.editData, required this.deleteData, required this.judulController, required this.kontenController, required this.kategoriController }) : super(key: key);

  @override
  State<AlertForEditDelete> createState() => _AlertForEditDeleteState();
}

class _AlertForEditDeleteState extends State<AlertForEditDelete> {

  @override
  void initState() {
   widget.judulController.text = widget.data["judul"].toString();
   widget.kontenController.text = widget.data["konten"].toString();
   widget.kategoriController.text = widget.data["id_kategori"].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: widget.judulController,
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
              controller: widget.kontenController,
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
              controller: widget.kategoriController,
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
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);},
            child: const Text("Cancel", style: TextStyle(color: Colors.black),)),
          TextButton(
            onPressed: (){
              editData();
              Navigator.pop(context);},
            child: const Text("Edit", style: TextStyle(color: Colors.green),)),
          TextButton(
            onPressed: (){
              widget.deleteData();
              Navigator.pop(context);},
            child: const Text("Delete", style: TextStyle(color: Colors.red),)),
        ],
      ),
    );
  }


  editData() async {
    ApiServices apiServices = ApiServices();
    await apiServices.postDataWithTokenV2(
      url: ApiUrl.baseUrl + "v1/admin/store/", 
      parameters: {
        "judul" : widget.judulController.text,
        "konten" : widget.kontenController.text,
        "kategori_id" : widget.kategoriController.text,
        "id" : widget.data["id"]
      }, 
      isJson: true
    ).then((value) {
      widget.editData();
    });
  }
}