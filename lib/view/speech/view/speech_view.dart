// ignore_for_file: library_private_types_in_public_api, unused_field, prefer_final_fields, sort_child_properties_last
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/wait_dialog/wait_dialog.dart';
import 'package:enhance/core/components/empty_lottie.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/view/speech/vm/speech_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends BaseState<Speech>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final audioPlayer = AssetsAudioPlayer();
  final SpeechViewModel _viewModel = SpeechViewModel();
  final FocusNode _focusNode = FocusNode();
  AnimationController? _controller;
  Animation? _animation;

  bool _isPlaying = false;
  Duration audioDuration = Duration.zero;
  Duration audioPosition = Duration.zero;

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
    audioPlayer.dispose();
    if (_controller != null) {
      _controller!.dispose();
    }
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SpeechViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: SpeechViewModel());
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
                  lastIconPath:
                      _viewModel.audioUrl != null || AppConst.audioUrl != null
                          ? AppIcons.APPLOTTIE_DOWNLOAD
                          : null,
                  onTap:
                      _viewModel.audioUrl != null || AppConst.audioUrl != null
                          ? () {
                              dialogBuilder(context, _viewModel.saveAudio());
                            }
                          : null);
            }),
            _folderBody(context)
          ],
        ),
      );

  Widget _folderBody(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
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
            if (_viewModel.audioUrl != null || AppConst.audioUrl != null)
              _buildAudioBody()
            else
              buildEmptyLottie(
                  width: dynamicWidth(.6), height: dynamicHeight(.5))
          ],
        );
      }),
    );
  }

  AudioWidget _buildAudioBody() {
    return AudioWidget.network(
        onFinished: () => setState(() {
              _isPlaying = false;
            }),
        onReadyToPlay: (duration) {
          //onReadyToPlay
          setState(() {
            audioDuration = duration;
          });
        },
        onPositionChanged: (current, duration) {
          //onPositionChanged
          setState(() {
            audioPosition = current;
          });
        },
        play: _isPlaying,
        child: Container(
          padding: EdgeInsets.only(top: dynamicHeight(.02)),
          margin: EdgeInsets.only(top: dynamicHeight(.05)),
          width: dynamicWidth(.8),
          height: dynamicHeight(.4),
          decoration: BoxDecoration(
              color: AppColors.APPCOLOR_BLUE_2.withOpacity(.7),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Center(
                  child: SizedBox(
                width: dynamicWidth(.7),
                height: 65,
                child: const LottieCustomWidget(
                  path: AppIcons.APPLOTTIE_BLUE_AI,
                  width: 35,
                  height: 35,
                ),
              )),
              SizedBox(
                width: dynamicWidth(.7),
                height: dynamicHeight(.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () => _viewModel.fetchAudio("audioUrl"),
                      child: LottieCustomWidget(
                          path: AppIcons.APPLOTTIE_AUDIO,
                          width: dynamicWidth(.5),
                          height: dynamicHeight(.9)),
                    ),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            _isPlaying = !_isPlaying;
                          });
                        },
                        icon: Icon(
                          !_isPlaying ? Icons.arrow_right : Icons.pause,
                          size: 50,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: dynamicWidth(.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeBody(audioDuration),
                    _buildTimeBody(audioPosition),
                  ],
                ),
              ),
            ],
          ),
        ),
        url: _viewModel.audioUrl ?? AppConst.audioUrl ?? "");
  }

  Container _buildTimeBody(Duration duration) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.APPCOLOR_BLUE_3,
            borderRadius: BorderRadius.circular(15)),
        child: Text(formatTime(duration)));
  }

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
              await dialogBuilder(context,
                  _viewModel.initSpeechModel(text: _textController.text));
            }
          },
        ),
      );

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

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
