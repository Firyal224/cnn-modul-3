class Data{
  final String title;
  final String? time;
  final String picture;


  Data({
    required this.title,
    this.time,
    required this.picture,


  });

  String getTitle(){
    return title;
  }

  String getPicture(){
    return picture;
  }


}