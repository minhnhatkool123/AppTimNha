import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailImage extends StatefulWidget {
  final List<String> listImageTest;
  final int index;

  const DetailImage({this.listImageTest, this.index});

  @override
  _DetailImageState createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      //height: 150,
      //width: MediaQuery.of(context).size.width,
      child: PhotoView(
        imageProvider: NetworkImage(widget.listImageTest[widget.index]),
        minScale: PhotoViewComputedScale.contained * 1,
        maxScale: PhotoViewComputedScale.covered * 1.8,
      ),
    );
  }
}
