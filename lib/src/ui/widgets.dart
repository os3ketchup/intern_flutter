import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning/icons.dart';

import 'package:learning/util_variables.dart';



import 'apptheme.dart';

class slider extends StatelessWidget {
  bool isActive;
  slider({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.o),
      height: 22.o,
      width: 38.o,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.o),
        border: Border.all(
          width: 1.o,
          color: isActive ? theme.yellow : theme.line,
        ),
        color: isActive != true ? theme.dragDown : theme.yellow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          isActive == true ? const Spacer() : Container(),
          Container(
            height: 15.o,
            width: 15.o,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.o),
              color: isActive
                  ? const Color(0xFFFFFFFF)
                  : isDark
                      ? const Color(0xFF202020)
                      : const Color(0xFF303130),
            ),
          ),
          isActive != true ? const Spacer() : Container(),
        ],
      ),
    );
  }
}

void push(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

class BackAppbar extends StatelessWidget {
  final Widget? backWidget;
  final List<Widget>? tools;
  final Function? onBack;
  final String title;
  const BackAppbar({
    super.key,
    this.backWidget,
    this.tools,
    this.onBack,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.o,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 10.o),
        padding: EdgeInsets.only(
          bottom: 7.o,
          left: 5.o,
          right: 5.o,
        ),
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.o),
            bottomLeft: Radius.circular(20.o),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (onBack != null) {
                    onBack!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: backWidget ??
                      Container(
                        width: 32.o,
                        height: 32.o,
                        margin: EdgeInsets.only(
                          left: 10.o,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.o),
                            color: Colors.white.withOpacity(0.2)),
                        child: SvgPicture.asset(
                          svgIcon.arrowLeft,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                          width: 24.o,
                          height: 24.o,
                        ),
                      ),
                ),
              ),
            ),
            Text(
              title,
              style: theme.textStyle.copyWith(
                fontSize: 20.o,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: tools ?? [],
            )),
          ],
        ),
      ),
    );
  }
}
