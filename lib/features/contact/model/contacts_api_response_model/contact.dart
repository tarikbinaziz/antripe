import 'dart:convert';

class Contact {
  String? id;
  bool? isEmpty;
  String? name;
  String? phone;
  String? categoryId;
  String? avatarUrl;
  String? subtitle;
  String? status;
  String? createdAt;

  Contact({
    this.id,
    this.isEmpty,
    this.name,
    this.phone,
    this.categoryId,
    this.avatarUrl,
    this.subtitle,
    this.status,
    this.createdAt,
  });

  factory Contact.fromMap(Map<String, dynamic> data) => Contact(
    id: data['id'] as String?,
    isEmpty: data['isEmpty'] as bool?,
    name: data['name'] as String?,
    phone: data['phone'] as String?,
    categoryId: data['categoryId'] as String?,
    avatarUrl: data['avatarUrl'] as String?,
    subtitle: data['subtitle'] as String?,
    status: data['status'] as String?,
    createdAt: data['createdAt'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'isEmpty': isEmpty,
    'name': name,
    'phone': phone,
    'categoryId': categoryId,
    'avatarUrl': avatarUrl,
    'subtitle': subtitle,
    'status': status,
    'createdAt': createdAt,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Contact].
  factory Contact.fromJson(String data) {
    return Contact.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Contact] to a JSON string.
  String toJson() => json.encode(toMap());
}
