import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGalleryHomePage(),
    );
  }
}

class PhotoGalleryHomePage extends StatefulWidget {
  @override
  _PhotoGalleryHomePageState createState() => _PhotoGalleryHomePageState();
}

class _PhotoGalleryHomePageState extends State<PhotoGalleryHomePage> {
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome to our Photo Gallery!",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Search for Photos",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showSnackBar("Image ${index + 1} clicked");
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network("https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
                            width: 100, height: 100),
                        Text("Image ${index + 1}"),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network("https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80"),
              title: Text("Miki"),
              subtitle: Text("তানভীর এর বিড়াল"),
            ),
            ListTile(
              leading: Image.network("https://plus.unsplash.com/premium_photo-1667030489905-d8e6309ebe0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
              title: Text("Mini"),
              subtitle: Text("তামান্নার বিড়াল"),
            ),
            ListTile(
              leading: Image.network("https://images.unsplash.com/photo-1615807713086-bfc4975801d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1854&q=80"),
              title: Text("Miwki"),
              subtitle: Text("তানিয়ার বিড়াল"),
            ),
            Center(
              child: IconButton(onPressed: (){
                _showSnackBar("Photos Uploaded Successfully!");
              }, icon: Icon(Icons.upload), style: IconButton.styleFrom(
                backgroundColor: Colors.blue,
              ),),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
