// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
    List<Datum> data;

    ItemModel({
        required this.data,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    List<Item> items;

    Datum({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.items,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    int id;
    String name;
    String details;
    double cost;
    bool active;
    DateTime createdAt;
    DateTime updatedAt;
    List<Ingredient> tags;
    List<Ingredient> ingredients;
    List<Photo> photos;

    Item({
        required this.id,
        required this.name,
        required this.details,
        required this.cost,
        required this.active,
        required this.createdAt,
        required this.updatedAt,
        required this.tags,
        required this.ingredients,
        required this.photos,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        cost: json["cost"]?.toDouble(),
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tags: List<Ingredient>.from(json["Tags"].map((x) => Ingredient.fromJson(x))),
        ingredients: List<Ingredient>.from(json["Ingredients"].map((x) => Ingredient.fromJson(x))),
        photos: List<Photo>.from(json["Photos"].map((x) => Photo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "cost": cost,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "Tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "Ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "Photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    };
}

class Ingredient {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    ItemIngredient? itemIngredient;
    Photo? itemTag;

    Ingredient({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
        this.itemIngredient,
        this.itemTag,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        itemIngredient: json["ItemIngredient"] == null ? null : ItemIngredient.fromJson(json["ItemIngredient"]),
        itemTag: json["ItemTag"] == null ? null : Photo.fromJson(json["ItemTag"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "ItemIngredient": itemIngredient?.toJson(),
        "ItemTag": itemTag?.toJson(),
    };
}

class ItemIngredient {
    dynamic amount;
    DateTime createdAt;
    DateTime updatedAt;
    int ingredientId;
    int itemId;

    ItemIngredient({
        this.amount,
        required this.createdAt,
        required this.updatedAt,
        required this.ingredientId,
        required this.itemId,
    });

    factory ItemIngredient.fromJson(Map<String, dynamic> json) => ItemIngredient(
        amount: json["amount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        ingredientId: json["ingredient_id"],
        itemId: json["item_id"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "ingredient_id": ingredientId,
        "item_id": itemId,
    };
}

class Photo {
    int id;
    String? image;
    DateTime createdAt;
    DateTime updatedAt;
    int itemId;
    int? tagId;

    Photo({
        required this.id,
        this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.itemId,
        this.tagId,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        itemId: json["item_id"],
        tagId: json["tag_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "item_id": itemId,
        "tag_id": tagId,
    };
}
