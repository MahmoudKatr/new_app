import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/widget/cutom_card.dart';
import 'package:news_app/cubits/new_cubit/news_cubit.dart';
import 'package:news_app/cubits/new_cubit/news_state.dart';

class BussinessScreen extends StatelessWidget {
  const BussinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: const Text('Bussiness News'),
        ),
        body: BlocProvider(
          create: (context) => NewsCubit()..fetchData('business'),
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoaded) {
                return ListView.builder(
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) {
                    return CustomCard(articles: state.articles[index]);
                  },
                );
              } else if (state is NewsError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
