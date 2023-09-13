import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:flutter/material.dart';

Widget topBar(
    {required context,
    String? path,
    required double width,
    required double height,
    Function()? onTap,
    required String title}) {
  return SafeArea(
    child: Container(
        margin: EdgeInsetsDirectional.symmetric(
            vertical: MediaQuery.of(context).size.height * .01),
        height: MediaQuery.of(context).size.height * .05,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              )),
          actions: <Widget>[
            path != null
                ? IconButton(
                    onPressed: onTap,
                    icon: LottieCustomWidget(
                      path: path,
                      width: 45,
                      height: 45,
                    ),
                  )
                : const SizedBox(
                    width: 25,
                  ),
          ],
        )),
  );
}
