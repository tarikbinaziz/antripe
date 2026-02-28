import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/home/riverpod/home_notifier.dart';

class ContactsList extends StatelessWidget {
  final ContactState state;

  const ContactsList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text(state.error!));
    }

    if (state.filteredContacts.isEmpty) {
      return const Center(child: Text("No contacts found"));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: state.filteredContacts.length,
      separatorBuilder: (_, __) => const Divider(color: Colors.black12),
      itemBuilder: (context, index) {
        final contact = state.filteredContacts[index];

        return ListTile(
          leading: ClipOval(
            child: CachedNetworkImage(
              imageUrl: contact.avatarUrl ?? "",
              width: 48.w,
              height: 48.w,
              placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
              errorWidget: (context, url, error) => const Icon(Icons.person),
            ),
          ),
          title: Text(contact.name ?? ""),
          subtitle: Text(contact.phone ?? ""),
        );
      },
    );
  }
}