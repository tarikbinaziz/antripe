import 'package:task/core/core.dart';
import 'package:task/core/routes/app_router.dart';
import 'package:task/gen/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(
                Assets.pngs.logo.path,
                width: 126.w,
                height: 123.h,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.w),
                  topRight: Radius.circular(28.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(24.h),
                  Text(
                    "Welcome",
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38.sp,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Pellentesque fames lobortis vestibulum nisi nulla egestas nibh tincidunt nunc.",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      fontSize: 16.sp,
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        context.push(Routes.home);
                      },
                      child: Text(
                        "Getting Started",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
