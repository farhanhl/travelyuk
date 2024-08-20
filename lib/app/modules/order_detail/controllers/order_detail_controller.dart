// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:travelyuk/app/modules/orders/controllers/orders_controller.dart';
import 'package:travelyuk/app/modules/order_detail/services/order_detail_service.dart';

class OrderDetailController extends GetxController {
  bool isLoading = false;
  Order order = Order();
  OrderDetailService service;
  RxString imagePath = ''.obs;
  final arguments = Get.arguments;
  OrderDetailController(this.service);
  final orderC = Get.find<OrdersController>();

  @override
  void onInit() {
    super.onInit();
    order = arguments;
  }

  Future<void> changeIsPaid(String status) async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await service.changeIsPaid(order.id ?? 0, status).then(
      (value) async {
        await getOrder();
      },
    ).catchError(
      (e) {
        EasyLoading.dismiss();
      },
    );
  }

  Future<void> getOrder() async {
    isLoading = true;
    update();
    await service.getOrder(order.id ?? 0).then(
      (value) {
        order = value;
        orderC.getOrdersByUser();
        EasyLoading.dismiss();
        isLoading = false;
        update();
      },
    ).catchError(
      (e) {
        isLoading = false;
        EasyLoading.dismiss();
        update();
      },
    );
  }

  void uploadImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      EasyLoading.show(status: "Mengunggah gambar...");
      update();
      try {
        final Directory tempDir = await getTemporaryDirectory();
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        final compressedImagePath = '${tempDir.path}/$fileName';
        var result = await FlutterImageCompress.compressAndGetFile(
          pickedFile.path,
          compressedImagePath,
          quality: 50,
        );
        final File compressedImageFile = File(compressedImagePath);
        imagePath.value = compressedImageFile.path;
        await service.upload(imagePath.value, order.id).then((value) {
          Get.back();
          order.transfer = value.path;
          Get.snackbar(
            "Berhasil",
            "Berhasil upload bukti transfer",
            backgroundColor: successColor,
            colorText: lightColor,
          );
          update();
        }).catchError(
          (e) {
            Get.snackbar(
              "Error",
              "Gagal upload bukti transfer, harap periksa koneksi internet",
              backgroundColor: errorColor,
              colorText: lightColor,
            );
          },
        );
      } catch (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "Terjadi kesalahan",
          backgroundColor: errorColor,
          colorText: lightColor,
        );
      }
      EasyLoading.dismiss();
      update();
    } else {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "Tidak ada gambar yang dipilih",
        backgroundColor: errorColor,
        colorText: lightColor,
      );
      update();
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
