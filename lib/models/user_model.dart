

class User{
  int? id ;
  String? userName;
  User({this.userName,this.id});
  User.fromMap(Map<String,dynamic> json):id = json["id"], userName=json["userName"];


  Map<String,dynamic> toMap()=>{
    "id":id,
    "userName": userName
  };



}