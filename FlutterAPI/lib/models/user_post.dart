part of 'user.api.dart';

class UserPost{
  final String id;
  final String name;
  final String image;
  final String created;

  UserPost({required this.id, required this.name, required this.image, required this.created});

  factory UserPost.createUser(Map<String, dynamic> object){
    return UserPost(
      id: object['id'].toString(),
      name: object['name'],
      image: object['job'],
      created: object['createdAt']
    );
  }

  static Future <UserPost> connectPost(String name, String image) async{
    Uri apiUrl = Uri.parse("https://reqres.in/api/users");

    var apiResult = await http.post(apiUrl, body: {"name": name, "job": image});
    var jsonObject = json.decode(apiResult.body);

    return UserPost.createUser(jsonObject);
  }
}