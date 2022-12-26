import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? fullName;
  final String? email;
  final String? image;
  final String investorId;
  final String? phoneNum;
  final String token;
  const AuthUser({
    required this.id,
    this.fullName,
    this.email,
    this.image,
    required this.investorId,
    this.phoneNum,
    required this.token,
  });
  // tạo người dùng trống, khi chưa xác thực,
  // object này sẽ dược trả về
  static AuthUser empty() => const AuthUser(id: '', investorId: '', token: '');

  // Kiểm tra user hiện tại có trống hay không
  bool get isEmpty => this == empty();

  bool get isNotEmpty => !isEmpty;

  // Phương thức ghi đè bắt buộc của Equatable
  @override
  List<Object?> get props =>
      [id, fullName, email, image, phoneNum, token, investorId];

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      image: json['image'],
      investorId: json['investorId'],
      phoneNum: json['phoneNum'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'fullName': this.fullName,
      'email': this.email,
      'image': this.image,
      'investorId': this.investorId,
      'phoneNum': this.phoneNum,
      'token': this.token
    };
  }
}
