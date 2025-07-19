import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivaheal/screens/forgot_password.dart';
import 'package:vivaheal/screens/home.dart';
// import 'package:vivaheal/screens/dashboard.dart';
import 'package:vivaheal/utils/buttons.dart';
import 'package:vivaheal/utils/login_colors.dart';
import 'package:vivaheal/utils/text_styles.dart';
import 'package:vivaheal/utils/login_strings.dart';
import 'package:vivaheal/utils/login_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  // bool validStatus = false;
  bool isKeepMeSignedIn = false;
  LoginPageColors colorObj = LoginPageColors();
  LoginPageStrings stringObj = LoginPageStrings();

  String? phoneNumberErrorMessage;
  String? passwordErrorMessage;

  bool validateAllFields() {
    final phone = phoneController.text.trim();
    final password = passwordController.text;

    bool isValid = true;

    setState(() {
      phoneNumberErrorMessage = phone.isEmpty
          ? stringObj.phoneNumberEmptyError
          : (!RegExp(r'^\d{10}$').hasMatch(phone)
                ? stringObj.invalidPhoneNumberError
                : null);

      if (phoneNumberErrorMessage != null) {
        isValid = false;
      }

      passwordErrorMessage = password.isEmpty
          ? stringObj.passwordEmptyError
          : (password.length < 6
                ? stringObj.passwordEmptyError
                : (!RegExp(r'[A-Z]').hasMatch(password)
                      ? stringObj.passwordNoUpperCaseError
                      : (!RegExp(r'[0-9]').hasMatch(password)
                            ? stringObj.passwordNoNumberError
                            : (!RegExp(
                                    r'[!@#\$&*~%^()_+\-=\[\]{};:\\|,.<>\/?]',
                                  ).hasMatch(password)
                                  ? stringObj.passwordNoSpecialCharacterError
                                  : null))));

      if (passwordErrorMessage != null) {
        isValid = false;
      }
    });

    return isValid;
  }

  Color get phoneBorderColor =>
      phoneFocusNode.hasFocus ? colorObj.tealColor : colorObj.textGreyColor;

  Color get passwordBorderColor =>
      passwordFocusNode.hasFocus ? colorObj.tealColor : colorObj.textGreyColor;

  @override
  void initState() {
    super.initState();
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    phoneController.dispose();
    passwordFocusNode.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool dev = screenSize.width < 600; // Example condition for device type

    return Scaffold(
      backgroundColor: colorObj.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 24, 24, keyboardHeight + 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.1),
                    Row(
                      children: [
                        Text(
                          stringObj.loginText,
                          style: TextStyles.monText(
                            fontSize: dev ? 45 : 60,
                            fontWeight: FontWeight.w600,
                            color: colorObj.textDarkColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),

                    // Mobile Number Label
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          stringObj.mobileNumberHead,
                          style: TextStyles.monText(
                            fontSize: dev ? 12 : 18,
                            fontWeight: FontWeight.w500,
                            color: colorObj.textDarkColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          stringObj.asteriks,
                          style: TextStyles.monText(
                            fontSize: dev ? 15 : 21,
                            fontWeight: FontWeight.w500,
                            color: colorObj.errorColorRed,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Mobile Number Field
                    Container(
                      height: dev ? 44 : 62,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: colorObj.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: colorObj.shadowBlack,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border(
                          bottom: BorderSide(
                            color: phoneBorderColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  stringObj.countryCode,
                                  style: TextStyles.monText(
                                    fontSize: dev ? 14 : 20,
                                    fontWeight: FontWeight.w500,
                                    color: colorObj.textDarkColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  LoginPageImages.indiaFlag,
                                  height: dev ? 16 : 24,
                                  width: dev ? 20 : 28,
                                ),

                                const SizedBox(width: 15),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: colorObj.textGreyColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              focusNode: phoneFocusNode,
                              keyboardType: TextInputType.number,
                              style: TextStyles.monText(
                                fontSize: dev ? 14 : 20,
                                fontWeight: FontWeight.w600,
                                color: colorObj.textDarkColor,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    LoginPageImages.phoneIconImage,
                                    height: dev ? 22 : 28,
                                    width: dev ? 14 : 20,
                                    color: colorObj.textGreyColor,
                                  ),
                                ),
                                hintText: stringObj.phoneNumberPlaceHolder,
                                hintStyle: TextStyles.monText(
                                  fontSize: dev ? 11 : 19,
                                  fontWeight: FontWeight.w400,
                                  color: colorObj.textGreyColor,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    if (phoneNumberErrorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          phoneNumberErrorMessage!,
                          style: TextStyle(
                            color: colorObj.errorColorRed,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Password Label
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          stringObj.passwordHead,
                          style: TextStyles.monText(
                            fontSize: dev ? 12 : 18,
                            fontWeight: FontWeight.w500,
                            color: colorObj.textDarkColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          stringObj.asteriks,
                          style: TextStyles.monText(
                            fontSize: dev ? 15 : 21,
                            fontWeight: FontWeight.w500,
                            color: colorObj.errorColorRed,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Password Field
                    Container(
                      height: dev ? 44 : 62,
                      padding: const EdgeInsets.only(left: 8, right: 1),
                      decoration: BoxDecoration(
                        color: colorObj.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: colorObj.shadowBlack,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border(
                          bottom: BorderSide(
                            color: passwordBorderColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: !isVisible,
                        style: TextStyles.monText(
                          fontSize: dev ? 14 : 20,
                          fontWeight: FontWeight.w500,
                          color: colorObj.textDarkColor,
                        ),
                        decoration: InputDecoration(
                          hintText: stringObj.passwordPlaceHolder,
                          hintStyle: TextStyles.monText(
                            fontSize: dev ? 11 : 19,
                            fontWeight: FontWeight.w400,
                            color: colorObj.textGreyColor,
                          ),

                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: dev ? 22 : 28,
                              color: colorObj.textGreyColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 6,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    if (passwordErrorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          passwordErrorMessage!,
                          style: TextStyle(
                            color: colorObj.errorColorRed,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isKeepMeSignedIn = !isKeepMeSignedIn;
                            });
                          },
                          icon: Icon(
                            Icons.check_circle_outline_outlined,
                            color: isKeepMeSignedIn
                                ? colorObj.tealColor
                                : colorObj.textGreyColor,
                            size: 23,
                          ),
                        ),
                        Text(
                          stringObj.keepMeSignedIn,
                          style: TextStyles.monText(
                            fontSize: dev ? 14 : 20,
                            fontWeight: FontWeight.w600,
                            color: colorObj.textDarkColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Center(
                      child: gradientButton(
                        buttonLabel: stringObj.loginButton,
                        onPressed: () {
                          bool isValid = validateAllFields();
                          if (isValid) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Dashboard(); // Replace with your dashboard screen
                                },
                              ),
                            );
                          }
                          // else: do nothing or show error (you can add snackbars, dialogs etc.)
                        },
                        height: screenSize.height,
                        width: screenSize.width,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Forgot Password screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          stringObj.forgotPasswordButton,
                          style: TextStyles.monText(
                            fontSize: dev ? 14 : 20,
                            fontWeight: FontWeight.w500,
                            color: colorObj.textGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Sign Up Section (outside scroll)
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         stringObj.doNotHaveAccount,
            //         style: TextStyle(
            //           fontSize: dev ? 14 : 20,
            //           fontFamily: GoogleFonts.montserrat().fontFamily,
            //           color: colorObj.textGreyColor,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           stringObj.newSignUp,
            //           style: TextStyle(
            //             fontSize: dev ? 14 : 20,
            //             fontFamily: GoogleFonts.montserrat().fontFamily,
            //             color: colorObj.tealColor,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
