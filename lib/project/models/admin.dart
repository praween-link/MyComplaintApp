class Admin {
  final String name;
  final String phone;
  final String password;
  final String email;
  final AdminAddress address;
  final String photo;

  const Admin(
      {required this.name,
      required this.phone,
      required this.password,
      required this.email,
      required this.address,
      required this.photo});
}

class AdminAddress{
  final String pincode;
  final String state;
  final String city;
  final String area;

  const AdminAddress({required this.pincode, required this.state, required this.city, required this.area});
}
