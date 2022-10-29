import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pizzapp/src/widget/carousel.dart';

class RestSenderDemo extends StatelessWidget {
  const RestSenderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('Disabled'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarouselDemo()),
              );
            },
            child: const Text('Carousel!!'),
          ),
        ],
      ),
    );
  }
}
