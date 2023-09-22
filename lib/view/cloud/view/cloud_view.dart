// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
import 'package:enhance/core/base/widget/image/text_to_image_body.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/random_colorful.dart';
import 'package:enhance/core/base/widget/wait_dialog/wait_dialog.dart';
import 'package:enhance/core/components/empty_lottie.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/core/constants/page_constants.dart';
import 'package:enhance/core/init/save_image/save_image_to_gallery.dart';
import 'package:enhance/view/cloud/vm/cloud_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends BaseState<Cloud> with SingleTickerProviderStateMixin {
  static final customCachedManage = CacheManager(
    Config('textToImageCacheManager',
        stalePeriod: const Duration(minutes: 5), maxNrOfCacheObjects: 1),
  );

  CloudViewModel _viewModel = CloudViewModel();
  final TextEditingController _textController = TextEditingController();

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
    return BaseView<CloudViewModel>(
        onPageBuilder: (BuildContext context, Store value) => SafeArea(
              child: _body,
            ),
        viewModel: CloudViewModel());
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
                  title: "Text To Image",
                  width: 60,
                  height: 60,
                  lastIconPath: _viewModel.textToImagePath != null ||
                          AppConst.textToImagePath != null
                      ? AppIcons.APPLOTTIE_DOWNLOAD
                      : null,
                  onTap: _viewModel.textToImagePath != null ||
                          AppConst.textToImagePath != null
                      ? () {
                          dialogBuilder(context,
                              saveImageToGallery(AppConst.textToImage!));
                        }
                      : null);
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
              if (_viewModel.textToImagePath != null ||
                  AppConst.textToImagePath != null)
                cachedImageBody(
                    context: context,
                    key: const Key("textToImage"),
                    imagePath: AppConst.textToImagePath!)
              else
                buildEmptyLottie(
                    width: dynamicWidth(.6), height: dynamicHeight(.5))
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
            if (_textController.text.isNotEmpty) {
              await DefaultCacheManager().emptyCache().then((value) =>
                  dialogBuilder(context,
                      _viewModel.initCloudModel(text: _textController.text)));
            }
          },
        ),
      );

  // Widget get _newFolderButton => Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: <Widget>[
  //         IconButton(
  //           onPressed: () {},
  //           icon: SvgPicture.asset(AppIcons.APPICON_WHITE_FOLDER_ADD),
  //         ),
  //       ],
  //     );

  // Widget get _folderGrid => Container(
  //       margin: EdgeInsetsDirectional.symmetric(horizontal: dynamicWidth(.025)),
  //       width: dynamicWidth(.9),
  //       height: dynamicHeight(.5),
  //       child: GridView.count(
  //         crossAxisCount: 4,
  //         crossAxisSpacing: 10,
  //         mainAxisSpacing: 10,
  //         children: <Widget>[
  //           _folder(title: "Travel"),
  //           _folder(title: "Work"),
  //           _folder(title: "My Family"),
  //           _folder(title: "Friends"),
  //           _folder(
  //               title: "Workkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"),
  //           _folder(title: "My Family"),
  //         ],
  //       ),
  //     );

  // Widget _folder({required String title}) {
  //   return Container(
  //     width: 64,
  //     height: 64,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(12), color: randomColorful()),
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SvgPicture.asset(
  //             AppIcons.APPICON_WHITE_FOLDER,
  //             width: 30,
  //             height: 30,
  //           ),
  //           Flexible(
  //               child: AutoSizeText.rich(
  //             TextSpan(text: title),
  //             overflow: TextOverflow.ellipsis,
  //           ))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
