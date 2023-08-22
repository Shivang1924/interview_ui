import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/constants/colors.dart';
import 'package:interview_ui/src/constants/image_strings.dart';
import 'package:interview_ui/src/features/authentication/login_screen/bloc/login_blocs.dart';
import 'package:interview_ui/src/features/authentication/login_screen/bloc/login_events.dart';
import 'package:interview_ui/src/features/authentication/login_screen/bloc/login_states.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:interview_ui/src/features/home_screen/home_screen.dart';
import 'package:interview_ui/src/utils/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBlocs(),
      child: const LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Container buildTextFormFieldContainer(
    String hintText,
    TextEditingController controller,
  ) {
    return Container(
      height: 52,
      width: 324,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: loginContainerColor,
        border: Border.all(
          color: loginHeadTextColor,
          width: 0.5,
        ),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 5),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: hintTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Product Sans',
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBlocs, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          } else if (state is LoginFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
         if (state is LoginLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: loginButtonColor,
              ),
            );
          }
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Product Sans',
                      color: loginHeadTextColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Image.asset(
                    loginImage,
                    height: 236,
                    width: 236,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                buildTextFormFieldContainer("Username", userNameController),
                const SizedBox(
                  height: 20,
                ),
                buildTextFormFieldContainer("Password", passwordController),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (userNameController.text.isEmpty &&
                        passwordController.text.isEmpty) {
                      toastMessage(msg: "Please Enter Both Fields");
                    } else if (userNameController.text.isEmpty) {
                      toastMessage(msg: "Please Enter Username");
                    } else if (passwordController.text.isEmpty) {
                      toastMessage(msg: "Please Enter Password");
                    } else {
                      BlocProvider.of<LoginBlocs>(context).add(
                        LoginButtonPressedEvent(
                          userName: userNameController.text.toString(),
                          password: passwordController.text.toString(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 52,
                    width: 324,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: loginButtonColor,
                      border:
                          Border.all(color: loginButtonBorderColor, width: 0.5),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  },
                  child: Container(
                    height: 27,
                    width: 224,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 25),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 20,
                        color: loginButtonBorderColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
