class User {
  late final String name;
  late final String userName;
  late final String phone;
  late final String email;
  late final String dob;
  late final String? bio;
  late final String followersCount;
  late final String followingCount;
  late final String id;
  late final String profilePic;

  User(
      {required this.id,
      required this.name,
      required this.userName,
      required this.phone,
      required this.email,
      required this.profilePic,
      required this.followingCount,
      required this.followersCount,
      required this.dob,
      this.bio});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['username'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    profilePic = json['imageUrl'];
    dob = json['dob'];
    bio = json['bio'];
    followersCount = json['followers'].toString();
    followingCount = json['following'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['id'] = this.id;
    data['imageUrl'] = this.profilePic;
    data['dob'] = this.dob;
    data['bio'] = this.bio;
    return data;
  }
}
