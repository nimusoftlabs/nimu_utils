import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class NimuUtils {
  // generate random number
  static int randomNumber(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  // generate random color
  static Color randomColor() {
    return Color.fromARGB(
        255, randomNumber(0, 255), randomNumber(0, 255), randomNumber(0, 255));
  }

  // generate random color list
  static List<Color> randomColorList(int count) {
    return List.generate(count, (index) => randomColor());
  }

// shuffle list
  static List<T> shuffleList<T>(List<T> list) {
    List<T> newList = List<T>.from(list);
    newList.shuffle();
    return newList;
  }

  // navigate to another page
  static navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  // navigate to another page with arguments
  static navigateToWithArguments(
      BuildContext context, Widget widget, Object arguments) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget,
            settings: RouteSettings(arguments: arguments)));
  }

  // navigate to another page and remove all previous pages
  static navigateToAndRemoveAll(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  // navigate to another page and remove all previous pages with arguments
  static navigateToAndRemoveAllWithArguments(
      BuildContext context, Widget widget, Object arguments) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => widget,
            settings: RouteSettings(arguments: arguments)),
        (route) => false);
  }

  // find index
  static findIndex<T>(List<T> list, T target) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == target) {
        return i;
      }
    }
    return -1;
  }

  // get current time
  static getCurrentTime() {
    var now = DateTime.now();
    return DateFormat('hh:mm:ss').format(now);
  }

  // get current date
  static getCurrentDate() {
    var now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  // get current date and time
  static getCurrentDateAndTime() {
    var now = DateTime.now();
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
  }

  // get current time in milliseconds
  static getCurrentTimeInMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  // get file name from path
  static getFileNameFromPath(String path) {
    return path.substring(path.lastIndexOf("/") + 1, path.length);
  }

  // get file extension from path
  static getFileExtensionFromPath(String path) {
    return path.substring(path.lastIndexOf(".") + 1, path.length);
  }

  // get file name without extension from path
  static getFileNameWithoutExtensionFromPath(String path) {
    return path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
  }

  // http get request
  static httpGet(String url, Function callback) async {
    var response = await http.get(Uri.parse(url));
    callback(response);
  }

  // http post request
  static httpPost(String url, Map<String, String> body, Function callback,
      Map<String, String> headers) async {
    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    callback(response);
  }

  // create alert dialog
  static nimuAlertDialog(
      BuildContext context, String title, String message, Widget body) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[body],
          );
        });
  }

  // create awesome app bar
  static nimuAppBar(BuildContext context, String title,
      {Widget? leading,
      List<Widget>? actions,
      bool centerTitle = true,
      bool automaticallyImplyLeading = true}) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  // persistent bottom sheet
  static nimuPersistentBottomSheet(BuildContext context, Widget body) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return body;
        });
  }

  //  persistent bottom sheet with custom shape
  static nimuPersistentBottomSheetWithCustomShape(
      BuildContext context, Widget body, ShapeBorder shape) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return body;
        },
        shape: shape);
  }

  // sized box
  static nimuSizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

