import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/api_constant.dart';
import 'package:news_app/cubits/new_cubit/news_state.dart';
import 'package:news_app/model/model.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  void fetchData(String query, String from, String to) async {
    emit(NewsLoading());
    try {
      final response = await Dio().get(
        ApiConstants.baseUrl,
        queryParameters: {
          'q': query,
          'from': from,
          'to': to,
          'sortBy': 'popularity',
          'apiKey': ApiConstants.apiKey,
        },
      );
      final newsRespnse = NewsResponse.fromJson(response.data);
      emit(NewsLoaded(
          articles: newsRespnse.articles ?? [],
          from: DateTime.parse(from),
          to: DateTime.parse(to)));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
