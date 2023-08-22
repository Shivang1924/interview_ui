import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/constants/colors.dart';
import 'package:interview_ui/src/constants/image_strings.dart';
import 'package:interview_ui/src/features/home_screen/bloc/home_screen_blocs.dart';
import 'package:interview_ui/src/features/home_screen/bloc/home_screen_events.dart';
import 'package:interview_ui/src/features/home_screen/bloc/home_screen_states.dart';
import 'package:interview_ui/src/features/home_screen/model/data/home_grid_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBlocs(),
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  void initState() {
    BlocProvider.of<HomeScreenBlocs>(context).add(FetchHomeScreenData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeScreenBlocs, HomeScreenStates>(
        listener: (context, state) {
          if (state is HomeScreenFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if(state is HomeScreenInitialState){
            return const Center(
              child: CircularProgressIndicator(
                color: loginButtonColor,
              ),
            );
          }
          else if(state is HomeScreenLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                color: loginButtonColor,
              ),
            );
          }
          else if(state is HomeScreenLoadedState){
            return SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Hello",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Product Sans',
                                    color: hintTextColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(hiImage)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 35,
                              width: 246,
                              child: Text(
                                "User name",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Product Sans',
                                  fontWeight: FontWeight.w400,
                                  color: loginHeadTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              profileImage,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 119,
                    width: 319,
                    margin:
                    const EdgeInsets.only(bottom: 15, left: 25, right: 25),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: const AssetImage(bannerImage),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: 20,
                          child: SizedBox(
                            height: 40,
                            width: 137,
                            child: Text(
                              "Better for Health",
                              style: TextStyle(
                                wordSpacing: 5,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Gloria Hallelujah',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      "Commencez votre objectif",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                        color: hintTextColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: 246,
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      "En santé",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                        color: loginHeadTextColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GridView.builder(
                    padding:
                    const EdgeInsets.only(bottom: 20, left: 25, right: 25),
                    shrinkWrap: true,
                    itemCount: gridData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: gridData[index].containerBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  gridData[index].titleText,
                                  style: const TextStyle(
                                    color: loginHeadTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Product Sans',
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16 / 2),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: gridData[index].circleContainerColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    gridData[index].iconUrl,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              gridData[index].subTitleText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Product Sans',
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      "Musique de méditation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                        color: hintTextColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: 246,
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Lancer",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginHeadTextColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Voir tout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginButtonBorderColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.black26,
                          elevation: 10,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.62,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.15,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          bannerImage,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * 0.7,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Méditation",
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 28,
                                              fontFamily: 'Product Sans',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Musique de méditation",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              fontFamily: 'Product Sans',
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 7,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              border: Border.all(
                                                color: loginButtonBorderColor,
                                              ),
                                            ),
                                            child: const Text(
                                              "25 min",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Product Sans',
                                                fontWeight: FontWeight.w400,
                                                color: loginButtonBorderColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 25,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: loginButtonBorderColor,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      "Soyez en forme",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                        color: hintTextColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: 246,
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Yoga",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginHeadTextColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Voir tout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginButtonBorderColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 108,
                          height: 190,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage(banner2Image),
                                  fit: BoxFit.fill)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(56, 77, 104, 1),
                                  Color.fromRGBO(0, 157, 202, 0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0, 0.9],
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 18.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Paix",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Product Sans',
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      "Soyez en forme",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Product Sans',
                        color: hintTextColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: 246,
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "En savoir plus",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginHeadTextColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Voir tout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Product Sans',
                            color: loginButtonBorderColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(listImage1),
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text(
                          "Postures de travail",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Product Sans',
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1.2,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(listImage1),
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text(
                          "Voir l'humeur",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Product Sans',
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
