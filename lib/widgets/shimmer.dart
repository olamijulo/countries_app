import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreenLoading extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  const ShimmerScreenLoading(
      {super.key,
      required this.height,
      required this.width,
       this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.1),
        highlightColor: Colors.white60,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.7),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 2.0))),
          height: height,
          width: width,
        ));
  }
}
