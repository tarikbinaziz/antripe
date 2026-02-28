import 'package:cached_network_image/cached_network_image.dart';
import 'package:task/core/core.dart';
import 'package:task/features/home/riverpod/home_notifier.dart';
import 'package:task/features/home/riverpod/home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(contactControllerProvider.notifier).fetchContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactControllerProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1F6E54),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(ref, state),
            _buildCategories(state),
            Expanded(child: _buildBody(state)),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(WidgetRef ref, ContactState state) {
  final notifier = ref.read(contactControllerProvider.notifier);

  /// 🔎 SEARCH MODE
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
        ),
      ),
    );
  }

  /// 🧾 NORMAL HEADER
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => notifier.changeTab(ContactTab.contact),
              child: Column(
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: state.tab == ContactTab.contact
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 2,
                    width: 50,
                    color: state.tab == ContactTab.contact
                        ? const Color(0xFF1F6E54)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => notifier.changeTab(ContactTab.recent),
              child: Column(
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: state.tab == ContactTab.recent
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 2,
                    width: 50,
                    color: state.tab == ContactTab.recent
                        ? const Color(0xFF1F6E54)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            IconButton(
              onPressed: notifier.startSearch,
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildCategories(ContactState state) {
  return Consumer(
    builder: (context, ref, child) {
      return SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final category = state.categories[index];

            final isSelected = category.id == "all"
                ? state.selectedCategoryId == null
                : state.selectedCategoryId == category.id;

            return GestureDetector(
              onTap: () {
                debugPrint("Selected category: ${category.id}");
                ref
                    .read(contactControllerProvider.notifier)
                    .selectCategory(category.id);
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1F6E54)
                            : Colors.grey.shade200,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://randomuser.me/api/portraits/men/${index + 1}.jpg",
                        width: 40.w,
                        height: 40.w,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category.name ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      color: isSelected
                          ? const Color(0xFF1F6E54)
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildBody(ContactState state) {
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
    separatorBuilder: (_, __) => const Divider(),
    itemBuilder: (context, index) {
      final contact = state.filteredContacts[index];

      return ListTile(
        leading: const CircleAvatar(),
        title: Text(contact.name ?? ""),
        subtitle: Text(contact.phone ?? ""),
        trailing: const Icon(Icons.more_vert),
      );
    },
  );
}
