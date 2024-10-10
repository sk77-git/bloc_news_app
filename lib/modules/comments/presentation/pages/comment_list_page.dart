import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/presentation/blocs/comment_bloc.dart';
import 'package:bloc_news_app/modules/comments/presentation/blocs/comments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListPage extends StatelessWidget {
  const CommentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment List"),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(builder: (ctx, state) {
        switch (state.response.status) {
          case DataStatus.initial:
            return const Center(
                child: Text('Press the button to fetch comments'));
          case DataStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case DataStatus.success:
            return ListView.builder(
              itemCount: state.response.response!.comments.length,
              itemBuilder: (context, index) {
                final comment = state.response.response!.comments[index];
                return Card(
                  child: ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),
                  ),
                );
              },
            );
          case DataStatus.error:
            return Center(child: Text('Error: ${state.response.message}'));
          default:
            return const Center(child: Text('Unknown state'));
        }
      }),
    );
  }
}
