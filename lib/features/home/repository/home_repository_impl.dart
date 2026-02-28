import 'package:task/core/constants/app_constants.dart';
import 'package:task/core/core.dart';
import 'package:task/core/network/api_client.dart';
import 'package:task/features/home/model/contacts_api_response_model/contacts_api_response_model.dart';

import 'home_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final Ref ref;

  ContactRepositoryImpl(this.ref);

  @override
  Future<ContactsApiResponseModel> fetchContacts() async {
    final response = await ref
        .read(apiClientProvider)
        .get(AppConstants.contactUrl);

    return ContactsApiResponseModel.fromMap(response.data);
  }
}
