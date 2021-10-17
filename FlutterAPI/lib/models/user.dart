part of 'user.api.dart';

class User{
  final String id;
  final String first_name;
  final String last_name;
  final String avatar;

  User({required this.id, required this.first_name, required this.last_name, required this.avatar});

  factory User.createUser(Map<String, dynamic> object){
    return User(
      id: object['id'].toString(),
      first_name: object['first_name'],
      last_name: object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<List<User>> connect(String page) async{
    Uri apiUrl = Uri.parse("https://reqres.in/api/users?page="+page);

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List <dynamic> user = (jsonObject as Map<String, dynamic>)['data'];
    List<User> users = [];

    for(int i = 0; i < user.length; i++){
       users.add(User.createUser(user[i]));
    }
    return users;
  }
}