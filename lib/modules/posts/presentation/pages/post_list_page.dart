import 'package:bloc_news_app/modules/posts/presentation/blocs/post_bloc.dart';
import 'package:bloc_news_app/modules/posts/presentation/blocs/post_event.dart';
import 'package:bloc_news_app/modules/posts/presentation/blocs/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            BlocProvider.of<PostBloc>(context).add(FetchPosts());
          }),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Center(child: Text('Press the button to fetch posts'));
          } else if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.posts[index].title),
                  subtitle: Text(state.posts[index].body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
