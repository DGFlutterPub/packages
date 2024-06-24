import 'package:flutter/material.dart';

class DGHubBottomBarListItem extends StatelessWidget {
  final String label;
  final List<Widget> children;
  final Function() onTap;
  final bool selected;
  const DGHubBottomBarListItem(
      {required this.onTap,
      required this.label,
      required this.children,
      required this.selected,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                      if (selected)
                        Icon(
                          Icons.radio_button_checked,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        )
                      else
                        const Icon(
                          Icons.radio_button_off,
                          color: Colors.grey,
                          size: 25,
                        )
                    ],
                  ),
                ),
               ...children
                        .map(
                          (e) => e,
                        )
                        .toList()
              ],
            ),
          )),
    );
  }
}
