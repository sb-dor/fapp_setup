import 'dart:math';

import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// for sliver app bar animation :
// https://stackoverflow.com/questions/59243525/sliver-appbar-collapsing-toolbar-animate-title-from-left-to-center-in-flutter
class PlatformSliverNavigationBar extends StatelessWidget {
  const PlatformSliverNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? const CupertinoPageScaffold(
            child: _CustomScrollViewHelper(),
          )
        : const Scaffold(
            body: _CustomScrollViewHelper(),
          );
  }
}

class _CustomScrollViewHelper extends StatefulWidget {
  const _CustomScrollViewHelper({super.key});

  @override
  State<_CustomScrollViewHelper> createState() => _CustomScrollViewHelperState();
}

class _CustomScrollViewHelperState extends State<_CustomScrollViewHelper> {
  final ScrollController _scrollController = ScrollController();
  static const _kBasePadding = 16.0;
  static const kExpandedHeight = 140.0;

  final ValueNotifier<double> _titlePaddingNotifier = ValueNotifier(_kBasePadding);

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 60.0;

    if (_scrollController.hasClients) {
      return min(
          _kBasePadding + kCollapsedPadding,
          _kBasePadding +
              (kCollapsedPadding * _scrollController.offset) / (kExpandedHeight - kToolbarHeight));
    }

    return _kBasePadding;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
  }

  void _listener() {
    _titlePaddingNotifier.value = _horizontalTitlePadding;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        if (PlatformHelper.isCupertino())
          CupertinoSliverNavigationBar(
            largeTitle: const Text("Scroll"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.info,
              ),
            ),
            // middle: Text("Ano"),
          )
        else
          SliverAppBar(
            expandedHeight: kExpandedHeight,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              title: ValueListenableBuilder(
                valueListenable: _titlePaddingNotifier,
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: value),
                    child: const Text("Title"),
                  );
                },
              ),
              background: Container(color: Colors.green),
            ),
          ),
        ...List.generate(100, (index) => index + 1).map(
          (element) => SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text("Element is: ${element}"),
            ),
          ),
        ),
      ],
    );
  }
}
