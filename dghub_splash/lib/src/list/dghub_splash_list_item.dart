import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DGHubSplashListItem extends StatelessWidget {
  final String label;
  final List<Widget> children;
  final Function() onTap;
  final bool selected;
  const DGHubSplashListItem(
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
                StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: children
                        .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: SizedBox(
                              width: 160,
                              height: 270,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: e)),
                            )))
                        .toList())
              ],
            ),
          )),
    );
  }
}
