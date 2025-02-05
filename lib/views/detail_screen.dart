import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/views/web_view_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          articles.title ?? 'No Title',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  articles.urlToImage ??
                      'https://media.istockphoto.com/id/2149521043/photo/bituminous-shingle-tile-against-the-sky.jpg?s=2048x2048&w=is&k=20&c=XyHoFtCIWIefAArLXypyey9fe46WQGnSXEqC08_iz3M=',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                articles.description ?? 'No Description',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                articles.content ?? 'No Content',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text('Author: ${articles.author}'),
              Text('Published At: ${articles.publishedAt}'),
              const SizedBox(height: 16),
              Text('Url: ${articles.url}'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WebViewScreen(url: articles.url ?? ''),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Show News',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
