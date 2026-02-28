import 'package:flutter_riverpod/legacy.dart';
import 'package:task/core/core.dart';
import 'package:task/features/home/repository/home_repository_impl.dart';
import 'package:task/features/home/riverpod/home_notifier.dart';

final contactRepositoryProvider = Provider((ref) => ContactRepositoryImpl(ref));

final contactControllerProvider =
    StateNotifierProvider<ContactNotifier, ContactState>((ref) {
      final repo = ref.read(contactRepositoryProvider);
      return ContactNotifier(repo);
    });
