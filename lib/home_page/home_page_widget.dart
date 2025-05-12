import 'dart:developer';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //late HomePageModel _model; // Removed HomePageModel - not used and can cause issues
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<BookingItemModel> bookings = [];
  bool isLoading = true; // Add loading state
  String errorMessage = ''; // Add error handling
  final CalendarController _calendarController =
      CalendarController(); // Changed to private
  final ValueNotifier<bool> _showMorningEveningNotifier =
      ValueNotifier(true); // Changed to private

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => HomePageModel()); // Removed - not needed
    loadBookings();
  }

  Future<void> loadBookings() async {
    isLoading =
        true; // Set loading to true *before* starting the async operation
    errorMessage = ''; // Clear any previous error
    if (mounted) {
      //check if the widget is mounted before calling setState
      setState(() {}); // Trigger a rebuild to show the loading indicator
    }
    try {
      final res = await http.get(
        Uri.parse(
            'https://quickwashsthlm.se/wp-json/salon/api/mobile/v1/bookings/'),
        headers: {
          'Access-Token': "7d0c02f2e47a8e75e21696eaae5675e8fb7811d3",
        },
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['items'] as List;
        bookings = data.map((d) => BookingItemModel.fromMap(d)).toList();
      } else {
        if (mounted) {
          setState(() {
            errorMessage = 'Failed to load bookings: ${res.statusCode}';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = 'Error fetching data: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    //_model.dispose(); // Removed - disposed automatically.
    _calendarController.dispose(); // Added dispose
    _showMorningEveningNotifier.dispose(); // Added dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        title: Text(
          'Bookings Calendar',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.interTight(),
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    }
    return ValueListenableBuilder<bool>(
      valueListenable: _showMorningEveningNotifier,
      builder: (context, value, child) {
        if (!value) {
          return SfCalendar(
            controller: _calendarController,
            view: CalendarView.week,
            dataSource: BookingDataSource(bookings),
            initialDisplayDate: DateTime.now(),
            onViewChanged: (ViewChangedDetails viewChangedDetails) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                log('View Changed');
                if (_calendarController.view == CalendarView.week ||
                    _calendarController.view == CalendarView.day) {
                  if (_showMorningEveningNotifier.value == false) {
                    _showMorningEveningNotifier.value = true;
                  }

                  log('Week View');
                } else if (_calendarController.view == CalendarView.schedule ||
                    _calendarController.view == CalendarView.month) {
                  if (_showMorningEveningNotifier.value == true) {
                    _showMorningEveningNotifier.value = false;
                  }
                  log('Schedule and Month View');
                }
              });
            },
            allowViewNavigation: true,
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.schedule,
            ],
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 7,
              endHour: 12,
              timeRulerSize: 0,
            ),
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
            ),
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.appointment) {
                if (details.appointments != null &&
                    details.appointments!.isNotEmpty) {
                  final BookingItemModel tappedBooking =
                      details.appointments!.first as BookingItemModel;

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                            '${tappedBooking.customer_first_name} ${tappedBooking.customer_last_name}'),
                        content: Text(
                            'ID: ${tappedBooking.id}\nDate: ${tappedBooking.date.toLocal().toString().split(' ')[0]}\nTime: ${DateFormat.Hm(DateTime(tappedBooking.date.year, tappedBooking.date.month, tappedBooking.date.day, tappedBooking.time.hour, tappedBooking.time.minute))}'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
          );
        }
        return Column(
          children: [
            // Divider(
            //   color: Colors.black,
            // ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Morning',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: SfCalendar(
                      controller: _calendarController,
                      view: CalendarView.week,
                      dataSource: BookingDataSource(bookings),
                      initialDisplayDate: DateTime.now(),
                      viewHeaderStyle: ViewHeaderStyle(),
                      onViewChanged: (ViewChangedDetails viewChangedDetails) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          log('View Changed');
                          if (_calendarController.view == CalendarView.week ||
                              _calendarController.view == CalendarView.day) {
                            if (_showMorningEveningNotifier.value == false) {
                              _showMorningEveningNotifier.value = true;
                            }

                            log('Week View');
                          } else if (_calendarController.view ==
                              CalendarView.schedule) {
                            if (_showMorningEveningNotifier.value == true) {
                              _showMorningEveningNotifier.value = false;
                            }
                            log('Schedule and Month View');
                          }
                        });
                      },
                      allowedViews: const [
                        CalendarView.day,
                        CalendarView.week,
                        CalendarView.schedule,
                      ],
                      // cellBorderColor: Colors.transparent,
                      timeSlotViewSettings: const TimeSlotViewSettings(
                        startHour: 7,
                        endHour: 12,
                        timeRulerSize: 0,
                      ),
                      monthViewSettings: const MonthViewSettings(
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment,
                        showAgenda: true,
                      ),
                      onTap: (CalendarTapDetails details) {
                        if (details.targetElement ==
                            CalendarElement.appointment) {
                          if (details.appointments != null &&
                              details.appointments!.isNotEmpty) {
                            final BookingItemModel tappedBooking =
                                details.appointments!.first as BookingItemModel;

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      '${tappedBooking.customer_first_name} ${tappedBooking.customer_last_name}'),
                                  content: Text(
                                      'ID: ${tappedBooking.id}\nDate: ${tappedBooking.date.toLocal().toString().split(' ')[0]}\nTime: ${DateFormat.Hm(DateTime(tappedBooking.date.year, tappedBooking.date.month, tappedBooking.date.day, tappedBooking.time.hour, tappedBooking.time.minute))}'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Evening',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: SfCalendar(
                      controller: _calendarController,
                      view: CalendarView.week,
                      // cellBorderColor: Colors.transparent,
                      dataSource: BookingDataSource(bookings),
                      initialDisplayDate: DateTime.now(),
                      viewHeaderStyle: const ViewHeaderStyle(),
                      headerHeight: 0,
                      viewHeaderHeight: 0,
                      timeSlotViewSettings: const TimeSlotViewSettings(
                        startHour: 15,
                        endHour: 22,
                        timeRulerSize: 0,
                      ),
                      monthViewSettings: const MonthViewSettings(
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment,
                        showAgenda: true,
                      ),
                      onTap: (CalendarTapDetails details) {
                        if (details.targetElement ==
                            CalendarElement.appointment) {
                          if (details.appointments != null &&
                              details.appointments!.isNotEmpty) {
                            final BookingItemModel tappedBooking =
                                details.appointments!.first as BookingItemModel;
                            print('Tapped on booking ID: ${tappedBooking.id}');
                            print(
                                'Customer: ${tappedBooking.customer_first_name} ${tappedBooking.customer_last_name}');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      '${tappedBooking.customer_first_name} ${tappedBooking.customer_last_name}'),
                                  content: Text(
                                      'ID: ${tappedBooking.id}\nDate: ${tappedBooking.date.toLocal().toString().split(' ')[0]}\nTime: ${DateFormat.Hm(DateTime(tappedBooking.date.year, tappedBooking.date.month, tappedBooking.date.day, tappedBooking.time.hour, tappedBooking.time.minute))}'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

class BookingItemModel {
  final int id;
  final DateTime date;
  final TimeOfDay time;
  final String customer_first_name;
  final String customer_last_name;

  BookingItemModel({
    required this.id,
    required this.date,
    required this.time,
    required this.customer_first_name,
    required this.customer_last_name,
  });

  factory BookingItemModel.fromMap(Map<String, dynamic> map) {
    // Parse the date string into a DateTime object.
    final String dateString = map['date'];
    final List<String> dateParts = dateString.split('-');
    final int year = int.parse(dateParts[0]);
    final int month = int.parse(dateParts[1]);
    final int day = int.parse(dateParts[2]);
    final DateTime parsedDate = DateTime(year, month, day);

    // Parse the time string into a TimeOfDay object.
    final String timeString = map['time'];
    final List<String> timeParts = timeString.split(':');
    final int hour = int.parse(timeParts[0]);
    final int minute = int.parse(timeParts[1]);
    final TimeOfDay parsedTime = TimeOfDay(hour: hour, minute: minute);

    return BookingItemModel(
      id: map['id'] as int,
      date: parsedDate,
      time: parsedTime,
      customer_first_name: map['customer_first_name'] as String,
      customer_last_name: map['customer_last_name'] as String,
    );
  }
}

class BookingDataSource extends CalendarDataSource<BookingItemModel> {
  BookingDataSource(List<BookingItemModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    final BookingItemModel booking = appointments![index] as BookingItemModel;
    return DateTime(
      booking.date.year,
      booking.date.month,
      booking.date.day,
      booking.time.hour,
      booking.time.minute,
    );
  }

  @override
  DateTime getEndTime(int index) {
    final BookingItemModel booking = appointments![index] as BookingItemModel;
    final DateTime startTime = DateTime(
      booking.date.year,
      booking.date.month,
      booking.date.day,
      booking.time.hour,
      booking.time.minute,
    );
    return startTime.add(const Duration(hours: 1));
  }

  @override
  String getSubject(int index) {
    final BookingItemModel booking = appointments![index] as BookingItemModel;
    return '${booking.customer_first_name} ${booking.customer_last_name}';
  }

  @override
  Object? getId(int index) {
    return (appointments![index] as BookingItemModel).id;
  }

  @override
  Color getColor(int index) {
    return const Color(0xFF4B39EF);
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}

class DateFormat {
  static String Hm(DateTime date) =>
      '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}
