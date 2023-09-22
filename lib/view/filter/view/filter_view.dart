// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/colorful_filter_selector.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/view/filter/vm/filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends BaseState<Filter>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final audioPlayer = AssetsAudioPlayer();
  final FilterViewModel _viewModel = FilterViewModel();

  final FocusNode _focusNode = FocusNode();
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_controller != null) {
        if (_focusNode.hasFocus) {
          _controller?.forward();
        } else {
          _controller?.reverse();
        }
      }
    });
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: FilterViewModel());
  }

  Widget get _body => InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Observer(builder: (context) {
              return topBar(
                context: context,
                title: "Text To Speech",
                width: 60,
                height: 60,
                // lastIconPath: _viewModel.textToImagePath != null ||
                //         AppConst.textToImagePath != null
                //     ? AppIcons.APPLOTTIE_DOWNLOAD
                //     : null,
                // onTap: _viewModel.textToImagePath != null ||
                //         AppConst.textToImagePath != null
                //     ? () {
                //         dialogBuilder(context,
                //             saveImageToGallery(AppConst.textToImage!), null);
                //       }
                //     : null
              );
            }),
            _folderBody
          ],
        ),
      );

  Widget get _folderBody => Container(
        margin: EdgeInsetsDirectional.symmetric(
            vertical: dynamicHeight(.05), horizontal: dynamicWidth(.05)),
        width: dynamicWidth(1),
        height: dynamicHeight(.65),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_NAVBAR),
        child: Observer(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _textBody,
              IconButton(
                  onPressed: () async {
                    Audio audio = Audio.network(
                        "https://samplelib.com/lib/preview/mp3/sample-3s.mp3",
                        playSpeed: 1.5);
                    await audioPlayer.open(audio);
                  },
                  icon: Icon(Icons.start))
            ],
          );
        }),
      );

  Widget get _textBody => Container(
        margin: EdgeInsets.only(top: dynamicHeight(.02)),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_BLUE_4.withOpacity(.5),
        ),
        width: dynamicWidth(.8),
        height: dynamicHeight(.08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: dynamicWidth(.7),
              child: TextFormField(
                maxLines: 10,
                minLines: 1,
                focusNode: _focusNode,
                controller: _textController,
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "write...",
                    icon: LottieCustomWidget(
                      path: AppIcons.APPLOTTIE_AI,
                      height: 35,
                      width: 35,
                    )),
              ),
            ),
            _buildSendButton
          ],
        ),
      );

  Container get _buildSendButton => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.APPCOLOR_BLUE_3),
        width: dynamicWidth(.07),
        height: dynamicWidth(.07),
        child: IconButton(
          icon: SvgPicture.asset(
            AppIcons.APPICON_RIGHT_ARROW,
          ),
          onPressed: () async {
            // if (_textController.text.isNotEmpty) {
            //   await DefaultCacheManager().emptyCache().then((value) =>
            //       dialogBuilder(
            //           context,
            //           _viewModel.initCloudModel(text: _textController.text),
            //           null));
            // }
          },
        ),
      );

  // Widget get _body => Stack(
  //       children: <Widget>[
  //         topBar(
  //             height: 60,
  //             width: 60,
  //             context: context,
  //             title: "Filters",
  //             lastIconPath: AppIcons.APPLOTTIE_TICK),
  //         AppConst.imagePath != null
  //             ? Positioned(
  //                 right: dynamicWidth(.05),
  //                 left: dynamicWidth(.05),
  //                 bottom: dynamicHeight(.3),
  //                 child: _imageBody,
  //               )
  //             : Positioned(
  //                 right: dynamicWidth(.05),
  //                 left: dynamicWidth(.05),
  //                 bottom: dynamicHeight(.4),
  //                 child: nullImageBody(context: context)),
  //         _filterBar
  //       ],
  //     );

  // Widget get _imageBody => Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       margin: EdgeInsetsDirectional.symmetric(
  //           horizontal: dynamicWidth(.05), vertical: dynamicHeight(.05)),
  //       height: dynamicHeight(.5),
  //       width: dynamicWidth(1),
  //       child: ValueListenableBuilder(
  //         valueListenable: _viewModel.filterColor,
  //         builder: (BuildContext context, Color color, Widget? child) {
  //           return _buildImage(color);
  //         },
  //       ),
  //     );

  // ClipRRect _buildImage(Color color) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(20),
  //     child: RepaintBoundary(
  //       key: const Key("filterImage"),
  //       child: Image.file(
  //         File(AppConst.imagePath!),
  //         color: color.withOpacity(0.5),
  //         colorBlendMode: BlendMode.color,
  //         fit: BoxFit.contain,
  //       ),
  //     ),
  //   );
  // }

  // Widget get _filterBar => Positioned(
  //       bottom: dynamicHeight(.2),
  //       right: dynamicWidth(.05),
  //       left: dynamicWidth(.05),
  //       child: Container(
  //         key: const Key("ColorFilterBar"),
  //         width: dynamicWidth(1),
  //         height: dynamicHeight(.1),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: AppColors.APPCOLOR_BLUE_3.withOpacity(.6)),
  //         child: FilterSelector(
  //           onFilterChanged: _viewModel.onFilterChanged,
  //           filters: _viewModel.filters,
  //         ),
  //       ),
  //     );
}
