import 'package:flutter/material.dart';
import 'package:news_app/features/presentation/pages/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D A I L Y   N E W S',
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 2,
            color: Colors.grey[500],
          ),
          const Expanded(
            child: NewsPage(),
          ),
        ],
      ),
    );
  }
}
