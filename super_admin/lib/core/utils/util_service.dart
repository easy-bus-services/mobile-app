import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/models/screen_sizes_dto.dart';
import 'package:super_admin/core/presentation/widgets/my_button.dart';

class UtilService {
  static ScreenSizesDto getScreenSizeWithoutContext() {
    // Get the first FlutterView instance
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

    // Dimensions in physical pixels (px)
    Size physicalSize = view.physicalSize;
    double physicalWidth = physicalSize.width;
    double physicalHeight = physicalSize.height;

    // Dimensions in logical pixels (dp)
    // Divide physical size by devicePixelRatio to get logical size
    Size logicalSize = physicalSize / view.devicePixelRatio;
    double logicalWidth = logicalSize.width;
    double logicalHeight = logicalSize.height;
  return ScreenSizesDto(
        physicalSize: physicalSize,
        physicalWidth: physicalWidth,
        physicalHeight: physicalHeight,
        logicalSize: logicalSize,
        logicalWidth: logicalWidth,
        logicalHeight: logicalHeight
    );
    //  _logger?.i('Physical Screen Size: $physicalWidth x $physicalHeight px');
    //  _logger?.i('Logical Screen Size: $logicalWidth x $logicalHeight dp');
  }
  static getCustomDialog({
    required BuildContext context,
    required String title,
    required Widget body,
    double maxHeight=100,
    VoidCallback? onYesPressed,
    VoidCallback? onNoPressed,
    double minWidth=double.infinity,
    String yesButtonText = "Yes",
    String noButtonText = "No",
    WidgetAlertButtonTypes? actionTypes,
    List<Widget> actions=const []
  }){
    final yesButton = MyButton(text: yesButtonText, width: 100, onPressed: onYesPressed ?? (){
      Navigator.pop(context);
    });
    final noButton = MyButton(text: noButtonText,backgroundColor: Colors.grey.shade200,
        textColor: Colors.black, width: 100, onPressed: onNoPressed ?? (){
      Navigator.pop(context);
    });
    List<Widget> localActions= [];
    if(actions?.length==0){
      if(actionTypes == WidgetAlertButtonTypes.yes)
        localActions.add(yesButton);
      if(actionTypes == WidgetAlertButtonTypes.no)
        localActions.add(noButton);
      if(actionTypes == WidgetAlertButtonTypes.yesOrNo) {
        localActions.add(noButton);
        localActions.add(yesButton);
      }
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
            child: AlertDialog(
          constraints: BoxConstraints(maxHeight: maxHeight,minWidth:minWidth ),
          titlePadding: EdgeInsetsGeometry.zero,

          title:Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                  topRight:  Radius.circular(15),
                )
              ),
              padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 10),
              child: Text(title, style: TextStyle(
              backgroundColor: Colors.blue, fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ))),
          insetPadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.all(0),
          content: Column(
              children:[
                body,
              ]
          ),
          actions: [
            Center(child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: (actions.isEmpty ? localActions : actions)
              )
            )
          ],
        )
        );
      },

    );
  }
}