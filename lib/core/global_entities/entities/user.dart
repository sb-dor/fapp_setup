import 'package:flutter/foundation.dart';

@immutable
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? createdAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.createdAt,
  });
}
