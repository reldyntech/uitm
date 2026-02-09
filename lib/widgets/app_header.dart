import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final bool showBack;
  final bool showClose;
  final Widget? trailing;

  const AppHeader({
    super.key,
    required this.title,
    this.onBack,
    this.onClose,
    this.showBack = true,
    this.showClose = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showBack
          ? Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF6A1B9A), size: 20),
                onPressed: onBack ?? () => Navigator.of(context).pop(),
              ),
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF424242),
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: true,
      actions: [
        if (trailing != null) trailing!,
        if (showClose)
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.close, color: Color(0xFF6A1B9A), size: 20),
              onPressed: onClose ??
                  () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
