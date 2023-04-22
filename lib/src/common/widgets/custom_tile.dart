import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    required this.isSelected,
    required this.onTap,
    required this.data,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.leading,
    super.key,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final Map<String, dynamic> data;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? context.scheme.tertiary : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: context.bodyMd,
          ),
          subtitle: Text(
            subtitle,
            style: context.bodySm,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
