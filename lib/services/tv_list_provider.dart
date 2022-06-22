import 'package:cnn_app/model/tv_model_list.dart';
import 'package:flutter/foundation.dart';

class TvListProvider with ChangeNotifier{
  List<TvModel> _tvListProvider = [];

  List<TvModel> get tvListProvider => _tvListProvider;

  void addTvTitle(TvModel title) {
    _tvListProvider.add(title);
    notifyListeners();
  }

  void removeTvList(TvModel title){
    _tvListProvider = _tvListProvider.where((item) => item.id != title.id).toList();
    notifyListeners();
  }

  void updateTvList(TvModel title){
    _tvListProvider[_tvListProvider.indexWhere((item) => item.id == title.id)] = title;
    notifyListeners();
  }
}