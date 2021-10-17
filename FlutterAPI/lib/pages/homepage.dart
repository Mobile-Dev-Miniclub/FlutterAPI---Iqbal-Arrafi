part of 'page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Kartu> kartu = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flutter API",
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: kartu.length,
                itemBuilder: (ctx, i) {
                   return kartu[i];
                  
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.deepPurple),
                ),
                onPressed: () {
                  User.connect("1").then((users) {
                    for (int i = 0; i < users.length; i++) {
                      kartu.add(Kartu(users[i].first_name, users[i].last_name,
                          users[i].avatar));
                    }
                    setState(() {});
                  });
                },
                child: Container(
                  width: 150,
                  height: 70,
                  child: Center(
                    child: Text("GET"),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.deepPurple),
                ),
                onPressed: () {
                  UserPost.connectPost("Fu Hua","https://i.redd.it/1zbe7a0j3kt61.png").then((users) {
                    kartu.add(Kartu(users.name, "", users.image));
                    setState(() {
                    });
                  });
                },
                child: Container(
                  width: 150,
                  height: 70,
                  child: Center(
                    child: Text("POST"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
