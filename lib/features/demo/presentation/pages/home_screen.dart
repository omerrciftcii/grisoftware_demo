import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoft/features/demo/presentation/providers/link_short_provider.dart';
import 'package:grisoft/features/demo/presentation/widgets/curve_painter.dart';
import 'package:grisoft/features/demo/presentation/widgets/link_history_available_widget.dart';
import 'package:grisoft/helpers/assets_path.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var linkShorterProvider = Provider.of<LinkShorterProvider>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardVisible =
        MediaQuery.of(context).viewInsets.bottom == 0 ? false : true;
    print(
      MediaQuery.of(context).viewInsets.bottom.toString(),
    );
    return Scaffold(
      bottomSheet: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: Container(
          color: const Color(0xff362F4D),
          child: CustomPaint(
            painter: CurvePainter(),
            child: SizedBox(
              height: 120,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Form(
                        key: linkShorterProvider.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: linkShorterProvider.linkController,
                            decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                errorStyle: TextStyle(height: 0),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintStyle:
                                    linkShorterProvider.errorHintText == null
                                        ? const TextStyle(
                                            color: Colors.grey, fontSize: 18)
                                        : const TextStyle(color: Colors.red),
                                border:
                                    //  linkShorterProvider.errorHintText != ""
                                    //     ? OutlineInputBorder(
                                    //         borderRadius: BorderRadius.circular(6),
                                    //         borderSide:
                                    //             BorderSide(color: Colors.red),
                                    //       )
                                    //     :
                                    OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide.none),
                                hintText: linkShorterProvider.errorHintText ??
                                    'Shorten a link here ...'),
                            validator: linkShorterProvider.formValidation,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 5,
                  //   ),
                  // ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff1CBED0),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'SHORTEN IT!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (linkShorterProvider.formKey.currentState!
                              .validate()) {
                            await linkShorterProvider.getShortenedLink();
                            linkShorterProvider.failure != null
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        margin: EdgeInsets.only(
                                            bottom: isKeyboardVisible
                                                ? keyboardHeight
                                                : 0,
                                            left: 100,
                                            right: 100),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          linkShorterProvider
                                              .failure!.errorMessage
                                              .toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor:
                                            Colors.black54.withOpacity(0.4)),
                                  )
                                : print('');
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: linkShorterProvider.linkHistory.isEmpty
          ? Colors.white
          : const Color(0xffE5E5E5),
      resizeToAvoidBottomInset: false,
      body: linkShorterProvider.linkHistory.isNotEmpty
          ? const LinkHistoryAvailableWidget()
          : SizedBox(
              height: screenHeight - keyboardHeight,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 10,
                        child: SvgPicture.asset(AssetPaths.logoSvg),
                      ),
                      Expanded(
                        flex: 20,
                        child: SvgPicture.asset(AssetPaths.illustrationSvg),
                      ),
                      Expanded(
                        flex: 25,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: const [
                              Text(
                                "Let's get started!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Paste your first link into the field to shorten it',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Expanded(flex: 15, child: const UrlShortenWidget())
                    ],
                  ),
                  linkShorterProvider.isWaiting
                      ? Positioned(
                          top: (screenHeight) / 2,
                          left: MediaQuery.of(context).size.width / 2,
                          child: CircularProgressIndicator(),
                        )
                      : Positioned(
                          child: Container(),
                        ),
                ],
              ),
            ),
    );
  }
}
