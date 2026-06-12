
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../utils/helpers.dart';


/*class BackToLoginAlert extends StatefulWidget {
  const BackToLoginAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<BackToLoginAlert> createState() => _BackToLoginAlertState();
}

class _BackToLoginAlertState extends State<BackToLoginAlert> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Simple Alert Dialog'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BackToLogin();
              });
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class BackToLogin extends StatelessWidget {
  BackToLogin({
    super.key,
  });

  Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          // height: 200.h,
          width: context.width / 1.5,
          decoration:  BoxDecoration(
              color: color1F3D2B,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              customSvg(name: favourite,width: context.width/19
                ,height: context.width/19,color: white),
              GestureDetector(
                onTap: () {
               //   Navigation.push(context, screen: LoginScreen());
                  // Navigation.popTillNamedAndPush(context,
                  //     popTill: "CartScreen");
                },
                child: Container(
                  width: context.width/2,
                  height: context.height/10,
                  decoration: BoxDecoration(
                      color: color73, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "error_login_dialog",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}*/