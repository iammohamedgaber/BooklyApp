import 'package:flutter/material.dart';

class CoustomBookImageItem extends StatelessWidget {
  const CoustomBookImageItem({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
