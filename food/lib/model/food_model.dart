class Food {
    int? id;
    String? name;
    List<String>? ingredients;
    List<String>? instructions;
    int? prepTimeMinutes;
    int? cookTimeMinutes;
    int? servings;
    String? difficulty;
    String? cuisine;
    int? caloriesPerServing;
    List<String>? tags;
    int? userId;
    String? image;
    double? rating;
    int? reviewCount;
    List<String>? mealType;

    Food({
        this.id,
        this.name,
        this.ingredients,
        this.instructions,
        this.prepTimeMinutes,
        this.cookTimeMinutes,
        this.servings,
        this.difficulty,
        this.cuisine,
        this.caloriesPerServing,
        this.tags,
        this.userId,
        this.image,
        this.rating,
        this.reviewCount,
        this.mealType,
    });

factory Food.fromJson(Map<String, dynamic> json) => Food(
  id: json["id"],
  name: json["name"],
  ingredients: List<String>.from(json["ingredients"] ?? []),
  instructions: List<String>.from(json["instructions"] ?? []),
  prepTimeMinutes: json["prepTimeMinutes"],
  cookTimeMinutes: json["cookTimeMinutes"],
  servings: json["servings"],
  difficulty: json["difficulty"],
  cuisine: json["cuisine"],
  caloriesPerServing: json["caloriesPerServing"],
  tags: List<String>.from(json["tags"] ?? []),
  userId: json["userId"],
  image: json["image"],
  rating: json["rating"]?.toDouble(),
  reviewCount: json["reviewCount"],
  mealType: List<String>.from(json["mealType"] ?? []),
);



    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
        "instructions": instructions == null ? [] : List<dynamic>.from(instructions!.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
        "difficulty": difficulty,
        "cuisine": cuisine,
        "caloriesPerServing": caloriesPerServing,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userId": userId,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
        "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
    };
}
