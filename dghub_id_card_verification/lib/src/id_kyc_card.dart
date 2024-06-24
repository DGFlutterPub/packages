import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IDKycCard extends StatelessWidget {
  final File? photo;
  final String? photoUrl;
  final Function() onTap;
  const IDKycCard({
    this.photoUrl,
    required this.photo,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    getLoading() {
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        height: 180,
      );
    }

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            height: 180,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade300),
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Lottie.asset(
                'packages/dghub_id_card_verification/assets/kyc.json'),
          ),
          if (photoUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                photoUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
                loadingBuilder: (context, child, loadingProgress) =>
                    getLoading(),
                errorBuilder: (context, error, stackTrace) => getLoading(),
              ),
            ),
          if (photo != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                photo!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: theme.primaryColor),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 25,
                )),
          )
        ],
      ),
    );
  }
}
