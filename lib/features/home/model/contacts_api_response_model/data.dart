import 'dart:convert';

import 'category.dart';
import 'contact.dart';

class Data {
  List<Category>? categories;
  List<Contact>? contacts;

  Data({this.categories, this.contacts});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    categories: (data['categories'] as List<dynamic>?)
        ?.map((e) => Category.fromMap(e as Map<String, dynamic>))
        .toList(),
    contacts: (data['contacts'] as List<dynamic>?)
        ?.map((e) => Contact.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'categories': categories?.map((e) => e.toMap()).toList(),
    'contacts': contacts?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
