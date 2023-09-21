import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_news/core/routing/routes.dart';
import 'package:sample_news/features/common/widgets/card_with_image.dart';
import 'package:sample_news/features/common/widgets/custom_network_image.dart';
import 'package:sample_news/features/news/ui/list/state_management/news_cubit.dart';

class NewsListFeatured extends StatelessWidget {
  const NewsListFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return state.featuredArticle == null
            ? const SizedBox.shrink()
            : CardWithImage(
                image: CustomNetworkImage(url: state.featuredArticle!.imageUrl),
                onTap: () => context.push(
                  Routes.newsDetails,
                  extra: state.featuredArticle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.featuredArticle!.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.featuredArticle!.description ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
