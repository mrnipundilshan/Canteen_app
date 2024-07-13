class FoodItem {
  int veg_count = 0;
  int veg_price = 0;

  int egg_count = 0;
  int egg_price = 0;

  int chicken_count = 0;
  int chicken_price = 0;

  int rice_count = 0;
  int rice_price = 0;

  int kottu_count = 0;
  int kottu_price = 0;

  int fish_count = 0;
  int fish_price = 0;

  late String food_name;

  valueupdate(String food_name, count, price) {
    if (food_name == "veg") {
      veg_count = count;
      veg_price = price;
    }
    if (food_name == "egg") {
      egg_count = count;
      egg_price = price;
    }
    if (food_name == "chicken") {
      chicken_count = count;
      chicken_price = price;
    }
    if (food_name == "rice") {
      rice_count = count;
      rice_price = price;
    }
    if (food_name == "kottu") {
      kottu_count = count;
      kottu_price = price;
    }
    if (food_name == "fish") {
      fish_count = count;
      fish_price = price;
    }
  }
}
