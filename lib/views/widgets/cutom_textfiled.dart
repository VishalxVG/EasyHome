import 'package:easyhome/controllers/textfiled_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextFieldController textFieldController = Get.put(TextFieldController());

Widget appTextField(
  BuildContext context, {
  String text = "",
  String icon = "assets/icons/user.png",
  String hintText = "TypeIn your info",
  bool isObscure = false,
  bool isPasswordFiled = false,
  TextEditingController? controller,
  void Function(String value)? func,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text
        Text(text),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 355,
          height: 50,

          //* Icons + TextField
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Image.asset(
                  icon,
                  width: 18,
                  height: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Obx(() {
                  return TextField(
                    controller: controller,
                    onChanged: (value) => func?.call(value),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
