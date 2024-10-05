import 'package:fapp_setup/core/platform_widgets/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformListTile extends StatelessWidget {
  const PlatformListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isCupertino()
        ? const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoListTile(
                title: Text("Cupertino listtile"),
                subtitle: Text("Cupertino subtitle"),
              ),
            ],
          )
        : const Center(
            child: ListTile(
              title: Text("Material listile"),
              subtitle: Text("Material subtitle"),
            ),
          );
  }
}
