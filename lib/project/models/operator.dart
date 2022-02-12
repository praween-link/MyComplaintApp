class Operator {
  final String name;
  final String phone;
  final String password;
  final String email;
  final Map<String, String> address;
  final String photo;
  final String category;

  const Operator(
      {required this.name,
      required this.phone,
      required this.password,
      required this.email,
      required this.address,
      required this.photo,
      required this.category});
}
