import 'package:cached_network_image/cached_network_image.dart';
import 'package:task/core/core.dart';
import 'package:task/features/home/riverpod/home_notifier.dart';
import 'package:task/features/home/riverpod/home_provider.dart';
import 'package:task/features/home/views/widgets/shimmer.dart';

class CategoriesWidget extends StatelessWidget {
  final ContactState state;
  const CategoriesWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return state.isLoading
            ? CategoriesShimmer()
            : SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.categories.length,
                  separatorBuilder: (_, w) => const SizedBox(width: 16),
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
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryColor
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
                                width: 56.w,
                                height: 56.w,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.name ?? "",
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected
                                  ? AppColors.primaryColor
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
}
