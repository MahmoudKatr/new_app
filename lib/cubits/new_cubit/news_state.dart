import 'package:news_app/model/model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Articles> articles;
  final DateTime from;
  final DateTime to;
  NewsLoaded({required this.articles, required this.from, required this.to});
}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}
