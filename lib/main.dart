import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SongListScreen(),
    );
  }
}

class SongListScreen extends StatefulWidget {
  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  final List<Song> _songs = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();

  void _addSong() {
    final title = _titleController.text;
    final artist = _artistController.text;
    final genre = _genreController.text;

    if (title.isNotEmpty && artist.isNotEmpty && genre.isNotEmpty) {
      setState(() {
        _songs.add(Song(title: title, artist: artist, genre: genre));
      });

      _titleController.clear();
      _artistController.clear();
      _genreController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Songs',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Song Title'),
            ),
            TextField(
              controller: _artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: _genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addSong,
              child: Text('Add Song'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _songs.length,
                itemBuilder: (context, index) {
                  final song = _songs[index];
                  return ListTile(
                    title: Text(song.title),
                    subtitle: Text('${song.artist} • ${song.genre}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Song {
  String title;
  String artist;
  String genre;

  Song({required this.title, required this.artist, required this.genre});
}
