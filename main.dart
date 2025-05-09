import 'package:flutter/material.dart';

void main() => runApp(MyPortfolioApp());

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/gallery': (context) => GalleryPage(),
        '/mission': (context) => MissionVisionPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

// Navbar Drawer
Drawer buildNavBar(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.teal),
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () => Navigator.pushNamed(context, '/'),
        ),
        ListTile(
          title: Text('About Me'),
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        ListTile(
          title: Text('Gallery'),
          onTap: () => Navigator.pushNamed(context, '/gallery'),
        ),
        ListTile(
          title: Text('Mission/Vision'),
          onTap: () => Navigator.pushNamed(context, '/mission'),
        ),
        ListTile(
          title: Text('Contact Me'),
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),
      ],
    ),
  );
}

// Homepage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: buildNavBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My Portfolio!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Learn More About Me'),
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
    );
  }
}

// About Page
class AboutPage extends StatelessWidget {
  final List<String> skills = ['Flutter', 'HTML', 'CSS', 'JavaScript', 'UI/UX'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Me')),
      drawer: buildNavBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Text(
                  'King Eric S. Alcantara',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.cake, color: Colors.teal),
                  title: Text('Age'),
                  subtitle: Text('20'),
                ),
                ListTile(
                  leading: Icon(Icons.school, color: Colors.teal),
                  title: Text('Course'),
                  subtitle: Text('BS in Information Technology'),
                ),
                ListTile(
                  leading: Icon(Icons.location_city, color: Colors.teal),
                  title: Text('School'),
                  subtitle: Text('University of Cabuyao'),
                ),
                Divider(),
                Text(
                  'Skills',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ...skills.map(
                  (skill) => ListTile(
                    leading: Icon(
                      Icons.check_circle_outline,
                      color: Colors.teal,
                    ),
                    title: Text(skill),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Gallery Page
class GalleryPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      drawer: buildNavBar(context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.builder(
          itemCount: imagePaths.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.grey[200],
                child: Image.asset(imagePaths[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Mission/Vision Page
class MissionVisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mission & Vision')),
      drawer: buildNavBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vision',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'An institution of higher learning, developing globally-competitive and value-laden professionals and leaders instrumental to community development and national building.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mission',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'An institution of higher learning committed to equip individuals with knowledge, skills, and values that will enable them to achieve professional goals and provide leadership and service for national development.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Page
class ContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Me')),
      drawer: buildNavBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text(
                    'Get in touch!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text('Send Message'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Message sent!')));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
