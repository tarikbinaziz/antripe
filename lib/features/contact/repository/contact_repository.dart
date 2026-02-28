import 'package:task/features/contact/model/contacts_api_response_model/contacts_api_response_model.dart';

abstract class ContactRepository {
  Future<ContactsApiResponseModel> fetchContacts();
}
