

class ApiPath {
  static const products = "products/";
  static User(String uid) => "users/$uid";
  static Add_tocard(String uid, String add_card_id) =>
      "users/$uid/Cards/$add_card_id";
}
