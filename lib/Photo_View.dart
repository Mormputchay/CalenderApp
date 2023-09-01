import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({super.key});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  final urlImage = [
    'https://www.allaboutbirds.org/news/wp-content/uploads/2020/07/STanager-Shapiro-ML.jpg',
    'https://cdn-acgla.nitrocdn.com/bvIhcJyiWKFqlMsfAAXRLitDZjWdRlLX/assets/static/optimized/rev-5131b73/wp-content/uploads/2020/07/Bengal-tiger-1.jpg',
    'https://previews.123rf.com/images/hermandesign2015/hermandesign20151711/hermandesign2015171100010/89753012-cartoon-happy-cow-smile-in-the-farm.jpg',
    'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/14/2022/05/T7NBXC.jpg',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: InkWell(
            onTap: openGallery,
            child: Ink.image(
              image: NetworkImage(urlImage.first),
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  void openGallery() => Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => GalleryWidget(
            urlImages: urlImage,
            index: 2,
          )));
}

class GalleryWidget extends StatefulWidget {
  final PageController pageController;
  final int index;
  final List<String> urlImages;
  GalleryWidget({super.key, required this.urlImages, this.index = 0})
      : pageController = PageController(initialPage: index);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.index;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PhotoViewGallery.builder(
              pageController: widget.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.urlImages.length,
              builder: (context, index) {
                final urlImage = widget.urlImages[index];
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(urlImage),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 4,
                );
              },
              onPageChanged: (index) => setState(() {
                this.index = index;
              }),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Image ${index + 1}/${widget.urlImages.length}',
                style: const TextStyle(color: Colors.white, fontSize: 19),
              ),
            )
          ],
        ),
      );
}
