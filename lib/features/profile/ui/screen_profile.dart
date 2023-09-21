import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/core/di/service_locator.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';
import 'package:sample_news/features/profile/ui/state_management/profile_cubit.dart';
import 'package:sample_news/features/profile/ui/widgets/profile_body.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppLogo()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: BlocProvider(
          create: (context) => serviceLocator<ProfileCubit>()..init(),
          child: const ProfileBody(),
        ),
      ),
    );
  }
}
