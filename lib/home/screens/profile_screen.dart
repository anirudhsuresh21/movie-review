import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_review/widgets/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;
  final int truncateLength = 180; // Character limit for preview

  String getPreviewText(String text) {
    if (text.length <= truncateLength) return text;
    return '${text.substring(0, truncateLength)}...';
  }

  // final String description =
  //     "As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and "
  //     "falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through "
  //     "the Wasteland they come across the Ci...";

  final String fullDescription =
      "As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and "
      "falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through "
      "the Wasteland they come across the Citadel ruled by Immortan Joe. While the two Tyrants "
      "war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.";

  @override
  Widget build(BuildContext context) {
    // final String fullDescription = fullDescription;
    final String previewDescription = getPreviewText(fullDescription);
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: 20),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                // crossAxisAlignment: ,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First container - 40% of screen width
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.movie_outlined,
                                  color: Colors.grey, size: 18),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Movies Watched",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "2000",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // Second container - 55% of screen width (more than first)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_rounded,
                                  color: Colors.grey, size: 18),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Watch Time",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "24m 30d 23h",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Color(0xFF1E2A38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              // margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Text content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Review by ',
                              style: TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                  text: 'Dilhara',
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Furiosa: A Mad Max Saga',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: List.generate(
                              4,
                              (index) => Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            isExpanded ? fullDescription : previewDescription,
                            style: TextStyle(color: Colors.white70),
                          ),
                          if (!isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() => isExpanded = true);
                              },
                              child: Text(
                                'Read more ›',
                                style: TextStyle(color: Colors.amberAccent),
                              ),
                            )
                          else
                            GestureDetector(
                              onTap: () {
                                setState(() => isExpanded = false);
                              },
                              child: Text(
                                'Read less ›',
                                style: TextStyle(color: Colors.amberAccent),
                              ),
                            ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.favorite,
                                  color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('1.1K',
                                  style: TextStyle(color: Colors.white70)),
                              SizedBox(width: 16),
                              Icon(Icons.chat_bubble_outline,
                                  color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('0.6K',
                                  style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    // Poster image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/login.png', // Ensure you have this in your assets and listed in pubspec.yaml
                        width: 110,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
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
