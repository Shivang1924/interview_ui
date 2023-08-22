import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/constants/colors.dart';
import 'package:interview_ui/src/constants/image_strings.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/blocs/sign_in_blocs.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/blocs/sign_in_events.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/blocs/sign_in_states.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/model/data/sign_in_data.dart';
import 'package:interview_ui/src/features/home_screen/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBlocs(),
      child: const SignInWidget(),
    );
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? value;
  String selectedValueOfGender = '';

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
      body: BlocConsumer<SignInBlocs, SignInStates>(
        listener: (context, state) {
          if (state is SignInLoadedState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          } else if (state is SignInFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if(state is SignInLoadingState){
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
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: loginButtonBorderColor,
                          size: 28,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Product Sans',
                          color: loginHeadTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Image.asset(
                    signInImage,
                    height: 231.01,
                    width: 229.87,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildTextFormFieldContainer("Name", nameController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer("Email", emailController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer(
                    "Mobile Number", mobileNumberController),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    alignment: Alignment.center,
                    hint: const Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                      ),
                    ),
                    value: value,
                    items: genderListData
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.genderName,
                            child: Center(
                              child: Text(e.genderName),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValueOfGender = value ?? '';
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: hintTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                      ),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                  child: const ListTile(
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: EdgeInsets.only(bottom: 15, right: 15),
                    trailing: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Icon(Icons.camera_alt_outlined, size: 22),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: Center(
                        child: Text(
                          "Profile picture",
                          style: TextStyle(
                            color: hintTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer("Height", heightController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer("Weight", weightController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer("Password", passwordController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldContainer(
                    "Confirm Password", confirmPasswordController),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SignInBlocs>(context).add(
                      SignInButtonPressedEvent(
                        name: nameController.text,
                        email: emailController.text,
                        mobileNumber: mobileNumberController.text,
                        genderType: selectedValueOfGender,
                        profileImageUrl: '',
                        height: heightController.text,
                        weight: weightController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      ),
                    );
                  },
                  child: Container(
                    height: 52,
                    width: 319,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: loginButtonColor,
                      border:
                          Border.all(color: loginButtonBorderColor, width: 0.5),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
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
