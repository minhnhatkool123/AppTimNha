import 'package:flutter/material.dart';

class OntapImage extends StatelessWidget {
  final String imageFile;
  final VoidCallback onImageTap;

  const OntapImage({this.imageFile, this.onImageTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 4,
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
