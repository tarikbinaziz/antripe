import 'package:task/core/core.dart';
import 'package:task/features/contact/riverpod/contact_provider.dart';
import 'package:task/features/contact/views/widgets/add_contact_bottom_sheet.dart';
import 'package:task/features/contact/views/widgets/categories_widget.dart';
import 'package:task/features/contact/views/widgets/contact_header.dart';
import 'package:task/features/contact/views/widgets/contact_list.dart';
import 'package:task/gen/assets.gen.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<ContactScreen> {
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
      floatingActionButton: GestureDetector(
        onTap: () {
          showAddContactSheet(context);
        },
        child: Image.asset(
          width: 64.w,
          height: 64.w,
          Assets.pngs.floatingIcon.path,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ContactsHeader(state: state),
            CategoriesWidget(state: state),
            ContactsList(state: state),
          ],
        ),
      ),
    );
  }
}
