import 'package:dghub_list_item/src/model/list_item_config.dart';
import 'package:flutter/material.dart';

class ListItemSimple extends StatelessWidget {
  final ListItemConfig config;
  const ListItemSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (config.headerLabel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              config.headerLabel!,
              style: TextStyle(fontSize: 10),
            ),
          ),
        GestureDetector(
          onTap: config.onTap,
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: theme.cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(config.icon),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      config.label,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  if (config.enabledArrow)
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    )
                ],
              )),
        )
      ],
    );
  }
}
