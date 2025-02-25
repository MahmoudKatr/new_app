import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/widget/cutom_card.dart';
import 'package:news_app/cubits/new_cubit/news_cubit.dart';
import 'package:news_app/cubits/new_cubit/news_state.dart';

class AppleScreen extends StatefulWidget {
  const AppleScreen({super.key});

  @override
  State<AppleScreen> createState() => _AppleScreenState();
}

class _AppleScreenState extends State<AppleScreen> {
  DateTime to = DateTime.now();
  DateTime from = DateTime.now().subtract(const Duration(days: 7));

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context)
        .fetchData('apple', from.toString(), to.toString());
  }

  void selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(start: from, end: to),
      firstDate: DateTime(2023),
      lastDate: to,
    );

    if (picked != null) {
      print('picked: ${picked.start} - ${picked.end}');

      BlocProvider.of<NewsCubit>(context)
          .fetchData('apple', picked.start.toString(), picked.end.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            centerTitle: true,
            title: const Text('Apple News'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => selectDateRange(context),
              ),
            ]),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "From: ${state.from.toLocal().toString().split(' ')[0]} - To: ${state.to.toLocal().toString().split(' ')[0]}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return CustomCard(articles: state.articles[index]);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is NewsError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
