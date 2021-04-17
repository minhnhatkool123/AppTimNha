import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailImage extends StatefulWidget {
  final List<String> listImageTest;
  final int index;

  const DetailImage({this.listImageTest, this.index});

  @override
  _DetailImageState createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  int _currentindex;
  PageController _pageController;
  @override
  void initState() {
    _currentindex = widget.index;
    _pageController = PageController(initialPage: _currentindex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          _buildContent(),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.listImageTest
            .map<Widget>(
              (String imagePath) => _buildDot(imagePath),
            )
            .toList(),
      ),
    );
  }

  Container _buildDot(String imagePath) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentindex == widget.listImageTest.indexOf(imagePath)
            ? Colors.white
            : Colors.grey.shade700,
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
      child: PhotoViewGallery.builder(
        itemCount: widget.listImageTest.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.listImageTest[index]),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 1.8,
            //disableGestures: true,
          );
        },
        pageController: _pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
