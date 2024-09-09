import 'package:flutter/material.dart';
import 'package:food/model/food_model.dart';

class NavigatorDetailPage extends StatelessWidget {
  final Food foodApi;

  const NavigatorDetailPage({Key? key, required this.foodApi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            imageContainer(size),
            rowIconAndText(),
            productDescriptionTitle(),
            productDescription(),
            productDescriptionPrice()
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(foodApi.name.toString(),
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black)),
      backgroundColor: Colors.grey.shade200,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.favorite,
            size: 30,
            color: Colors.red.shade400,
          ),
        )
      ],
    );
  }

  Padding productDescriptionPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                '£ ${foodApi.caloriesPerServing.toString()}',
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
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.red),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ))
        ],
      ),
    );
  }

  Padding productDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: foodApi.instructions?.map((instruction) {
              return Text(
                instruction,
                style: const TextStyle(fontSize: 16),
              );
            }).toList() ??
            [],
      ),
    );
  }

  Padding productDescriptionTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(foodApi.name.toString(),
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding rowIconAndText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(
                width: 3,
              ),
              Text(
                foodApi.rating.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.food_bank_outlined,
                color: Colors.red,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${foodApi.caloriesPerServing.toString()} Kcal',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.timelapse_sharp,
                color: Colors.red,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${foodApi.prepTimeMinutes.toString()} min',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container imageContainer(Size size) {
    return Container(
      color: Colors.transparent,
      height: size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(foodApi.image.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(45)),
        ),
      ),
    );
  }
}
