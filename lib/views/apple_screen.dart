import 'package:flutter/material.dart';
import 'package:news_app/components/widget/cutom_card.dart';

class AppleScreen extends StatelessWidget {
  const AppleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CustomCard(
          image:
              'https://media.istockphoto.com/id/2149521043/photo/bituminous-shingle-tile-against-the-sky.jpg?s=2048x2048&w=is&k=20&c=XyHoFtCIWIefAArLXypyey9fe46WQGnSXEqC08_iz3M=',
          title:
              'Hi, Mahmoud! This is a long text that should wrap to the next line when there is no space available.',
        );
      },
    ));
  }
}
