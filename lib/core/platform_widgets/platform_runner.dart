import 'package:fapp_setup/core/platform_widgets/platform_button.dart';
import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformRunner extends StatelessWidget {
  const PlatformRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? const CupertinoApp(
            home: CupertinoPageScaffold(
              child: Center(child: PlatformButton()),
            ),
          )
        : const MaterialApp(
            home: Scaffold(
              body: Center(child: PlatformButton()),
            ),
          );
  }
}
