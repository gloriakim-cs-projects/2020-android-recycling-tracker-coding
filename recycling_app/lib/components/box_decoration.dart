import 'package:flutter/material.dart';

/* 진짜 많이 쓰였음 Image Background */
BoxDecoration MyBoxDecoration(String imagename) {
  return BoxDecoration(
    color: Colors.black,
    image: DecorationImage(
      image: AssetImage('images/$imagename.jpg'),
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
      fit: BoxFit.cover,
    ),
  );
}
