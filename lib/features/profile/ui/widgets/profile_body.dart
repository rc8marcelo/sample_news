import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/features/common/widgets/app_logo.dart';
import 'package:sample_news/features/profile/ui/state_management/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(isLarge: true),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Hello, John Doe!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Expanded(
              child: DragAndDropLists(
                onItemReorder: context.read<ProfileCubit>().onItemReorder,
                onListReorder: context.read<ProfileCubit>().onListReorder,
                onItemAdd: context.read<ProfileCubit>().onItemAdd,
                onListAdd: context.read<ProfileCubit>().onListAdd,
                children: state.when(
                  ready: (s) => s,
                  processing: (s) => s,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
