import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_bloc.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<NewsBloc, NewsState>(builder: (ctx, state) {
              switch (state.data.status) {
                case DataStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case DataStatus.success:
                  return _newsList(state.data.response?.newsList ?? []);
                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _newsList(List<News> news) {
    return Column(
      children: [
        ...List.generate(
            news.length,
            (index) => ListTile(
                  title: Text(news[index].title ?? "N/A"),
                  subtitle: Text(news[index].description ?? "N/A"),
                ))
      ],
    );
  }
}
