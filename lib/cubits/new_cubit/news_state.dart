import 'package:news_app/model/model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Articles> articles;
  NewsLoaded(this.articles);
}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}
