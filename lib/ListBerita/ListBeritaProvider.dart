import 'package:flutter/material.dart';
import 'package:cnn_app/ListBerita/ListBeritaModel.dart';

class ListBeritaProvider with ChangeNotifier{
  List<ListBeritaModel> _beritaList = [];

  List<ListBeritaModel> get beritaList => _beritaList;

  void addJudulBerita(ListBeritaModel judul) {
    _beritaList.add(judul);
    notifyListeners();
  }

  void removeListBerita(ListBeritaModel judul){
    _beritaList = _beritaList.where((item) => item.id != judul.id).toList();
    notifyListeners();
  }

  void updateListBerita(ListBeritaModel judul){
    _beritaList[_beritaList.indexWhere((item) => item.id == judul.id)] = judul;
    notifyListeners();
  }
}
