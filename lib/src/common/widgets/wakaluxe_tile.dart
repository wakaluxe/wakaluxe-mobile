import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxTile extends StatelessWidget {
  const WakaluxTile({
    required this.isSelected,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    super.key,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? context.colorScheme.tertiary : Colors.transparent,
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
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: context.bodySm,
                )
              : null,
          trailing: trailing,
        ),
      ),
    );
  }
}
