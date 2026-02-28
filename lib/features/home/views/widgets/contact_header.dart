import 'package:task/core/core.dart';
import 'package:task/features/home/riverpod/home_notifier.dart';
import 'package:task/features/home/riverpod/home_provider.dart';
import 'package:task/features/home/views/widgets/tab_item.dart';

class ContactsHeader extends ConsumerWidget {
  final ContactState state;

  const ContactsHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(contactControllerProvider.notifier);

    if (state.isSearching) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          autofocus: true,
          onChanged: notifier.search,
          decoration: InputDecoration(
            hintText: "Search contact...",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: notifier.stopSearch,
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tabs
          Row(
            children: [
              TabItem(
                label: "Contact",
                isActive: state.tab == ContactTab.contact,
                onTap: () => notifier.changeTab(ContactTab.contact),
              ),
              const SizedBox(width: 20),
              TabItem(
                label: "Recent",
                isActive: state.tab == ContactTab.recent,
                onTap: () => notifier.changeTab(ContactTab.recent),
              ),
            ],
          ),
          // Actions
          Row(
            children: [
              IconButton(
                onPressed: notifier.startSearch,
                icon: const Icon(Icons.search),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
          ),
        ],
      ),
    );
  }
}