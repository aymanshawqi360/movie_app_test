import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_test/core/extensions/theme_extension.dart';
import 'package:movie_app_test/core/theme/cubit/themes_cubit.dart';
import 'package:movie_app_test/core/util/style.dart';
import 'package:movie_app_test/features/home/presentation/widget/movie_bloc_builder.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Movies"),

        actions: [
          IconButton(
            onPressed: () {
              if (context.isDartMode) {
                context.read<ThemesCubit>().toggleTheme(ThemeMode.light);
              } else {
                context.read<ThemesCubit>().toggleTheme(ThemeMode.dark);
              }
            },
            icon: BlocBuilder<ThemesCubit, ThemeMode>(
              builder: (context, state) {
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500),
                  child: Icon(
                    (context.isDartMode)
                        ? Icons.dark_mode_outlined
                        : Icons.wb_sunny_outlined,
                  ),
                );
              },
            ),
          ),
        ],
        // backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: MovieBlocBuilder())]),
      ),
    );
  }
}
