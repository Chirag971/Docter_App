import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SnackBarService {
  showSnackBar({
    @required String? message,
    // SnackBarDataModel? snackBar,
    Function()? onActionClicked,
    Duration? duration,
    SnackBarType? type,
    Function()? undoOnTap,
    String? actionLabel,
  }) {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    return ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      duration: const Duration(seconds: 1),
      padding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).hoverColor,
          borderRadius: cr4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: double.infinity,
              decoration: BoxDecoration(
                color: _backgroundColor(type ?? SnackBarType.Error),
                borderRadius: onlyTopBottomLeft4,
              ),
              child: Padding(
                padding: all10,
                child: Icon(
                  icons(type ?? SnackBarType.Error),
                  color: appWhiteColor,
                ),
              ),
            ),
            w14,
            Text(
              "$message",
              style: TextStyle(color: textDarkGrayColor, fontSize: 20),
              overflow: TextOverflow.visible,
            ),

            // type == SnackBarType.Error
            //     ? InkWell(
            //         onTap: undoOnTap,
            //         child: const FigmaText.bodyB3(
            //           "Undo",
            //           overflow: TextOverflow.visible,
            //           color: ColorUtil.blue,
            //           style: TextStyle(decoration: TextDecoration.underline),
            //         ),
            //       )
            //     : const SizedBox.shrink(),
            // SizedBox(width: 11.w),
          ],
        ),
      ),
      // backgroundColor: Colors.red,
    ));
  }

  Color _backgroundColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.Error:
        return Colors.red;
      case SnackBarType.Success:
        return Colors.green;
      default:
        return Colors.green;
    }
  }

  IconData icons(SnackBarType type) {
    switch (type) {
      case SnackBarType.Error:
        return Icons.error_outline;
      case SnackBarType.Success:
        return Icons.check;
      default:
        return Icons.check;
    }
  }
}

enum SnackBarType {
  Error,
  Success,
}
