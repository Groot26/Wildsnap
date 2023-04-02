class User {
  late String name;
  late String userName;
  late String phone;
  late String email;
  late String token;
  late String dob;
  late String id;
  late String profilePic;
  late String password;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.token,
    required this.profilePic,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['username'];
    phone = json['phone'];
    email = json['email'];
    //dob = json['dob'];
    id = json['id'];
    profilePic = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['password'] = this.password;
    //data['token'] = this.token;
    //data['id'] = this.id;
    //data['imageUrl'] = this.profilePic;
    return data;
  }
}
