import 'package:machine/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
    this.title,
  });

  final ImageProvider? imageProvider;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        titleSpacing: 10,
        backgroundColor: blackColor,
        automaticallyImplyLeading: true,
        title: Text(
          title ?? "",
          maxLines: 3,
          style: const TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          loadingBuilder: loadingBuilder,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          initialScale: initialScale,
          basePosition: basePosition,
          filterQuality: filterQuality,
          disableGestures: disableGestures,
          errorBuilder: errorBuilder,
        ),
      ),
    );
  }
}