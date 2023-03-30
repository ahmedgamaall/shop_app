import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  required String title,
  required Function()? onPressed,
  Color background = Colors.blue,
  double width = double.infinity,
  double height = 50.0,
  bool isUpperCase = true,
  double radius = 3.0,
  Function? onSuffixPressed,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(10.0),
        color: background,
        onPressed: onPressed,
        child: Text(
          isUpperCase ? title.toUpperCase() : title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: 16.0,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required String title,
  required void Function()? onPressed,
}) =>
    TextButton(onPressed: onPressed, child: Text(title));

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String? Function(String?)? validate,
  bool isPassword = false,
  IconData? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String)? onChanged,
  void Function(String)? onSubmit,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: onSuffixPressed,
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      validator: validate!,
    );

Widget myDivider() => Container(
      color: Colors.grey,
      width: double.infinity,
      height: 1.0,
      margin: const EdgeInsetsDirectional.only(start: 20.0),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARING }

Color chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARING:
      color = Colors.amber;
      break;
  }
  return color;
}
