import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name, email, uid;

  const UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }

  @override
  List<Object?> get props => [
        name,
        email,
        uid,
      ];
}
