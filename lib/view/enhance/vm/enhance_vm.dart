import 'package:enhance/core/contants/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'enhance_vm.g.dart';

class EnhanceViewModel = EnhanceViewBase with _$EnhanceViewModel;

abstract class EnhanceViewBase with Store {
  //XFile? singleImage;
  @observable
  String? editImage;

  @action
  Future<void> pickImage() async {
    //type 0: profile || 1: cover
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      editImage = pickedFile.path;
      AppConst.imagePath = pickedFile.path;
    }
  }

  @action
  void removeImage() {
    editImage = null;
    AppConst.imagePath = null;
  }
}
