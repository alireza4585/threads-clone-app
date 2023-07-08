class thread {
  String? name;
  String? posted;
  String? description;
  String? image;
  String? profileImage;
  String? replies;
  String? liks;
  String? replier;
  String? replier1;
  String? replier2;
  thread(
      this.description,
      this.image,
      this.liks,
      this.name,
      this.posted,
      this.profileImage,
      this.replier,
      this.replies,
      this.replier1,
      this.replier2);

  factory thread.formJson(Map<String, String> jsonObject) {
    return thread(
      jsonObject['description'],
      jsonObject['image'],
      jsonObject['liks'],
      jsonObject['name'],
      jsonObject['posted'],
      jsonObject['profileImage'],
      jsonObject['replier'],
      jsonObject['replies'],
      jsonObject['replier1'],
      jsonObject['replier2'],
    );
  }
}
