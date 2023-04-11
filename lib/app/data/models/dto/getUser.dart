class GetUser {

  String name;
  String image;
  String userName;

  GetUser({
    required this.name,
    required this.image,
    required this.userName,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
      name: json['name'],
      userName: json['symbol'],
      image: json['image'],
    );
  }
}

List<GetUser> userList = [];