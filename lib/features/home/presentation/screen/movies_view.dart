import 'package:flutter/material.dart';
import 'package:movie_app_test/features/home/presentation/widget/movie_bloc_builder.dart';
import 'package:movie_app_test/features/home/presentation/widget/movie_card.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: MovieBlocBuilder())]),
      ),
    );
  }
}
