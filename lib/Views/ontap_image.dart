import 'package:flutter/material.dart';

class OntapImage extends StatelessWidget {
  final String imageFile;
  final VoidCallback onImageTap;

  const OntapImage({this.imageFile, this.onImageTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 200,
      child: InkWell(
        onTap: onImageTap,
        child: Image.network(
          imageFile,
          fit: BoxFit.fill,
        ),
      ),
    );
    ;
  }
}
