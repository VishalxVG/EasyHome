import 'package:easyhome/controllers/textfiled_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextFieldController textFieldController = Get.put(TextFieldController());

Widget appTextField(
  BuildContext context, {
  String icon = "assets/icons/user.png",
  String hintText = "TypeIn your info",
  bool isObscure = false,
  bool isPasswordFiled = false,
  TextEditingController? controller,
  void Function(String value)? func,
  required String? Function(String? value) validator,
}) {
  return Container(
    width: 360,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.black.withOpacity(0.3),
      ),
    ),

    //* Icons + TextField
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset(
            icon,
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: isPasswordFiled
              ? Obx(
                  () {
                    return TextFormField(
                      controller: controller,
                      onChanged: (value) => func?.call(value),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        suffixIcon: isPasswordFiled
                            ? IconButton(
                                icon: Icon(
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary,
                                  textFieldController.isObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: textFieldController.toggleObscure,
                              )
                            : null,
                      ),
                      autocorrect: false,
                      maxLines: 1,
                      obscureText: textFieldController.isObscure.value,
                      validator: validator,
                    );
                  },
                )
              : TextFormField(
                  controller: controller,
                  onChanged: (value) => func?.call(value),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    suffixIcon: isPasswordFiled
                        ? IconButton(
                            icon: Icon(
                              size: 20,
                              color: Theme.of(context).colorScheme.primary,
                              textFieldController.isObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: textFieldController.toggleObscure,
                          )
                        : null,
                  ),
                  autocorrect: false,
                  maxLines: 1,
                  obscureText: false,
                  validator: validator,
                ),
        ),
      ],
    ),
  );
}
