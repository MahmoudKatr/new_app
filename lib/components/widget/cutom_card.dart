import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.articles,
  });

  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      articles.urlToImage ??
                          'https://media.istockphoto.com/id/2149521043/photo/bituminous-shingle-tile-against-the-sky.jpg?s=2048x2048&w=is&k=20&c=XyHoFtCIWIefAArLXypyey9fe46WQGnSXEqC08_iz3M=',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    articles.title ?? 'No Title',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow:
                        TextOverflow.ellipsis, // Ensures full text appears
                    maxLines: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
