class SendOTPRequest {
  late String phone;

  SendOTPRequest({required this.phone});

  SendOTPRequest.fromJson(Map<String, dynamic> json) {
    this.phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}

class VerifyOTPRequest {
  late String phone;
  late String otp;

  VerifyOTPRequest({required this.phone, required this.otp});

  VerifyOTPRequest.fromJson(Map<String, dynamic> json) {
    this.phone = json['phone'];
    this.otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    return data;
  }
}

class SignUpRequest {
  late String name;
  late String userName;
  late String phone;
  late String email;
  late String dob;
  late String password;

  // "name": "Arjun Kumar",
  // "username": "AK47",
  // "phone": "9988776655",
  // "email": "email@email.com",
  // "dob": "1990-01-01",
  // "password": "password"

  SignUpRequest({
    required this.name,
    required this.userName,
    required this.phone,
    required this.dob,
    required this.email,
    required this.password,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.email = json['username'];
    this.phone = json['phone'];
    this.email = json['email'];
    this.email = json['dob'];
    this.email = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['password'] = this.password;
    return data;
  }
}
