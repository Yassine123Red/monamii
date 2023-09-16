
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/core/constant/colorApp.dart';
import 'package:monami/data/model/usersmodel.dart';
import 'package:monami/view/widget/profile/SujetsFavorite.dart';

import '../../../controller/users/profile/viewprofilecontroller.dart';


class Cstmedatausers extends GetView<usersprofilecontrollerImp> {
  // final String name;
  // final String lalong;
  // final String desc;
  // final String age;
  // final String category;
  // final String contry;
  final usersModel usersmodel;
  final void Function()? ontap ;

  Cstmedatausers( {required this.usersmodel,
required  this.ontap, 
    super.key,
  //  required this.name,
  //   required this.desc,
  //   required this.category,
  //   required this.contry, required this.lalong, required this.age,
  });

  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   usersprofilecontrollerImp controller =    Get.put(usersprofilecontrollerImp());


    return Container(
      height: 700,
      width: double.infinity,
      child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 255, 239, 215),
                              AppColor.primaryColormonami,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: ontap,
                        child: Container(
                          margin: EdgeInsets.only(top: 250),
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                                topRight: Radius.circular(60),
                                topLeft: Radius.circular(60)),
                            border: Border.all(
                                width: 1, color: Color.fromARGB(255, 255, 0, 30)),
                          ),

                            child: Center(child: Text("Edit Prfile"))),
                        ),
                      
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 290),
                        height: 0.5,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: AppColor.grey)),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/me.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                              bottomLeft: Radius.circular(16.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                            border: Border.all(color: AppColor.white, width: 3)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "${usersmodel.usersName}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                      Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                        "${usersmodel.usersCuntry}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    )),
                  ],
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 36),
                    child: Text(
                        "${usersmodel.usersAge}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    )),
                    SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                         Icon(
                          Icons.star, size: 15,
                          color: Color.fromRGBO(249, 186, 92, 1),
                        ),
                         Icon(
                          Icons.star, size: 15,
                          color: Color.fromRGBO(249, 186, 92, 1),
                        ),  Icon(
                          Icons.star, size: 15,
                          color: Color.fromRGBO(249, 186, 92, 1),
                        ),  Icon(
                          Icons.star, size: 15,
                          color: Color.fromRGBO(249, 186, 92, 1),
                        ),  Icon(
                          Icons.star_border, size: 15,
                          color: Color.fromRGBO(249, 186, 92, 1),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                     "Description :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(left: 40, right: 30),
                    child: Text(    "${usersmodel.usersDesc}",      
                      style: TextStyle(color: Colors.grey),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'Ses Sujets Favoris :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Sujetsfavoriteprofile(titleappbar: "Sport"),
                          Sujetsfavoriteprofile(titleappbar: "Problemes sociaux"),
                          Sujetsfavoriteprofile(titleappbar: "Voyage"),
                          Sujetsfavoriteprofile(titleappbar: "Cuisine"),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Sujetsfavoriteprofile(titleappbar: "shoping"),
                          Sujetsfavoriteprofile(titleappbar: "Les histoi"),
                          Sujetsfavoriteprofile(titleappbar: "Curture générale"),
                          Sujetsfavoriteprofile(titleappbar: "fitness et santé "),
                        ],
                      ),
                    )),
              ]),
            ),
          ],
  
      ),
    );
  }
}
