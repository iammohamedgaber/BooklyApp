import 'package:bookly/core/widgets/custom_loding_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoustomBookImageItem extends StatelessWidget {
  const CoustomBookImageItem({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(child: CustomLodingIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error_outline_outlined),
          ),
        
      ),
    );
  }
}


