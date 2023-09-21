import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_news/core/di/service_locator.dart';
import 'package:sample_news/core/routing/routes.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';
import 'package:sample_news/features/news/ui/list/state_management/news_cubit.dart';
import 'package:sample_news/features/news/ui/list/widgets/news_list_body.dart';

class ScreenNewsList extends StatelessWidget {
  const ScreenNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<NewsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppLogo(),
          actions: [
            IconButton(
                onPressed: () => context.push(Routes.profile),
                icon: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ))
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NewsListBody(),
        ),
      ),
    );
  }
}
