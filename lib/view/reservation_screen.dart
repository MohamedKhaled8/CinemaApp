import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/data/model/seats_model.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cinmaapp/widgets/reservation/seat_status.dart';


class Reservationcreen extends StatefulWidget {
  const Reservationcreen({super.key});

  @override
  State<Reservationcreen> createState() => _ReservationcreenState();
}

class _ReservationcreenState extends State<Reservationcreen> {
  final items = List<DateTime>.generate(15, (index) {
    return DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(Duration(days: index));
  });
  DateTime selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:  Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 20.h,
          ),
        ),
        title: Text(
          'Select Seats',
          style: font.copyWith(fontSize: 14.sp, color: white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
           SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 60.h,
              child: Stack(
                children: [
                  Positioned(
                    top: -5,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ClipPath(
                      clipper: Clip2(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [orange.withOpacity(0.3), transparent],
                                stops: const [0.35, 1.0],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ClipPath(
                      clipper: Clip(),
                      child: Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        color: orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
           SizedBox(height: 10.h),
          Column(
            children: [
              ...List.generate(numRow.length, (colIndex) {
                int numCol =
                    colIndex == 0 || colIndex == numRow.length - 1 ? 6 : 8;
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: colIndex == numRow.length - 1 ? 0 : 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(numCol, (rowIndex) {
                        String seatNum = '${numRow[colIndex]}${rowIndex + 1}';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedSeats.contains(seatNum)) {
                                selectedSeats.remove(seatNum);
                              } else if (!reservedSeats.contains(seatNum)) {
                                selectedSeats.add(seatNum);
                              }
                            });
                          },
                          child: Container(
                            height: s.setHeight(25),
                            width: 30.w,
                            margin: EdgeInsets.only(
                                right: rowIndex == (numCol / 2) - 1 ? 30 : 10),
                            decoration: BoxDecoration(
                                color: reservedSeats.contains(seatNum)
                                    ? white
                                    : selectedSeats.contains(seatNum)
                                        ? orange
                                        : grey,
                                borderRadius: BorderRadius.circular(7.5)),
                          ),
                        );
                      })
                    ],
                  ),
                );
              })
            ],
          ),
           SizedBox(height: s.setHeight(25)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children:  [
              const SeatStatus(
                color: grey,
                status: 'Available',
              ),
              SizedBox(width: s.setWidth(10)),
              SeatStatus(
                color: orange,
                status: 'Selected',
              ),
              SizedBox(width: s.setWidth(10)),
              SeatStatus(
                color: white,
                status: 'Reserved',
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15).w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [black, grey],
                stops: [0.5, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Select Date and Time',
                  style: font.copyWith(
                      color: white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: s.setHeight(15)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          items.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTime = items[index];
                                  });
                                },
                                child: Container(
                                  margin: index == 0
                                      ? const EdgeInsets.only(
                                          left: 20, right: 20).r
                                      : const EdgeInsets.only(right: 20).r,
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 8),
                                  decoration: BoxDecoration(
                                      color: DateFormat('d/M/y')
                                                  .format(selectedTime) ==
                                              DateFormat('d/M/y')
                                                  .format(items[index])
                                          ? orange
                                          : grey,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat('MMM').format(items[index]),
                                        style: font.copyWith(
                                            fontSize: 14.sp, color: white),
                                      ),
                                       SizedBox(height: s.setHeight(5)),
                                      Container(
                                        padding: const EdgeInsets.all(8).r,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: DateFormat('d/M/y')
                                                        .format(selectedTime) ==
                                                    DateFormat('d/M/y')
                                                        .format(items[index])
                                                ? white
                                                : transparent),
                                        child: Text(
                                          DateFormat('dd').format(items[index]),
                                          style: font.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DateFormat('d/M/y').format(
                                                          selectedTime) ==
                                                      DateFormat('d/M/y')
                                                          .format(items[index])
                                                  ? black
                                                  : white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
                 SizedBox(height: s.setHeight(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          availableTime.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTime = DateTime.utc(
                                      selectedTime.year,
                                      selectedTime.month,
                                      selectedTime.day,
                                      int.parse(
                                          availableTime[index].split(':')[0]),
                                      int.parse(
                                          availableTime[index].split(':')[1]),
                                    );
                                  });
                                },
                                child: Container(
                                    margin: index == 0
                                        ? const EdgeInsets.only(
                                            left: 20, right: 20).r
                                        : const EdgeInsets.only(right: 20),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: grey,
                                        border: Border.all(
                                            width: 2,
                                            color: DateFormat('HH:mm')
                                                        .format(selectedTime)
                                                        .toString() ==
                                                    availableTime[index]
                                                ? orange
                                                : transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      availableTime[index],
                                      style: font.copyWith(
                                          fontSize: 14.sp, color: white),
                                    )),
                              )),
                    ],
                  ),
                ),
                selectedSeats.isNotEmpty
                    ? Column(
                        children: [
                           SizedBox(height: s.setHeight(10)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35).w,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: font.copyWith(
                                          color: white, fontSize: 12.sp),
                                    ),
                                     SizedBox(height: s.setHeight(10)),
                                    Text(
                                      '\$${(selectedSeats.length * 43.5).toStringAsFixed(2)}',
                                      style: font.copyWith(
                                          color: white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                 SizedBox(width: s.setWidth(55)),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: orange,
                                    height: s.setHeight(50),
                                    child: Center(
                                      child: Text(
                                        'Book Ticket',
                                        style: font.copyWith(
                                            color: black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, -20, size.width, size.height);
    path.lineTo(size.width, size.height - 5);
    path.quadraticBezierTo(size.width / 2, -25, 0, size.height - 5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Clip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 30);
    path.quadraticBezierTo(size.width / 2, -20, 0, size.height - 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
