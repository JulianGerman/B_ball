import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int xpPoints;
  final String rank;
  final int level;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.xpPoints,
    required this.rank,
    required this.level,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userDoc.id,
      name: userData!['name'],
      email: userData['email'],
      xpPoints: userData['xpPoints'],
      profileImage: userData['profileImage'],
      rank: userData['rank'],
      level: userData['level'],
    );
  }
  factory User.initialUser() {
    return const User(
      id: '',
      name: '',
      email: '',
      profileImage: '',
      xpPoints: -1,
      rank: '',
      level: 0,
    );
  }
  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      xpPoints,
      rank,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'xpPoints': xpPoints,
      'rank': rank,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'] ?? '',
      xpPoints: map['xpPoints']?.toInt() ?? 0,
      rank: map['rank'] ?? '',
      level: map['level']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
