class ContactModel {
  int id;
  String name;
  String mobile;
  String? email;
  String? streetAddress;
  String? website;
  String? image;
  bool favorite;

  ContactModel(
      {required this.id,
      required this.name,
      required this.mobile,
      this.email,
      this.streetAddress,
      this.website,
      this.image,
      this.favorite = false});
}
