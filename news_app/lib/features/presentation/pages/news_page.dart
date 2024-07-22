import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/cubit/article_cubit.dart';
import 'package:news_app/features/presentation/cubit/article_state.dart';
import 'package:news_app/features/presentation/widgets/article_tile.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (_, state) {
        if (state is ArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is ArticleError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is ArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleTile(
                article: state.articles![index],
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
