import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:flutter/material.dart';

Widget topBar(
    {required context,
    String? leadingIconPath,
    String? lastIconPath,
    Function()? onTap,
    Function()? leadingOnTap,
    required dynamic title}) {
  return SafeArea(
    child: Container(
        margin: EdgeInsetsDirectional.symmetric(
            vertical: MediaQuery.of(context).size.height * .01),
        height: MediaQuery.of(context).size.height * .05,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: title.runtimeType == String
              ? Text(title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ))
              : title,
          leading: leadingIconPath != null
              ? IconButton(
                  onPressed: leadingOnTap,
                  icon: LottieCustomWidget(
                    path: leadingIconPath,
                    width: 45,
                    height: 45,
                  ),
                )
              : null,
          actions: <Widget>[
            lastIconPath != null
                ? IconButton(
                    onPressed: onTap,
                    icon: LottieCustomWidget(
                      path: lastIconPath,
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
