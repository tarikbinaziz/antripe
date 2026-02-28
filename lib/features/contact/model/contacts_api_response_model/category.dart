import 'dart:convert';

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  factory Category.fromMap(Map<String, dynamic> data) =>
      Category(id: data['id'] as String?, name: data['name'] as String?);

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Category].
  factory Category.fromJson(String data) {
    return Category.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  String toJson() => json.encode(toMap());
}
