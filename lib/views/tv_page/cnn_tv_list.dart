// ignore_for_file: prefer_const_constructors

import 'package:cnn_app/services/tv_list_provider.dart';
import 'package:cnn_app/views/tv_page/add_edit_list_tv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvListPage extends StatelessWidget {
  const TvListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'CNN TV', style: TextStyle(color: Colors.white),),
      ),
      body: Consumer<TvListProvider>(builder: (
          context,
          tvListProviders,
          child,
      ){
        return ListView(
          padding: const EdgeInsets.all(20.0),
          children: tvListProviders.tvListProvider.isNotEmpty
              ?  tvListProviders.tvListProvider.map((data){
                return Dismissible(
                  key: Key(data.id),
                  background: Container(
                    color: Colors.red.shade300,
                    child: const Center(
                       child: Text("Hapus?",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        tvCard(
                          tvTitle: data.title,
                          duration: data.duration,
                          onPress: (){
                            showDialog(
                              context: context,
                              builder: (context){
                                return AddEditListTv(judul: "Edit", tvModel: data);
                            });
                          }
                        )
                      ],
                    ),
                  ),
                  onDismissed: (direction){
                    Provider.of<TvListProvider>(
                      context,
                      listen: false,
                      ).removeTvList(data);
                  },
                );
          }).toList()
              : [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100.0,
              child: const Center(
                child: Text("Tidak ada data!", textAlign: TextAlign.center,),
              ),
            ),
          ],
        );
      },),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return const AddEditListTv(judul: "Tambah Siaran",);
              });
        },
        child: const Icon(Icons.add,),
      ),
    );
  }
}




Widget tvCard(
{
  required String tvTitle,
  required String duration,
  required VoidCallback onPress,
}
){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onPress,
      child: SizedBox(
        height: 360,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Image.asset('assets/metropolitan.jpg',),
                Positioned(
                  left: 0, right: 0, bottom: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 50.0,
                     child: Icon(Icons.play_arrow_rounded, size: 70, color: Colors.black.withOpacity(0.6),),
                    
                  ),
                )
              ],
            ),
            Text(tvTitle,
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),
            ),
            Text("$duration Menit",
              style: TextStyle(fontSize: 15.0,color:Colors.grey[500]),
            ),
          ],
        ),
      ),
    ),
  );
}