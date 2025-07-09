// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:movie_review/common/utils.dart';
// import 'package:movie_review/models/top_rated.dart';
// import 'package:movie_review/models/upcoming_movies.dart';
//
// class MovieCardTop extends StatefulWidget {
//   final Future<TopRated> future;
//   final bool isDate;
//   final bool isRating;
//   const MovieCardTop(
//       {super.key,
//         this.isDate = false,
//         this.isRating = false,
//         required this.future});
//
//   @override
//   State<MovieCardTop> createState() => _MovieCardTopState();
// }
//
// class _MovieCardTopState extends State<MovieCardTop> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: widget.future,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             var data = snapshot.data?.results;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                     child: ListView.builder(
//                         itemCount: data?.length,
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               // margin:
//                               // const EdgeInsets.only(right: 10.0, top: 10),
//                               width: 130, // 👈 Give it a fixed width
//                               height: 200, // 👈 Give it a fixed height
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(4),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(20),
//                                       child: Image.network(
//                                         "$imageUrl${data?[index].posterPath}",
//                                         errorBuilder:
//                                             (context, error, stackTrace) {
//                                           return const Text(
//                                               'Error loading image');
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 4.0),
//                                     child: Text(
//                                       "${data?[index].}",
//                                       style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w300,
//                                           fontSize: 17,
//                                           color: Colors.white),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   if (widget.isDate)
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 4.0),
//                                       child: Text(
//                                         "${DateFormat.yMMMMd().format(data![index].releaseDate)}",
//                                         style: GoogleFonts.poppins(
//                                             fontWeight: FontWeight.w300,
//                                             fontSize: 15,
//                                             color: Colors.white),
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                   if (widget.isRating)
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 4.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Color(0xffFFB703),
//                                             size: 16,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             "${(data![index].voteAverage).toString().contains('.') ? (data[index].voteAverage).toString().split('.').first + '.' + (data[index].voteAverage).toString().split('.')[1].substring(0, 1) : (data[index].voteAverage).toString()}",
//                                             style: GoogleFonts.poppins(
//                                                 fontWeight: FontWeight.w300,
//                                                 fontSize: 15,
//                                                 color: Colors.white),
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }))
//               ],
//             );
//           } else {
//             return const SizedBox.shrink();
//           }
//         }
//       // child:
//     );
//   }
// }
