import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final networkUriRef = RegExp('^http');
final localUriRef = RegExp('^lib/assets');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(this.src, {super.key, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    var noDataImage = Image.asset("lib/assets/images/no_data.png");

    if (networkUriRef.hasMatch(src)) {
      try {
        return CachedNetworkImage(
          imageUrl: src,
          fit: fit,
          width: width,
          height: height,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      colorFilter: const ColorFilter.mode(
                          Colors.red, BlendMode.colorBurn),
                      fit: BoxFit.cover)),
            );
          },
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => noDataImage,
        );
      } catch (e) {
        return noDataImage;
      }
    }

    if (localUriRef.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    return Container();
  }
}
