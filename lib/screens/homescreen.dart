// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:theme_configurator/main.dart';

import 'package:theme_configurator/screens/main_view.dart';
import 'package:theme_configurator/screens/toolbar_view.dart';
import 'package:theme_configurator/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  final Function(GluestackTokenConfig) updaterFunc;
  const HomeScreen({super.key, required this.updaterFunc});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      widget.updaterFunc(GluestackTokenConfig(
        gsColorsToken: GSColorsToken(
            primaryColorsFromBase: Color.fromARGB(255, 0, 0, 0)), //black
      ));
      log('5 sec elapsed - Base clr modifier !');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        bottomOpacity: 0,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 30,
              height: 20,
            ),
            const Text(
              'Gluestack Theme Configurator',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    GSColorsToken gsColorsToken = GSColorsToken();
                    GSRadiiToken gsRadiiToken = GSRadiiToken();
                    GSBorderWidthToken gsBorderWidthToken =
                        GSBorderWidthToken();
                    // gsColorsToken.copyWith(primary500: gsStyleValue.value.bg);
                    GSColorsToken modifiedColorToken = gsColorsToken.copyWith(
                        primary500: gsStyleValue.value.bg);

                    GSRadiiToken modifiedRadiiToken = gsRadiiToken.copyWith(
                        sm: gsRadiiTokenValue.value.$sm,
                        md: gsRadiiTokenValue.value.$md,
                        lg: gsRadiiTokenValue.value.$lg,
                        xl: gsRadiiTokenValue.value.$xl,
                        full: gsRadiiTokenValue.value.full);

                    GSBorderWidthToken modifiedBorderToken =
                        gsBorderWidthToken.copyWith(
                            $0: gsBorderWidthTokenValue.value.$0,
                            $1: gsBorderWidthTokenValue.value.$1,
                            $2: gsBorderWidthTokenValue.value.$2,
                            $4: gsBorderWidthTokenValue.value.$4,
                            $8: gsBorderWidthTokenValue.value.$8);

                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                        title: Row(
                          children: [
                            const Text('Theme Config Export'),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: modifiedColorToken.toJsonString() +
                                        '\n' +
                                        modifiedRadiiToken.toJsonString() +
                                        '\n' +
                                        modifiedBorderToken.toJsonString()));
                              },
                              icon: const Icon(Icons.copy),
                            )
                          ],
                        ),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          child: SelectableRegion(
                            selectionControls: MaterialTextSelectionControls(),
                            focusNode: FocusNode(),
                            child: Text(
                              modifiedColorToken.toJsonString() +
                                  '\n' +
                                  modifiedRadiiToken.toJsonString() +
                                  '\n' +
                                  modifiedBorderToken.toJsonString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ));
                  });
            },
            icon: const Icon(Icons.code),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // ToolBox Widget
            ToolBoxViewWidget(),
            //! Don't Make it `const` ->
            MainViewWidget()
          ],
        ),
      ),
    );
  }
}

List<String> tokenColors = [
  '\$secondary900',
  '\$primary0',
  '\$primary200',
  '\$primary300',
  '\$primary400',
  '\$tertiary500',
  '\$rose500',
  '\$fuchsia500',
  '\$purple500',
  '\$indigo500',
];
