// ignore_for_file: file_names, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cnn_app/ListBerita/ListBeritaModel.dart';
import 'package:cnn_app/ListBerita/ListBeritaProvider.dart';
import 'package:cnn_app/ListBerita/info.dart';

class ListBeritaService extends StatelessWidget {
  //const AddEditComicRating({Key? key}) : super(key: key);
  final String title;
  final ListBeritaModel? judul;
  const ListBeritaService({
    Key? key,
    required this.title,
    this.judul,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController _beritaController = TextEditingController();

    if (judul != null){
      _beritaController.text = judul!.judul;
    }

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _beritaController,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.red.shade100, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                isDense: true,
                fillColor: Colors.grey.shade100,
                labelText: "Berita",
                labelStyle: TextStyle(color: Colors.red.shade100),
                hintText: "Judul Berita",
              ),
            ),

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
              if(_beritaController.text.isEmpty){
                showDialog(
                    context: context,
                    builder: (context){
                      return const infoWidget(
                        title: "Error",
                        content: "Inputkan data!!!"
                      );
                    },);
              }else{
                if(judul != null ){
                  Provider.of<ListBeritaProvider>(context, listen: false).updateListBerita(
                    ListBeritaModel(
                        id: judul!.id,
                        judul: _beritaController.text,)
                  );

                }else{
                  const uuid = Uuid();
                  Provider.of<ListBeritaProvider>(context, listen: false).addJudulBerita(
                    ListBeritaModel(id: uuid.v4(),
                        judul: _beritaController.text,),
                  );
                }
                Navigator.pop(context);

              }
            },
            child: const Text("Save", style: TextStyle(color: Colors.red))),
      ],
    );
  }
}
