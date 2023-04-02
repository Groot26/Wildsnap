class User {
  late final String name;
  late final String userName;
  late final String phone;
  late final String email;
  late final String id;
  late final String profilePic;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.phone,
    required this.email,
    required this.profilePic,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['UserName'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    profilePic = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['id'] = this.id;
    data['imageUrl'] = this.profilePic;
    return data;
  }

}
