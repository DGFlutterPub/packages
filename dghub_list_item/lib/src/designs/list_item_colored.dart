import 'package:dghub_list_item/src/model/list_item_config.dart';
import 'package:flutter/material.dart';

class ListItemColored extends StatelessWidget {
  final ListItemConfig config;
  const ListItemColored({required this.config, super.key});

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
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              config.iconColor ?? theme.primaryColor,
                              config.iconColor ?? theme.primaryColor,
                              config.iconColor?.withOpacity(0.5) ??
                                  theme.primaryColor.withOpacity(0.5)
                            ]),
                      ),
                      child: Icon(
                        config.icon,
                        color: Colors.white,
                        size: 20,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      config.label,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  if (config.rightWidget != null) config.rightWidget!,
                  SizedBox(
                    width: 15,
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
