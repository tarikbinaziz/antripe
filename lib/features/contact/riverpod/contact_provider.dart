import 'package:flutter_riverpod/legacy.dart';
import 'package:task/core/core.dart';
import 'package:task/features/contact/repository/contact_repository_impl.dart';
import 'package:task/features/contact/riverpod/contact_notifier.dart';

final contactRepositoryProvider = Provider((ref) => ContactRepositoryImpl(ref));

final contactControllerProvider =
    StateNotifierProvider<ContactNotifier, ContactState>((ref) {
      final repo = ref.read(contactRepositoryProvider);
      return ContactNotifier(repo);
    });
