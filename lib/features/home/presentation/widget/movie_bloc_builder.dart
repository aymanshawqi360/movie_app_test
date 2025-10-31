import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_state.dart';
import 'package:movie_app_test/features/home/presentation/widget/movie_card.dart';

class MovieBlocBuilder extends StatefulWidget {
  const MovieBlocBuilder({super.key});

  @override
  State<MovieBlocBuilder> createState() => _MovieBlocBuilderState();
}

class _MovieBlocBuilderState extends State<MovieBlocBuilder> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().movieState(isRefrash: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeSuccess ||
          current is HomeFailure,
      builder: (context, state) {
        switch (state) {
          case HomeLoading():
            return _buildLoadingState();
          case HomeSuccess():
            return _buildSuccessState(state: state);
          case HomeFailure():
            return _buildFailureState();

          default:
            return Text("Error Default");
        }
      },
    );
  }

  _buildLoadingState() {
    return Center(child: CircularProgressIndicator());
  }

  _buildSuccessState({required HomeSuccess state}) {
    final ccc = context.read<HomeCubit>();
    return ListView.builder(
      controller: scrollController,
      itemCount: ccc.movies.length + 1,
      // state.movies.length + 1,
      itemBuilder: (context, index) {
        if (index < ccc.movies.length) {
          return MovieCard(movieLocalDataSourceEntity: ccc.movies[index]);
        } else if (state is HomeFailure) {
          return Text("No Data");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildFailureState() {
    return Center(child: Text("Error"));
  }
}
