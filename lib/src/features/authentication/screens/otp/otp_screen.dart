import 'package:first_aid_app/src/constants/colors.dart';
import 'package:first_aid_app/src/constants/image_strings.dart';
import 'package:first_aid_app/src/constants/sizes.dart';
import 'package:first_aid_app/generated/l10n.dart';
import 'package:first_aid_app/src/features/authentication/provider/auth_provider.dart';
import 'package:first_aid_app/src/features/authentication/screens/contacts/contact_support.dart';
import 'package:first_aid_app/src/features/authentication/screens/user_info/user_info.dart';
import 'package:first_aid_app/src/features/core/controllers/widgets/navbar.dart';
import 'package:first_aid_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider1>(
      context,
      listen: true,
    ).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).totpVerification),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(color: tPrimaryColor),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage(tWelcomeScreenImage),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      const SizedBox(height: tFormHeight),
                      Text(
                        S.of(context).tverification,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).tenterOtpSentToPhone,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                          fontFamily: "Poppins",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: tFormHeight),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: tSecondaryColor),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: tPrimaryColor),
                          ),
                        ),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      const SizedBox(height: tFormHeight),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.all(
                                Radius.circular(20),
                              ),
                            ),
                            foregroundColor: tWhiteColor,
                            backgroundColor: tPrimaryColor,
                            side: const BorderSide(color: tSecondaryColor),
                            padding: EdgeInsets.symmetric(
                              vertical: tButtonHeight,
                            ),
                          ),
                          onPressed: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(context, S.of(context).tenter6DigitCode);
                            }
                          },
                          child: Text(S.of(context).tVerify),
                        ),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).tdidntReceiveCode,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                              fontFamily: "Poppins",
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add resend logic here
                            },
                            child: Text(
                              S.of(context).tresend,
                              style: TextStyle(
                                fontSize: 14,
                                color: tPrimaryColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: tFormHeight - 15),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          onPressed: () =>
                              Get.to(() => const ContactSupportScreen()),
                          child: Text.rich(
                            TextSpan(
                              text: "${S.of(context).tNeedHelp} ",
                              style: TextStyle(color: Colors.grey[600]),
                              children: [
                                TextSpan(
                                  text: S.of(context).tContactSupport,
                                  style: TextStyle(
                                    color: tPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider1>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        ap.checkExistingUser().then((value) async {
          if (value == true) {
            ap.getDataFromFirestore().then(
              (value) => ap.setSignIn().then(
                (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBar()),
                  (route) => false,
                ),
              ),
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const UserInformationScreen(),
              ),
              (route) => false,
            );
          }
        });
      },
    );
  }
}