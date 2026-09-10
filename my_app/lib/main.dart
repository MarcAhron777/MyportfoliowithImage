import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// ------------------- SCREEN 1: HOME -------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Mga sample image URL para sa carousel
  final List<String> imageUrls = const [
    'https://picsum.photos/id/1/300/200',
    'https://picsum.photos/id/2/300/200',
    'https://picsum.photos/id/3/300/200',
    'https://picsum.photos/id/4/300/200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'BSIT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Image Carousel with Network Images
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.blue),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.grey),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMeScreen()),
                );
              },
              child: const Text('About Me'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ------------------- SCREEN 2: ABOUT ME -------------------
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(75.0),
                child: Image.network(
                  'https://picsum.photos/id/64/200/200', // Palitan ng profile image URL
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySkillsScreen()),
                  );
                },
                child: const Text('My Skills'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------- SCREEN 3: MY SKILLS -------------------
class MySkillsScreen extends StatelessWidget {
  const MySkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Skills')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildSkillItem('A: Web Dev', 'Skill details:\nname, text here', 'https://picsum.photos/id/119/150/150'),
                  _buildSkillItem('B: UI/UX', 'Skill details:\nname, text here', 'https://picsum.photos/id/180/150/150'),
                  _buildSkillItem('Image C', 'Skill details:\nname, text here', 'https://picsum.photos/id/20/150/150'),
                  _buildSkillItem('Image D', 'Skill details:\nname, text here', 'https://picsum.photos/id/60/150/150'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProjectScreen()),
                );
              },
              child: const Text('My Project'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(String title, String subtitle, String imgUrl) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(imgUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 10), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ------------------- SCREEN 4: MY PROJECT -------------------
class MyProjectScreen extends StatelessWidget {
  const MyProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyProject')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sysarch Project', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/id/0/400/200', // Palitan ng project photo URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Sample details:\n- Web Dev\n- BI/UI/UX Project\n- Sysarch Project',
              style: TextStyle(fontSize: 14),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactMeScreen()),
                  );
                },
                child: const Text('Elevated Button'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ------------------- SCREEN 5: CONTACT ME -------------------
class ContactMeScreen extends StatelessWidget {
  const ContactMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Me')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Contact info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.phone_android),
                SizedBox(width: 10),
                Text('Contact Telent:\n09164752798\ncerdenamarcahron@gmail.com'),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text('Contact info\ncontact info'),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Elevated Button: label'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}