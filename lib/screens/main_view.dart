import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:theme_configurator/main.dart';
import 'package:theme_configurator/screens/homescreen.dart';
import 'package:theme_configurator/utils/extensions.dart';

class MainViewWidget extends StatelessWidget {
  const MainViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.black.withOpacity(0.3),
                  ),
                )),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Buttons',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  direction: Axis.horizontal,
                  children: [
                    GSButton(
                      onPressed: () {},
                      //style: gsStyleValue.value,
                      child: const GSButtonText(text: "Primary"),
                    ),

                    GSButton(
                      onPressed: () {},
                      action: GSButtonActions.primary,
                      variant: GSButtonVariants.outline,
                      // style: gsStyleValue.value.copyWith(
                      //   bg: Colors.transparent,
                      // ),
                      child: GSButtonText(
                        text: "Outlined",
                        // style: GSStyle(
                        //     textStyle: TextStyle(color: gsStyleValue.value.bg)
                        //     ,),
                      ),
                    ),

                    GSButton(
                      //style: gsStyleValue.value,
                      child: GSHStack(
                        children: [
                          GSIcon(
                            icon: Icons.edit,
                            style: GSStyle(color: $GSColors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GSButtonText(
                            text: "Left Icon",
                            style: GSStyle(),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),

                    GSButton(
                      //style: gsStyleValue.value,
                      child: GSHStack(
                        children: [
                          const GSButtonText(
                            text: "Right Icon",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GSIcon(
                            icon: Icons.add,
                            style: GSStyle(color: $GSColors.white),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),

                    //
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Disabled Buttons',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    GSButton(
                      onPressed: () {},
                      isDisabled: true,
                      //style: gsStyleValue.value,
                      child: const GSButtonText(text: "Disabled"),
                    ),
                    GSButton(
                      isDisabled: true,
                      onPressed: () {},
                      action: GSButtonActions.primary,
                      variant: GSButtonVariants.outline,
                      // style: gsStyleValue.value.copyWith(
                      //   bg: Colors.transparent,
                      // ),
                      child: GSButtonText(
                        text: "Outlined",
                        // style: GSStyle(
                        //     textStyle: TextStyle(color: gsStyleValue.value.bg)),
                      ),
                    ),
                    GSButton(
                      isDisabled: true,
                      //style: gsStyleValue.value,
                      child: GSHStack(
                        children: [
                          GSIcon(
                            icon: Icons.edit,
                            style: GSStyle(color: $GSColors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GSButtonText(
                            text: "Left Icon",
                            style: GSStyle(),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    GSButton(
                      isDisabled: true,
                      //style: gsStyleValue.value,
                      child: GSHStack(
                        children: [
                          const GSButtonText(
                            text: "Right Icon",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GSIcon(
                            icon: Icons.add,
                            style: GSStyle(color: $GSColors.white),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Badge',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    GSBadge(
                      text: GSBadgeText('Info'),
                      action: GSBadgeActions.info,
                    ),
                    GSBadge(
                      text: GSBadgeText('Success'),
                      action: GSBadgeActions.success,
                    ),
                    GSBadge(
                      borderRadius: GSBadgeRadius.$3xl,
                      text: GSBadgeText('Warning'),
                      action: GSBadgeActions.warning,
                    ),
                    GSBadge(
                      text: GSBadgeText('Error'),
                      action: GSBadgeActions.error,
                    ),
                  ],
                )
              ],
            )),
          )),
    );
  }
}
