import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/common/utils.dart';
import 'package:movie_review/models/cast.dart';

class CastSection extends StatefulWidget {
  final List<Cast> castList;
  final List<Cast> crewList;

  const CastSection({
    super.key,
    required this.castList,
    required this.crewList,
  });

  @override
  State<CastSection> createState() => _CastSectionState();
}

class _CastSectionState extends State<CastSection> {
  bool isCastSelected = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab bar
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xff003247),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                // Cast tab
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCastSelected = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isCastSelected
                            ? const Color(0xffFFB703)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Center(
                        child: Text(
                          "Casts",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isCastSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Crew tab
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCastSelected = false;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: !isCastSelected
                            ? const Color(0xffFFB703)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Center(
                        child: Text(
                          "Crews",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:
                                !isCastSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Cast/Crew list
          SizedBox(
            height: 140, // Increased height to accommodate job text
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isCastSelected
                  ? (widget.castList.length > 10 ? 10 : widget.castList.length)
                  : (widget.crewList.length > 10 ? 10 : widget.crewList.length),
              itemBuilder: (context, index) {
                final person = isCastSelected
                    ? widget.castList[index]
                    : widget.crewList[index];

                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xffFFB703),
                            width: 1,
                          ),
                        ),
                        child: ClipOval(
                          child: person.profilePath != null
                              ? Image.network(
                                  "$imageUrl${person.profilePath}",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[800],
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: Colors.grey[800],
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        person.name,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Show job for crew members or character for cast
                      if (!isCastSelected && person.job != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            person.job!,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffFFB703),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      if (isCastSelected && person.character != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            person.character!,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400],
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
