class DoctorChat {
  DoctorChat({
     this.image,
     this.mail,
     this.name,
  });
   String image;
    String address;
    String mail;
    String name;

  DoctorChat.fromJson(Map<String, dynamic> json){
    image = json['image'];
    address = json['address'];
    mail = json['mail'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['address'] = address;
    _data['mail'] = mail;
    _data['name'] = name;
    return _data;
  }
}