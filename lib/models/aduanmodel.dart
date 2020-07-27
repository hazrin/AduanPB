
class AduanModel{
   String namaPengadu;
   int id;
   String aduan;
   DateTime created;
   String nouser;

  AduanModel({
    this.id,
    this.namaPengadu,
    this.aduan,
    this.created,
    this.nouser
  });

  
  factory AduanModel.fromJson(Map<String,dynamic> json) {
    return new AduanModel(      
      id: int.parse(json['id']),
      namaPengadu: json['namapengadu'],
      aduan: json['aduan'],
      created: DateTime.parse(json['created']),
      nouser: json['nouser'],
    );
  }

  Map<String, dynamic> toJson() => {    
    "id": id,
    "namapengadu": namaPengadu,
    "aduan": aduan,
    "nouser": nouser,
  }; 
}

class AduanList {
  final List<AduanModel> aduanList;

  AduanList({
    this.aduanList,
  });

  factory AduanList.fromJson(List<dynamic> json){
    List<AduanModel> aduans = new List<AduanModel>();
    aduans = json.map((f) => AduanModel.fromJson(f)).toList();

    return new AduanList(
      aduanList: aduans
    );
  }
  
}