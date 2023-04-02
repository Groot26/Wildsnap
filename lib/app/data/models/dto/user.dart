class User {
  late final String name;
  late final String userName;
  late final String phone;
  late final String email;
  late final String dob;
  late final int followersCount;
  late final int followingCount;
  late final String id;
  late final String profilePic;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.phone,
    required this.email,
    required this.profilePic,
    required  this.followingCount,
    required this.followersCount,
    required this.dob
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['username'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    profilePic = json['imageUrl'];
    //dob = json['dob'];
    followersCount = json['followers'];
    followingCount = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['id'] = this.id;
    data['imageUrl'] = this.profilePic;
    //data['dob'] = this.dob;
    data['followers'] = this.followersCount;
    data['following'] = this.followingCount;
    return data;
  }

}
