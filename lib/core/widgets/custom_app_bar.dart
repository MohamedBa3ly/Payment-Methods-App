
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/styles.dart';

AppBar buildAppBar({
  final String? title,
  final VoidCallback? onTap, // Added onTap parameter
}) {
  return AppBar(
    leading: InkWell(
      onTap: onTap, // Use the provided function
      child: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
        ),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}

