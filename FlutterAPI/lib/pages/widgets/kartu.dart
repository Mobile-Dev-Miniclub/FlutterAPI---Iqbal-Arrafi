part of 'widget.dart';

class Kartu extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String image;

  Kartu(this.firstName, this.lastName, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      width: double.infinity,
      height: 100,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      firstName,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      lastName,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
