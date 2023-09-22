// ignore_for_file: annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enhance/core/base/model/first_usage_limit_model.dart';
import 'package:enhance/core/base/service/IFirestore_service.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/user_constants.dart';
import 'package:enhance/core/init/env/env.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService implements IFirestoreService {
  Future anonimLogin() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      AppUserConst.userUid = userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  @override
  Future userUsageCheck() async {
    final db = FirebaseFirestore.instance;
    var result =
        await db.collection(Env.userUsage).doc(AppUserConst.userUid).get();

    switch (result.exists) {
      case true:
        var data = result.data();
        var res = UsageLimitModel.fromJson(data!);
        AppUserConst.setUserUsageToLocal(res);
        break;
      case false:
        var usageLimit = await db.collection(Env.startPacket).get();
        var doc = usageLimit.docs.first.data();
        var res = UsageLimitModel.fromJson(doc);
        var data = SetUsageLimitData(
            textToImage: res.textToImage,
            textToSpeech: res.textToSpeech,
            converter: res.converter,
            enhance: res.enhance);
        await db
            .collection(Env.userUsage)
            .doc(AppUserConst.userUid)
            .set(data.toJson());
        break;
    }
  }
}
