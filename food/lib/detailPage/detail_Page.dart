// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer_enhanced/flutter_slider_drawer.dart';
import 'package:food/detailPage/food_rexipes.dart';
import 'package:food/model/food_model.dart';
import 'package:food/services/services_food.dart';

class DetailPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    FoodServices foodServices = FoodServices();
    var foodServicess = foodServices.getFood();
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SliderDrawer(
        appBar: const SliderAppBar(
          appBarColor: Colors.white,
          title: Text(
            'Food',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        slider: SliderView(),
        child: FutureBuilder<List<Food>>(
          future: foodServicess,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var foodData = snapshot.data!;
              return ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: foodData.length,
                itemBuilder: (context, index) {
                  var foodRecipes = foodData[index];

                  return ListTile(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodRecipes(isLoading: true),));
                 },
                    leading: CircleAvatar(
                      maxRadius: 35,
                      minRadius: 35,
                      backgroundImage: NetworkImage(foodRecipes.image ?? ''),
                    ),
                    title: Text(foodRecipes.name ?? ''),
                    subtitle: Text(foodRecipes.cuisine.toString()),
                    // Josn içerindeki dizi listesini çekme String
                     trailing: IconButton(onPressed: () {
                       
                     }, icon: const Icon(Icons.arrow_forward_ios_sharp)), 
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget SliderView() {
    return Container(
      color: Colors.grey.shade400,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: const [
          SizedBox(height: 30),
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 70,
            minRadius: 70,
            backgroundImage: AssetImage('assets/images_png/49.png'),
          ),
          SizedBox(height: 20),
          Text(
            'Michael Scofield',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank_sharp),
            title: Text('Food'),
          ),
        ],
      ),
    );
  }
}
