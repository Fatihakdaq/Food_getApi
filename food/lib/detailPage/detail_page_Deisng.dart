// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:food/detailPage/navigator_detail_page/navigator_detail_page.dart';
import 'package:food/model/food_model.dart';
import 'package:food/services/services_food.dart';

class DetailPageDeisng extends StatelessWidget {
  const DetailPageDeisng({super.key});

  @override
  Widget build(BuildContext context) {
    FoodServices foodServices = FoodServices();
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images_png/49.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(children: [
          homePageText(),
          HomePageSerachBar(),
          const SizedBox(
            height: 15,
          ),
          productSelectionCategory(foodServices, context),
          const SizedBox(
            height: 15,
          ),
          dviderText('Popular'),
          const SizedBox(
            height: 10,
          ),
          HomePageProductCard(foodServices),
          const SizedBox(
            height: 10,
          ),
          dviderText('Top of the week'),
          HomePageProductHorizantalCard(size, foodServices),
        ]),
      ),
    );
  }

  Container HomePageProductHorizantalCard(
      Size size, FoodServices foodServices) {
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder<List<Food>>(
                future: foodServices.getFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var foodData = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: foodData.length,
                      itemBuilder: (context, index) {
                        var foodRecipes = foodData[index];

                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigatorDetailPage(
                                      foodApi: foodRecipes,
                                    ),
                                  ));
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              foodRecipes.image.toString()),
                                          fit: BoxFit
                                              .cover, // Resmi kapsaması için ekledim
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.04,
                                    ),
                                    Expanded(
                                      // Yeni eklenen Expanded widget
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            foodRecipes.name ?? 'Not Found',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${foodRecipes.prepTimeMinutes.toString()} min',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '£ ${foodRecipes.caloriesPerServing.toString()}',
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.add_box_rounded,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
          ],
        ),
      ),
    );
  }

  Container HomePageProductCard(FoodServices foodServices) {
    return Container(
      color: Colors.transparent,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.transparent,
          height: 300,
          child: FutureBuilder<List<Food>>(
            future: foodServices.getFood(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var foodData = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodData.length,
                  itemBuilder: (context, index) {
                    var foodRecipes = foodData[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigatorDetailPage(
                                  foodApi: foodRecipes,
                                ),
                              ));
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            foodRecipes.image.toString())),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  foodRecipes.name.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${foodRecipes.prepTimeMinutes.toString()} min',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '£ ${foodRecipes.caloriesPerServing.toString()}',
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.add_box_rounded,
                                      color: Colors.red,
                                      size: 35,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
      ),
    );
  }

  Row dviderText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'See More',
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
      ],
    );
  }

  Container productSelectionCategory(
      FoodServices foodServices, BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            height: 100,
            color: Colors.transparent,
            child: FutureBuilder<List<Food>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var foodData = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var foodRecipes = foodData[index];

                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigatorDetailPage(
                                    foodApi: foodRecipes,
                                  ),
                                ));
                          },
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(35)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        foodRecipes.image ?? 'Not Found',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      foodRecipes.cuisine.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                    itemCount: foodData.length,
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              future: foodServices.getFood(),
            )),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            // ignore: sort_child_properties_last
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ana Sayfa'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ayarlar'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Hakkında'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  SearchBar HomePageSerachBar() {
    return SearchBar(
      leading: const Icon(
        Icons.search,
      ),
      trailing: const [
        Icon(Icons.filter_list),
      ],
      hintText: 'Search Your Fav Food',
      onTap: () {},
      backgroundColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(10),
      textStyle: MaterialStateProperty.all(
        const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Column homePageText() {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              'Find The ',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Best',
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'Food ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Around You',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
