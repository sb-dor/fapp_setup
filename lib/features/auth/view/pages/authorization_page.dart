import 'package:auto_route/annotations.dart';
import 'package:fapp_setup/generated/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // just select whole word and click to lamp
          // in order to extract to ARB file
          S.of(context).authorizationPage,
        ),
      ),
    );
  }
}
