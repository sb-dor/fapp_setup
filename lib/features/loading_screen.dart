import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fapp_setup/services/app_routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_connection/bloc/internet_connection_bloc.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InternetConnectionBloc>().add(const CheckInternetConnection());
    AutoRouter.of(context).replaceAll(
      [const HomeRoute()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
