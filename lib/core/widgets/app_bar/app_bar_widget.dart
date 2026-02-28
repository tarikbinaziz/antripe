// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool centerTitle;
  final bool showBackButton;

  const AppBarWidget({
    super.key,
    this.title,
    this.actions = const [],
    this.backgroundColor = Colors.transparent,
    this.iconColor,
    this.centerTitle = false,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      titleSpacing: 0.0,
      centerTitle: centerTitle,
      title: Text(
        title ?? '',
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      iconTheme: IconThemeData(color: iconColor ?? colorScheme.onSurface),
      // leading: showBackButton ? CustomBackButton() : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
