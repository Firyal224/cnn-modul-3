// ignore_for_file: prefer_const_constructors

import 'package:cnn_app/model/tv_model_list.dart';
import 'package:cnn_app/services/tv_list_provider.dart';
import 'package:cnn_app/widget/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddEditListTv extends StatelessWidget {
  //const AddEditComTvicRating({Key? key}) : super(key: key);
  final String judul;
  final TvModel? title;
  const AddEditListTv({
    Key? key,
    required this.judul,
    this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController _titleTvController = TextEditingController();
    TextEditingController _durationTvController = TextEditingController();

    if (title != null){
      _titleTvController.text = title!.title;
    }

    return AlertDialog(
      title: Text(judul),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleTvController,
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
            SizedBox(height: 4,),
            TextField(
              controller: _durationTvController,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                isDense: true,
                fillColor: Colors.grey.shade100,
                labelText: "Durasi",
                labelStyle: TextStyle(color: Colors.black),
                hintText: "Masukkan durasi",
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
              if(_titleTvController.text.isEmpty){
                showDialog(
                    context: context,
                    builder: (context){
                      return const InfoWidget(
                        title: "Error",
                        content: "Data tidak boleh kosong!"
                      );
                    },);
              }else{
                if(title != null ){
                  Provider.of<TvListProvider>(context, listen: false).updateTvList(
                    TvModel(
                        id: title!.id,
                        title: _titleTvController.text,
                        duration: _durationTvController.text,
                        )
                  );

                }else{
                  const uuid = Uuid();
                  Provider.of<TvListProvider>(context, listen: false).addTvTitle(
                    TvModel(id: uuid.v4(),
                      title: _titleTvController.text,
                      duration: _durationTvController.text,
                    ),
                  );
                }
                Navigator.pop(context);

              }
            },
            child: const Text("Save", style: TextStyle(color: Colors.blue))),
      ],
    );
  }
}