class CategoryModel {
  String? category_name;
  String? category_dec;
  String? category_dis;
  String? product_id;
  String? product_name;
  String? product_price;
  String? product_rating;
  String? product_description;
  String? product_Nutrition;
  String? product_image;
  String? product_liked;

  CategoryModel.fromJson(Map<String, dynamic> data) {
    category_name = data['category_name'];
    category_dec = data['category_dec'];
    category_dis = data['category_dis'];
    product_id = data['product_id'];
    product_name = data['product_name'];
    product_price = data['product_price'];
    product_rating = data['product_rating'];
    product_description = data['product_description'];
    product_Nutrition = data['product_Nutrition'];
    product_image = data['product_image'];
    product_liked = data['product_liked'];
  }

  Map<String, dynamic> toJson() {
    return {
      "category_name": category_name,
      "category_dec": category_dec,
      "category_dis": category_dis,
      "product_id": product_id,
      "product_price": product_price,
      "product_rating": product_rating,
      "product_name": product_name,
      "product_description": product_description,
      "product_Nutrition": product_Nutrition,
      "product_image": product_image,
      "product_liked": product_liked,
    };
  }
}
