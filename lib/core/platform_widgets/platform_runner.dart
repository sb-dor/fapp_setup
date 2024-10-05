import 'package:fapp_setup/core/platform_widgets/platform_button.dart';
import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:fapp_setup/core/platform_widgets/platform_listtile.dart';
import 'package:fapp_setup/core/platform_widgets/platform_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_context_menu.dart';
import 'cupertino_sliding_segment_control.dart';

class PlatformRunner extends StatelessWidget {
  const PlatformRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? const CupertinoApp(
            home: CupertinoPageScaffold(
              child: Center(
                child: SizedBox.expand(
                  child: CupertinoSlidingSegmentControl(),
                ),
              ),
            ),
          )
        : const MaterialApp(
            home: Scaffold(
              body: SizedBox.expand(
                child: Center(
                  child: CupertinoSlidingSegmentControl(),
                ),
              ),
            ),
          );
  }
}
