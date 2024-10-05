import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSwitch extends StatefulWidget {
  const PlatformSwitch({super.key});

  @override
  State<PlatformSwitch> createState() => _PlatformSwitchState();
}

class _PlatformSwitchState extends State<PlatformSwitch> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? CupertinoSwitch(
            value: val,
            onChanged: (value) {
              setState(() {
                val = !val;
              });
            },
          )
        : Switch(
            value: val,
            onChanged: (value) {
              setState(() {
                val = !val;
              });
            },
          );
  }
}
