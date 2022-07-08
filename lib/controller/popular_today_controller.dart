import 'package:crud/services/remote_service.dart';

import 'package:get/get.dart';

import '../model/topsongs_module.dart';

class PopularTodayController extends GetxController {
  var isLoding = true.obs;
  var popularSongsList = <TopSongs>[].obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoding(true);
      var data = await RemoteServices.fetchTopSongs(
          "https://yephow.herokuapp.com/api/v1/populartodaysongs");

      if (data.isNotEmpty) {
        popularSongsList.value = data;
        isLoding(false);
      }
    } finally {}
  }
}
