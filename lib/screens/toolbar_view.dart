import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:theme_configurator/main.dart';
import 'package:theme_configurator/utils/constants.dart';
import 'package:theme_configurator/utils/extensions.dart';

class ToolBoxViewWidget extends StatefulWidget {
  const ToolBoxViewWidget({super.key});

  @override
  State<ToolBoxViewWidget> createState() => _ToolBoxViewWidgetState();
}

class _ToolBoxViewWidgetState extends State<ToolBoxViewWidget> {
  double radiusValue = 0;
  String? radius;
  String? borderWidth;
  double borderWidthValue = 0;

  Widget _buildRadiusOption(String label, String token) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          width: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: token,
              isDense: true,
              suffixIcon: const Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 2,
                  heightFactor: 2,
                  child: Padding(
                      padding: EdgeInsets.only(right: 8), child: Text('PX'))),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              double parsedValue = double.tryParse(value) ?? 0;
              switch (token) {
                case 'sm':
                  gsRadiiTokenValue.value =
                      gsRadiiTokenValue.value.copyWith(sm: parsedValue);
                  break;
                case 'md':
                  gsRadiiTokenValue.value =
                      gsRadiiTokenValue.value.copyWith(md: parsedValue);
                  break;
                case 'lg':
                  gsRadiiTokenValue.value =
                      gsRadiiTokenValue.value.copyWith(lg: parsedValue);
                  break;
                case 'xl':
                  gsRadiiTokenValue.value =
                      gsRadiiTokenValue.value.copyWith(xl: parsedValue);
                  break;
                case 'full':
                  gsRadiiTokenValue.value =
                      gsRadiiTokenValue.value.copyWith(full: parsedValue);
                  break;
              }
              setState(() {
                gsStyleValue.value =
                    gsStyleValue.value.copyWith(borderRadius: parsedValue);
              });
            },
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Select Color Tokens',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  SizedBox(
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  elevation: 0,
                                  title: const Text('Pick Primary Color',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  content: Material(
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height / 2,
                                      width:
                                          MediaQuery.sizeOf(context).width / 2,
                                      child: ColorPicker(
                                          portraitOnly: true,
                                          paletteType: PaletteType.hueWheel,
                                          pickerAreaBorderRadius:
                                              BorderRadius.circular(20),
                                          enableAlpha: false,
                                          pickerColor: gsStyleValue.value.bg!,
                                          onColorChanged: (color) {
                                            gsStyleValue.value = GSStyle(
                                              bg: color,
                                              outlineColor: color,
                                              borderColor: color,
                                            );

                                            setState(() {});
                                          }),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Icon(Icons.settings_suggest_rounded)),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xfff2f2f2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterImageStack.widgets(
                          backgroundColor: Colors.black,
                          totalCount: 3,
                          children: [
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor:
                                    gsStyleValue.value.bg!.withOpacity(0.5),
                              ),
                            ),
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor:
                                    gsStyleValue.value.bg!.withOpacity(0.7),
                              ),
                            ),
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor: gsStyleValue.value.bg,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Primary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(gsStyleValue.value.bg!.toString()),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xfff2f2f2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterImageStack.widgets(
                          backgroundColor: Colors.black,
                          totalCount: 3,
                          children: [
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor:
                                    gsColorsTokenValue.value.secondary100,
                              ),
                            ),
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor:
                                    gsColorsTokenValue.value.secondary300,
                              ),
                            ),
                            CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor:
                                    gsColorsTokenValue.value.secondary500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Secondary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(gsColorsTokenValue.value.secondary500.toString()),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  for (var i = 0; i < 10; i++)
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        gsStyleValue.value = GSStyle(
                          bg: gscolors[i],
                          outlineColor: gscolors[i],
                          borderColor: gscolors[i],
                        );
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 20,
                          foregroundColor: Colors.black,
                          backgroundColor: gscolors[i],
                        ),
                      ),
                    ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  const Text('Selct BorderRadius Token',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                elevation: 0,
                                title: Center(
                                    child: Text('Customize Border Radius',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // SizedBox(height: 16),
                                      _buildRadiusOption('Small ', 'sm'),
                                      _buildRadiusOption('Medium', 'md'),
                                      _buildRadiusOption('Large', 'lg'),
                                      _buildRadiusOption('Extra Large', 'xl'),
                                      _buildRadiusOption('Full Radius', 'full'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  GSButton(
                                    style: GSStyle(bg: Colors.grey.shade300),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: GSButtonText(
                                      text: 'Close',
                                      style: GSStyle(
                                          textStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(Icons.settings_outlined)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: Colors.white,
                  backgroundColor: Color(0xffe6e7e9),
                  children: {
                    '\$sm': Text('\$sm'),
                    '\$md': Text('\$md'),
                    '\$lg': Text('\$lg'),
                    '\$xl': Text('\$xl'),
                    '\$full': Text('\$full'),
                  },
                  groupValue: radius,
                  onValueChanged: (value) {
                    setState(() {
                      radius = value as String; // Cast value to String
                      switch (radius) {
                        case '\$sm':
                          radiusValue = gsRadiiTokenValue.value.$sm;
                          break;
                        case '\$md':
                          radiusValue = gsRadiiTokenValue.value.$md;
                          break;
                        case '\$lg':
                          radiusValue = gsRadiiTokenValue.value.$lg;
                          break;
                        case '\$xl':
                          radiusValue = gsRadiiTokenValue.value.$xl;
                          break;

                        case '\$full':
                          radiusValue = gsRadiiTokenValue.value.full;
                          log('Full Radius is ${gsRadiiTokenValue.value.full}');
                          break;
                      }
                      gsStyleValue.value = gsStyleValue.value.copyWith(
                        borderRadius: radiusValue,
                      );
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  const Text('Select BorderWidth Token',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                elevation: 0,
                                title: const Center(
                                    child: Text('Customize Border Width',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(height: 16),
                                      _buildRadiusOption('0', 'sm'),
                                      _buildRadiusOption('1', 'md'),
                                      _buildRadiusOption('2', 'lg'),
                                      _buildRadiusOption('4', 'xl'),
                                      _buildRadiusOption('8', 'full'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  GSButton(
                                    style: GSStyle(bg: Colors.grey.shade300),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: GSButtonText(
                                      text: 'Close',
                                      style: GSStyle(
                                          textStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(Icons.settings_outlined)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: Colors.white,
                  backgroundColor: Color(0xffe6e7e9),
                  children: {
                    '0': Text('0'),
                    '1': Text('1'),
                    '2': Text('2'),
                    '4': Text('4'),
                    '8': Text('8'),
                  },
                  groupValue: borderWidth,
                  onValueChanged: (value) {
                    setState(() {
                      borderWidth = value as String; // Cast value to String
                      switch (radius) {
                        case '0':
                          gsStyleValue.value = gsStyleValue.value.copyWith(
                            borderWidth: 0,
                          );
                          break;
                        case '1':
                          gsStyleValue.value = gsStyleValue.value.copyWith(
                            borderWidth: 1,
                          );
                          break;
                        case '2':
                          gsStyleValue.value = gsStyleValue.value.copyWith(
                            borderWidth: 2,
                          );
                          break;
                        case '4':
                          gsStyleValue.value = gsStyleValue.value.copyWith(
                            borderWidth: 4,
                          );
                          break;
                        case '8':
                          gsStyleValue.value = gsStyleValue.value.copyWith(
                            borderWidth: 8,
                          );
                          break;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
