import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/features/presentation/cubit/article_cubit.dart';
import 'package:news_app/features/presentation/pages/home_page.dart';
import 'package:news_app/injection_container.dart' as di;

void main() async {
  await di.initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final articleCubit = di.sl<ArticleCubit>();

    articleCubit.getArticles();

    return BlocProvider<ArticleCubit>(
      create: (context) => articleCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const HomePage(),
      ),
    );
  }
}
