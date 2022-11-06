import 'package:flutter/material.dart';
import '../model/image_model.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.images});
  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) => buildImage(images[index]));
  }
}

Widget buildImage(ImageModel imageModel) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(border: Border.all(width: 2)),
    child: Column(children: [
      Image.network(
        imageModel.url,
        scale: 1,
        repeat: ImageRepeat.noRepeat,
        width: 300,
        height: 300,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          imageModel.title,
        ),
      )
    ]),
  );
}
