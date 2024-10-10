import 'package:bloc_news_app/modules/news/data/repos/news_repo_impl.dart';
import 'package:bloc_news_app/modules/news/data/sources/remote/news_api.dart';
import 'package:bloc_news_app/modules/news/domain/usecases/get_news_list.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_bloc.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_event.dart';
import 'package:bloc_news_app/modules/news/presentation/pages/news_list_page.dart';
import 'package:bloc_news_app/modules/splash/presentation/blocs/splash_bloc.dart';
import 'package:bloc_news_app/modules/splash/presentation/blocs/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //       builder: (context) => BlocProvider(
            //             create: (context) => PostBloc(PostRepository()),
            //             child: const PostListPage(),
            //           )),
            // );
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //       builder: (context) => BlocProvider(
            //             create: (context) =>
            //                 TodoBloc(TodoRepo())..add(FetchTodoList()),
            //             child: const TodoListScreen(),
            //           )),
            // );

            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //       builder: (context) => BlocProvider(
            //             create: (context) => CommentBloc(
            //                 GetCommentList(CommentRepoImpl(CommentListApi())))
            //               ..add(FetchCommentList()),
            //             child: const CommentListPage(),
            //           )),
            // );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) =>
                            NewsBloc(GetNewsList(NewsRepoImpl(NewsApi())))
                              ..add(FetchNewsList()),
                        child: const NewsListPage(),
                      )),
            );
          }
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return const Center(child: Text('Loading...'));
          },
        ),
      ),
    );
  }
}
