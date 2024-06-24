import 'package:dghub_auth/src/widgets/social_icon.dart';
import 'package:flutter/material.dart';

class SocialListItem extends StatelessWidget {
  final String loadAsset;
  final String label;
  final Function() onTap;
  const SocialListItem(
      {required this.onTap,
      required this.label,
      required this.loadAsset,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey.shade400),
            color: theme.cardColor,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SocialIcon(
                loadAsset: loadAsset,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 12),
              )
            ],
          )),
    );
  }
}
