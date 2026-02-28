import 'dart:convert';

import 'data.dart';

class ContactsApiResponseModel {
  String? status;
  String? message;
  Data? data;

  ContactsApiResponseModel({this.status, this.message, this.data});

  factory ContactsApiResponseModel.fromMap(Map<String, dynamic> data) {
    return ContactsApiResponseModel(
      status: data['status'] as String?,
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
    'status': status,
    'message': message,
    'data': data?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContactsApiResponseModel].
  factory ContactsApiResponseModel.fromJson(String data) {
    return ContactsApiResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ContactsApiResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
