import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileSearchController extends GetxController {
  final RxList userProfile = [
    'https://thumbs2.imgbox.com/bb/73/PVN0JFqQ_t.jpg',
    'https://thumbs2.imgbox.com/48/c6/JnXOWPiH_t.jpg',
    'https://thumbs2.imgbox.com/ca/37/KIZhvDlh_t.jpg',
    'https://thumbs2.imgbox.com/5b/5c/BNzTMXGG_t.jpg',
    'https://thumbs2.imgbox.com/93/77/ej2DZczV_t.jpg',
    'https://thumbs2.imgbox.com/59/72/czHqMimP_t.jpg',
    'https://thumbs2.imgbox.com/48/49/qnWDQ6bA_t.jpg',
    'https://thumbs2.imgbox.com/dc/3b/J1OTrDgf_t.jpg',
    'https://thumbs2.imgbox.com/86/68/6hLBwRFV_t.jpg',
    'https://thumbs2.imgbox.com/55/0e/gXURCTyM_t.jpg',
    'https://thumbs2.imgbox.com/82/d3/dbD9A44L_t.jpg',
    'https://thumbs2.imgbox.com/8c/55/bN41Dtse_t.jpg',
    'https://thumbs2.imgbox.com/df/6b/GMHIrybC_t.jpg',
    'https://thumbs2.imgbox.com/0b/2a/pdVvnnWh_t.jpg',
    'https://thumbs2.imgbox.com/36/ad/5ZF9GNrc_t.jpg',
    'https://thumbs2.imgbox.com/52/40/EvUlNs8u_t.jpg',
    'https://thumbs2.imgbox.com/c3/e2/u2BnUB20_t.jpg',
    'https://thumbs2.imgbox.com/26/0d/8Qon9tyH_t.jpg',
    'https://thumbs2.imgbox.com/1e/21/oeyojfGc_t.jpg',
    'https://thumbs2.imgbox.com/ae/0e/sw07Sjij_t.jpg',
    'https://thumbs2.imgbox.com/60/d4/1plQqhdQ_t.jpg',
    'https://thumbs2.imgbox.com/28/ed/xzB4M6rn_t.jpg',
    'https://thumbs2.imgbox.com/7d/c3/rzCfWpJO_t.jpg',
    'https://thumbs2.imgbox.com/8a/05/54YUYAWg_t.jpg',
  ].obs;

  getSearchResult(String searchQuery) {
    var snap = FirebaseFirestore.instance
        .collection('users')
        .where(
          'userName',
          isGreaterThanOrEqualTo: searchQuery,
        )
        .get();
    print(snap);
  }
}
