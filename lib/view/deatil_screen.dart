import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/data/model/movie_model.dart';
import 'package:cinmaapp/view/reservation_screen.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:cinmaapp/widgets/detailes/cat_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class DetailesScreen extends StatelessWidget {
  final Movie movie;
  const DetailesScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 20.h,
          ),
        ),
        title: Text(
          'Movie Detail',
          style: font.copyWith(fontSize: 16.sp, color: white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: s.setHeight(20)),
            SizedBox(
              height: s.setHeight(270),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: movie.title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: CachedNetworkImage(
                        key: UniqueKey(),
                        height: s.setHeight(300),
                        width: s.setWidth(210),
                        imageUrl: movie.poster,
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        progressIndicatorBuilder: (context, url, progress) {
                          return Center(
                              child: CircularProgressIndicator(
                            value: progress.progress,
                          ));
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CategoryItem(
                        icon: Icons.videocam_rounded,
                        category: 'Genre',
                        categoryValue: movie.genre,
                      ),
                      SizedBox(
                        height: s.setHeight(15),
                      ),
                      CategoryItem(
                        icon: Icons.access_time_filled,
                        category: 'Duration',
                        categoryValue:
                            formatTime(Duration(minutes: movie.duration)),
                      ),
                      SizedBox(
                        height: s.setHeight(15),
                      ),
                      CategoryItem(
                        icon: Icons.videocam_rounded,
                        category: 'Rating',
                        categoryValue: '${movie.rating} / 10',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.setHeight(15),
            ),
            Text(
              movie.title,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            SizedBox(
              height: s.setHeight(10),
            ),
            Text(
              "Synopis",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [white, white.withOpacity(0.1)],
                  stops: const [0.3, 1.0],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ).createShader(Rect.fromLTRB(0, 0, 0, bounds.height));
              },
              child: Text(
                movie.synopsis,
                maxLines: 8,
                style: font.copyWith(color: white, height: 2, fontSize: 12),
              ),
            ),
            SizedBox(
              height: s.setHeight(30),
            ),
           
            InkWell(
              onTap: () {
                Get.offAll(()=> const Reservationcreen());
              },
              child: Container(
                height: s.setHeight(50),
                width: s.setHeight(300),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("Get Reservation"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
