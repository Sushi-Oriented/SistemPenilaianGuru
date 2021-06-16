import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final Image image;
  const UserImage({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 100,
      height: 100,
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   image: DecorationImage(
      //       image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
      //       fit: BoxFit.fill),
      // ), // fetch image from network
      child: CircleAvatar(
        radius: 16.0,
        child: ClipRRect(
          child: image,
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    );
  }
}
