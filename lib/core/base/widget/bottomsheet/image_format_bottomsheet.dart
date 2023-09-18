import 'package:enhance/view/resize/vm/converter_vm.dart';
import 'package:flutter/cupertino.dart';

const double _kItemExtent = 32.0;
const List<String> _fileNames = <String>[
  'JPEG',
  'PNG',
  'BMP',
  'TIFF',
  'TGA',
  'ICO',
  'GIF'
];

void ImageFormatBottomSheet(
    {required BuildContext context, required ConverterViewModel viewModel}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      // The Bottom margin is provided to align the popup above the system navigation bar.
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: _kItemExtent,
        // This sets the initial item.
        scrollController: FixedExtentScrollController(
          initialItem: viewModel.selectedIndex,
        ),
        // This is called when selected item is changed.
        onSelectedItemChanged: (int index) {
          viewModel.updateSelectedIndex(
              index: index, selectedItem: _fileNames[index]);
        },
        children: List<Widget>.generate(_fileNames.length, (int index) {
          return Center(child: Text(_fileNames[index]));
        }),
      ),
    ),
  );
}
