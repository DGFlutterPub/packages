import 'package:dghub_tab/src/model/tab_config.dart';
import 'package:flutter/material.dart';
import '../tools/tab_indicator.dart';

class BorderTab extends StatefulWidget {
  final DGHubTabConfig config;
  const BorderTab({required this.config, super.key});

  @override
  State<BorderTab> createState() => _BorderTabState();
}

class _BorderTabState extends State<BorderTab> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: widget.config.tabs.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.appBarTheme.backgroundColor,
      child: DefaultTabController(
        length: widget.config.tabs.length,
        child: widget.config.bodys.isEmpty
            ? TabBar(
                onTap: (value) {
                  widget.config.changed(value, tabController);
                },
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                controller: tabController,
                indicator: TabIndicator(color: theme.primaryColor),
                tabs:
                    widget.config.tabs.map((e) => Tab(text: e.label)).toList())
            : CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: widget.config.pinned,
                  automaticallyImplyLeading: false,
                  flexibleSpace: TabBar(
                      tabAlignment: TabAlignment.start,
                      onTap: (value) {
                        widget.config.changed(value, tabController);
                      },
                      isScrollable: true,
                      controller: tabController,
                      indicator: TabIndicator(color: theme.primaryColor),
                      tabs: widget.config.tabs
                          .map((e) => Tab(text: e.label))
                          .toList()),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                      controller: tabController,
                      children: widget.config.bodys.map((e) => e).toList()),
                ),
              ]),
      ),
    );
  }
}
