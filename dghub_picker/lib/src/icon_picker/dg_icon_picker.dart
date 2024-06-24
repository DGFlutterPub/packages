import 'package:dghub_listview/dghub_listview.dart';
import 'package:dghub_picker/src/icon_picker/icons_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DGHubIconPicker extends StatefulWidget {
  final Function(IconData icon) result;
  const DGHubIconPicker({required this.result, super.key});

  @override
  State<DGHubIconPicker> createState() => _DGHubIconPickerState();
}

class _DGHubIconPickerState extends State<DGHubIconPicker> {
  List<IconData> list = IconsList.fontAwesome;
  List<IconData> fontAwesome = [];
  int _page = 0; // default page to 0
  final int _perPage = 50;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    fontAwesome =
        list.sublist((_page * _perPage), ((_page * _perPage) + _perPage));
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (kDebugMode) {
            print("reached end");
          }

          setState(() {
            if (list != fontAwesome) {
              _page += 1;
              fontAwesome.addAll(list.sublist(
                  (_page * _perPage), ((_page * _perPage) + _perPage)));
            }
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: DGHubGridView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(5),
                    physics: const AlwaysScrollableScrollPhysics(),
                    horizontalSpacing: 5,
                    verticalSpacing: 5,
                    gridCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          widget.result(fontAwesome[index]);
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.cardColor),
                            padding: const EdgeInsets.all(20),
                            child: Icon(fontAwesome[index])),
                      );
                    },
                    itemCount: fontAwesome.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
