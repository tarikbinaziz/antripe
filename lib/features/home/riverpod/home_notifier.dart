import 'package:flutter_riverpod/legacy.dart';
import 'package:task/features/home/model/contacts_api_response_model/category.dart';
import 'package:task/features/home/model/contacts_api_response_model/contact.dart';
import 'package:task/features/home/repository/home_repository.dart';

enum ContactTab { contact, recent }

class ContactState {
  final bool isLoading;
  final String? error;
  final List<Contact> contacts;
  final List<Category> categories;
  final String? selectedCategoryId;
  final String searchQuery;
  final ContactTab tab;

  ContactState({
    required this.isLoading,
    required this.contacts,
    required this.categories,
    this.error,
    this.selectedCategoryId,
    this.searchQuery = '',
    this.tab = ContactTab.contact,
  });

  ContactState copyWith({
    bool? isLoading,
    String? error,
    List<Contact>? contacts,
    List<Category>? categories,
    String? selectedCategoryId,
    String? searchQuery,
    ContactTab? tab,
    bool clearCategory = false,
  }) {
    return ContactState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      contacts: contacts ?? this.contacts,
      categories: categories ?? this.categories,
      tab: tab ?? this.tab,
      selectedCategoryId: clearCategory
          ? null
          : (selectedCategoryId ?? this.selectedCategoryId),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<Contact> get filteredContacts {
    return contacts.where((contact) {
      final matchesCategory = selectedCategoryId == null
          ? true
          : contact.categoryId == selectedCategoryId;

      final name = contact.name ?? '';
      final phone = contact.phone ?? '';

      final matchesSearch =
          name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          phone.contains(searchQuery);
      final matchesStatus = tab == ContactTab.recent
          ? contact.status?.toLowerCase() == "active"
          : true;

      return matchesCategory && matchesSearch && matchesStatus;
    }).toList();
  }
}

class ContactNotifier extends StateNotifier<ContactState> {
  final ContactRepository repository;

  ContactNotifier(this.repository)
    : super(ContactState(isLoading: false, contacts: [], categories: []));

  Future<void> fetchContacts() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await repository.fetchContacts();

      if (response.status == "success" && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          contacts: response.data!.contacts ?? [],
          categories: response.data!.categories ?? [],
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? "Something went wrong",
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void selectCategory(String? id) async {
    if (id == "all") {
 
      state = state.copyWith(clearCategory: true);

      /// 🔁 call API again for ALL contacts
      await fetchContacts();
    } else {
   
      state = state.copyWith(selectedCategoryId: id);
    }
  }

  void search(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void changeTab(ContactTab tab) {
    state = state.copyWith(tab: tab);
  }
}