// column
  static nimuColumn(List<Widget> children) {
    return Column(
      children: children,
    );
  }

  // row
  static nimuRow(List<Widget> children) {
    return Row(
      children: children,
    );
  }

  // container
  static nimuTainer(Widget child) {
    return Container(
      child: child,
    );
  }

  // text
  static nimuText(String text, {TextStyle? style}) {
    return Text(text, style: style);
  }

  // text field
  static nimuTextField(
    String hint, {
    TextEditingController? controller,
    String? label,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    TextStyle? style,
    bool? obscureText,
    bool? autofocus,
    bool? autocorrect,
    bool? enabled,
    bool? filled,
    Color? fillColor,
    Function? onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          label: label != null ? Text(label) : null,
          hintText: hint,
          filled: filled,
          fillColor: fillColor),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: style,
      obscureText: obscureText!,
      autofocus: autofocus!,
      autocorrect: autocorrect!,
      enabled: enabled,
      onChanged: (String value) {
        onChanged!(value);
      },
    );
  }

  // get image from asset
  static getImageFromAsset(String asset) {
    return AssetImage(asset);
  }

  // get image from network
  static getImageFromNetwork(String url) {
    return NetworkImage(url);
  }

  // get image from file
  static getImageFromFile(String path) {
    return FileImage(File(path));
  }

  // get image from bytes
  static getImageFromBytes(Uint8List bytes) {
    return MemoryImage(bytes);
  }

  // listview.builder
  static nimuListViewBuilder(
      {List<Widget>? children,
      int? itemCount,
      double? itemExtent,
      bool? reverse,
      ScrollController? controller,
      bool? primary,
      ScrollPhysics? physics,
      EdgeInsetsGeometry? padding,
      bool? shrinkWrap,
      Key? key,
      IndexedWidgetBuilder? itemBuilder}) {
    return ListView.builder(
      key: key,
      itemCount: itemCount,
      itemExtent: itemExtent,
      reverse: reverse!,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      shrinkWrap: shrinkWrap!,
      itemBuilder: (context, index) {
        return itemBuilder!(context, index);
      },
    );
  }

  // listview.separated
  static nimuListViewSeparated(
      {List<Widget>? children,
      int? itemCount,
      bool? reverse,
      ScrollController? controller,
      bool? primary,
      ScrollPhysics? physics,
      EdgeInsetsGeometry? padding,
      bool? shrinkWrap,
      Key? key,
      IndexedWidgetBuilder? itemBuilder,
      IndexedWidgetBuilder? separatorBuilder}) {
    return ListView.separated(
      key: key,
      itemCount: itemCount!,
      reverse: reverse!,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      shrinkWrap: shrinkWrap!,
      itemBuilder: (context, index) {
        return itemBuilder!(context, index);
      },
      separatorBuilder: (context, index) {
        return separatorBuilder!(context, index);
      },
    );
  }

  // gridview.builder
  static nimuGridViewBuilder(
      {List<Widget>? children,
      int? itemCount,
      double? itemExtent,
      bool? reverse,
      ScrollController? controller,
      bool? primary,
      ScrollPhysics? physics,
      EdgeInsetsGeometry? padding,
      bool? shrinkWrap,
      Key? key,
      SliverGridDelegateWithFixedCrossAxisCount? delegate,
      IndexedWidgetBuilder? itemBuilder}) {
    return GridView.builder(
      key: key,
      itemCount: itemCount,
      gridDelegate: delegate!,
      reverse: reverse!,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      shrinkWrap: shrinkWrap!,
      itemBuilder: (context, index) {
        return itemBuilder!(context, index);
      },
    );
  }

  // switch
  static nimuSwitch(
      {bool? value,
      bool? tristate,
      Color? activeColor,
      Color? inactiveColor,
      Color? activeTrackColor,
      Color? inactiveTrackColor,
      bool? autofocus,
      Color? focusColor,
      Color? hoverColor,
      Color? highlightColor,
      bool? splashColor,
      MaterialTapTargetSize? materialTapTargetSize,
      bool? enableFeedback,
      bool? excludeFromSemantics,
      ValueChanged<bool>? onChanged}) {
    return Switch(
      value: value!,
      activeColor: activeColor!,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor!,
      autofocus: autofocus!,
      focusColor: focusColor!,
      hoverColor: hoverColor!,
      materialTapTargetSize: materialTapTargetSize!,
      onChanged: (bool value) {
        onChanged!(value);
      },
    );
  }

  // checkbox
  static nimuCheckbox(
      {bool? value,
      bool? tristate,
      Color? activeColor,
      Color? inactiveColor,
      Color? activeTrackColor,
      Color? inactiveTrackColor,
      bool? autofocus,
      Color? focusColor,
      Color? hoverColor,
      Color? highlightColor,
      bool? splashColor,
      MaterialTapTargetSize? materialTapTargetSize,
      bool? enableFeedback,
      bool? excludeFromSemantics,
      ValueChanged<bool>? onChanged}) {
    return Checkbox(
      value: value!,
      tristate: tristate!,
      activeColor: activeColor!,
      autofocus: autofocus!,
      focusColor: focusColor!,
      hoverColor: hoverColor!,
      materialTapTargetSize: materialTapTargetSize!,
      onChanged: (value) {
        onChanged!(value!);
      },
    );
  }

  // radio
  static nimuRadio(
      {bool? value,
      bool? tristate,
      Color? activeColor,
      Color? inactiveColor,
      Color? activeTrackColor,
      Color? inactiveTrackColor,
      bool? autofocus,
      Color? focusColor,
      Color? hoverColor,
      Color? highlightColor,
      bool? splashColor,
      MaterialTapTargetSize? materialTapTargetSize,
      bool? enableFeedback,
      bool? groupVal,
      bool? excludeFromSemantics,
      ValueChanged<Object>? onChanged}) {
    return Radio(
      value: value!,
      groupValue: groupVal,
      activeColor: activeColor!,
      autofocus: autofocus!,
      focusColor: focusColor!,
      hoverColor: hoverColor!,
      materialTapTargetSize: materialTapTargetSize!,
      onChanged: (value) {
        onChanged!(value as Object);
      },
    );
  }

  // slider
  static nimuSlider(
      {double? value,
      double? min,
      double? max,
      int? divisions,
      Color? activeColor,
      Color? inactiveColor,
      Color? activeTrackColor,
      Color? inactiveTrackColor,
      bool? autofocus,
      Color? focusColor,
      Color? hoverColor,
      Color? highlightColor,
      bool? splashColor,
      MaterialTapTargetSize? materialTapTargetSize,
      bool? enableFeedback,
      bool? excludeFromSemantics,
      ValueChanged<double>? onChanged}) {
    return Slider(
      value: value!,
      min: min!,
      max: max!,
      divisions: divisions,
      activeColor: activeColor!,
      inactiveColor: inactiveColor!,
      autofocus: autofocus!,
      onChanged: (value) {
        onChanged!(value);
      },
    );
  }

  //  int to binary
  static nimuIntToBinary(int? value) {
    return value!.toRadixString(2);
  }

  //  int to octal
  static nimuIntToOctal(int? value) {
    return value!.toRadixString(8);
  }

  //  int to hex
  static nimuIntToHex(int? value) {
    return value!.toRadixString(16);
  }

  //  int to decimal
  static nimuIntToDecimal(int? value) {
    return value!.toString();
  }

  //  binary to int
  static nimuBinaryToInt(String? value) {
    return int.parse(value!, radix: 2);
  }

  //  octal to int
  static nimuOctalToInt(String? value) {
    return int.parse(value!, radix: 8);
  }

  //  hex to int
  static nimuHexToInt(String? value) {
    return int.parse(value!, radix: 16);
  }

  // convert any text to lowercase
  static nimuToLowerCase(String? value) {
    return value!.toLowerCase();
  }

  // convert any text to uppercase
  static nimuToUpperCase(String? value) {
    return value!.toUpperCase();
  }

  // convert any text to titlecase
  static nimuToTitleCase(String? value) {
    return value!.toUpperCase();
  }

  // convert any text to sentence case
  static nimuToSentenceCase(String? value) {
    return value!.toUpperCase();
  }

  //  if else
  static nimuIfElse(bool? condition, Widget? trueWidget, Widget? falseWidget) {
    if (condition!) {
      return trueWidget;
    } else {
      return falseWidget;
    }
  }

  // for loop
  static nimuForLoop(int? start, int? end, Widget? widget) {
    List<Widget> list = [];
    for (int i = start!; i <= end!; i++) {
      list.add(widget!);
    }
    return list;
  }

  // start loading
  static nimuLoading() {
    return const CircularProgressIndicator();
  }

  // parse
  static nimuParse(String? value, String? type) {
    switch (type) {
      case 'int':
        return int.parse(value!);
      case 'double':
        return double.parse(value!);

      default:
        return value;
    }
  }

  // TODO: format any currency value

  static nimuCurrencyFormat(
    double? value,
    String? currency, {
    String? symbol,
    String? thousandSeparator,
    String? decimalSeparator,
  }) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: symbol,
      decimalDigits: 2,
    ).format(value!);
  }
}
