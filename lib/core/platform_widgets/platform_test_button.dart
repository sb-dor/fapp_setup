import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTestButton extends StatelessWidget {
  const PlatformTestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? CupertinoButton(
            child: const Text("Text button"),
            onPressed: () {},
          )
        : TextButton(
            onPressed: () {},
            child: const Text("Text button"),
          );
  }
}
