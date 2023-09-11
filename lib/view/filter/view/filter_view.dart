// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/colorful_filter_selector.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:enhance/view/filter/vm/filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends BaseState<Filter> {
  final _globalKey = GlobalKey();
  final FilterViewModel _viewModel = FilterViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: FilterViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[_topBar, _imageBody, _filterBar],
      );

  Widget get _topBar => Container(
        margin: EdgeInsets.only(
            left: dynamicWidth(.05),
            right: dynamicWidth(.05),
            top: dynamicHeight(.01)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Text("Filters",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppPages.TICK),
            ),
          ],
        ),
      );

  Widget get _imageBody => GestureDetector(
        onTap: () => captureAndSaveImage(key: _globalKey),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.symmetric(
              horizontal: dynamicWidth(.05), vertical: dynamicHeight(.05)),
          height: dynamicHeight(.5),
          width: dynamicWidth(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ValueListenableBuilder(
              valueListenable: _viewModel.filterColor,
              builder: (BuildContext context, Color color, Widget? child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: RepaintBoundary(
                    key: _globalKey,
                    child: CachedNetworkImage(
                      imageUrl: 'https://googleflutter.com/sample_image.jpg',
                      color: color.withOpacity(0.5),
                      colorBlendMode: BlendMode.color,
                      fit: BoxFit.contain,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget get _filterBar => Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: dynamicWidth(.05)),
        width: dynamicWidth(1),
        height: dynamicHeight(.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_BLUE_3.withOpacity(.6)),
        child: FilterSelector(
          onFilterChanged: _viewModel.onFilterChanged,
          filters: _viewModel.filters,
        ),
      );

  // Function to capture and save the image
  Future<void> captureAndSaveImage({required GlobalKey key}) async {
    try {
      var status = await Permission.storage.request();
      // Capture the image as a byte data
      final boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      // Save the image to the gallery
      if (byteData != null) {
        final buffer = byteData.buffer.asUint8List();
        final result =
            await ImageGallerySaver.saveImage(Uint8List.fromList(buffer));

        // Save the filtered image to a file in the app's documents directory
        // final directory = await getExternalStorageDirectory();
        // final file = File('${directory?.path}/filtered_image.png');
        // await file.writeAsBytes(buffer);

        // Show a confirmation dialog
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Image Saved'),
              content:
                  Text('Filtered image has been saved to your phone storage.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error capturing and saving image: $e');
    }
  }
}
