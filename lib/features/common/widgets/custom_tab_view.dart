import 'package:flutter/material.dart';
import 'package:sample_news/resources/resources.dart';

typedef OnTabTappedCallback = void Function(int);

class CustomTabView extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> children;
  final OnTabTappedCallback? onTabTapped;

  const CustomTabView({
    Key? key,
    required this.tabTitles,
    required this.children,
    this.onTabTapped,
  }) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
    _tabController.addListener(_refresh);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_refresh);
    _tabController.dispose();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            isScrollable: true,
            onTap: widget.onTabTapped,
            controller: _tabController,
            physics: const BouncingScrollPhysics(),
            tabs: widget.tabTitles
                .map(
                  (e) => CustomTab(
                    text: e,
                    tabController: _tabController,
                    index: widget.tabTitles.indexOf(e),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.children,
            ),
          )
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final TabController tabController;
  final int index;

  const CustomTab({
    Key? key,
    required this.text,
    required this.tabController,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 48,
      iconMargin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .withColor(Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  bool get _isSelected => tabController.index == index;
}
