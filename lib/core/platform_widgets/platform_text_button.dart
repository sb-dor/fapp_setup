import 'package:fapp_setup/core/platform_widgets/platform_date_picker.dart';
import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextButton extends StatelessWidget {
  const PlatformTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? CupertinoButton(
            child: const Text("Text button"),
            onPressed: () {
              PlatformDateTimePicker.showPicker(
                context,
                mode: CupertinoDatePickerMode.time,
              );
            },
          )
        : TextButton(
            onPressed: () {
              PlatformDateTimePicker.showPicker(
                context,
                mode: CupertinoDatePickerMode.time,
              );
            },
            child: const Text("Text button"),
          );
  }
}
