import 'dart:io';

import 'package:flutter/material.dart';

class IDFrontCard extends StatelessWidget {
  final File? photo;
  final String? photoUrl;
  final Function() onTap;
  const IDFrontCard({
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 3, color: Colors.grey.shade300)),
                    padding: const EdgeInsets.all(20),
                    child: Icon(Icons.person,
                        size: 70, color: Colors.grey.shade300)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Front photo',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15, top: 15),
                          width: double.infinity,
                          height: 10,
                          color: Colors.grey.shade300),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: double.infinity,
                          height: 10,
                          color: Colors.grey.shade300),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: double.infinity,
                          height: 10,
                          color: Colors.grey.shade300),
                    ],
                  ),
                ),
              ],
            ),
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
