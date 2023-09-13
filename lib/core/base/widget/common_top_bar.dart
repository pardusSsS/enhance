import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget topBar(
    {required context,
    String? svgPath,
    Function()? onTap,
    required String title}) {
  return Container(
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * (.05),
        right: MediaQuery.of(context).size.width * (.05),
        top: MediaQuery.of(context).size.height * (.05)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 25,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
        svgPath != null
            ? IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(svgPath),
              )
            : const SizedBox(
                width: 25,
              ),
      ],
    ),
  );
}
