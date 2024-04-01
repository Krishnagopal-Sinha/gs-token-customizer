import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:theme_configurator/screens/homescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

double borderRadius = 0;

GSRadiiToken gsRadiiToken = const GSRadiiToken();
GSBorderWidthToken gsBorderWidthToken = const GSBorderWidthToken();
GSColorsToken gsColorsToken = const GSColorsToken();

GSStyle gsStyle = GSStyle(
  bg: const Color(0xff448aff),
  outlineColor: const Color(0xff448aff),
  borderRadius: 10,
  borderColor: const Color(0xff448aff),
);

ValueNotifier<GSColorsToken> gsColorsTokenValue =
    ValueNotifier<GSColorsToken>(gsColorsToken);
ValueNotifier<GSRadiiToken> gsRadiiTokenValue =
    ValueNotifier<GSRadiiToken>(gsRadiiToken);
ValueNotifier<GSStyle> gsStyleValue = ValueNotifier<GSStyle>(gsStyle);
ValueNotifier<GSBorderWidthToken> gsBorderWidthTokenValue =
    ValueNotifier<GSBorderWidthToken>(gsBorderWidthToken);

class _MainAppState extends State<MainApp> {
  GluestackTokenConfig myGluestackTokenConfig = GluestackTokenConfig(
    gsColorsToken: const GSColorsToken(
      primaryColorsFromBase: Color.fromARGB(255, 255, 0, 0),
    ),
    gsFontSizeToken: const GSFontSizeToken(
      $sm: 12,
    ),
  );
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: gsStyleValue,
      builder: (context, value, child) {
        log('Main Builder is called - ');
        // log('Color token value is ${gsStyleValue.value.bg}');
        return GluestackProvider(
          gluestackTokenConfig: myGluestackTokenConfig,

          //! GS App is Not `const`
          child: GSApp(
            themeMode: GSThemeMode.dark,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            home: HomeScreen(
              updaterFunc: (GluestackTokenConfig provided) {
                if (count > 0) return; //ensure one time call cuz timer will rerun on new instance of Homepage
                setState(() {
                  myGluestackTokenConfig = provided;
                  count++;
                log('5 sec elapsed - Base clr modifier !');
                });
              },
            ),
          ),
        );
      },
    );
  }
}
