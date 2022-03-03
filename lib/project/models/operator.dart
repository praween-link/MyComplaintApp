class Operator {
  final String name;
  final String phone;
  final String password;
  final String email;
  final OperatorAddress address;
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


class OperatorAddress{
  final String pincode;
  final String state;
  final String city;
  final String area;

  const OperatorAddress({required this.pincode, required this.state, required this.city, required this.area});
}
