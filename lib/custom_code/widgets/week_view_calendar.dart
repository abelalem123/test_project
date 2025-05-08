// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

extension BookingCalendarExtension on BookingItemStruct {
  DateTime get startTime {
    final normalizedStart = _normalizeTime(services.first.startAt);
    return DateTime.parse("${date}T$normalizedStart");
  }

  DateTime get endTime {
    final normalizedEnd = _normalizeTime(services.first.endAt);
    return DateTime.parse("${date}T$normalizedEnd");
  }

  String get displayTitle => '$customerFirstName $customerLastName';

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'sln-b-completed':
        return Colors.green;
      case 'sln-b-pending':
        return Colors.orange;
      case 'sln-b-cancelled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  String get customerPhoneFormatted =>
      '$customerPhoneCountryCode $customerPhone';

  String get totalFormatted => '$currency$amount';

  String get netFormatted => '$currency${amount - deposit}';

  /// Normalizes time strings (e.g. `10:00` → `10:00:00`)
  String _normalizeTime(String? time) {
    if (time == null || time.isEmpty) return '00:00:00';
    if (RegExp(r'^\d{2}:\d{2}$').hasMatch(time)) {
      return '$time:00';
    }
    return time;
  }
}

extension IterableGroupBy<T> on Iterable<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final map = <K, List<T>>{};
    for (var element in this) {
      final key = keyFunction(element);
      map.putIfAbsent(key, () => []).add(element);
    }
    return map;
  }
}

class WeekViewCalendar extends StatefulWidget {
  const WeekViewCalendar(
      {Key? key,
      this.width,
      this.height,
      required this.authtoken,
      this.serverurl})
      : super(key: key);

  final double? width;
  final double? height;
  final String? authtoken;
  final String? serverurl;

  @override
  State<WeekViewCalendar> createState() => _WeekViewCalendarState();
}

class _WeekViewCalendarState extends State<WeekViewCalendar> {
  CalendarViewMode _viewMode = CalendarViewMode.Weekly;
  late ScrollController _verticalScrollController;

  DateTime _currentDate = DateTime.now();
  final double hourHeight = 80.0;
  int startHour = 1;
  final int endHour = 24;
  bool _is24HourFormat = true;
  int? _pinnedHour;
  List<BookingItemStruct> bookingItems = [];
  List<int> _reorderedHours() {
    final hours = List.generate(endHour - startHour + 1, (i) => startHour + i);
    if (_pinnedHour != null) {
      final beforePin = hours.where((h) => h < _pinnedHour!).toList();
      final afterPin = hours.where((h) => h >= _pinnedHour!).toList();
      return [...afterPin, ...beforePin];
    }
    return hours;
  }

  void _scrollToInitialHour() {
    final now = DateTime.now();
    final hour = _pinnedHour ?? now.hour;
    final offset =
        ((hour - startHour).clamp(0, endHour - startHour)) * hourHeight;
    _verticalScrollController.jumpTo(offset.toDouble());
  }

  double _calculateCurrentTimeTopOffset() {
    final now = DateTime.now();
    final hourOffset = _reorderedHours().indexOf(now.hour);
    if (hourOffset == -1) return 0;

    final offset = hourOffset * hourHeight + (now.minute / 60.0) * hourHeight;
    return offset;
  }

  List<Map<String, dynamic>> staffList = [];
  List<int> selectedStaffIds = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToInitialHour();
    });

    _verticalScrollController = ScrollController();
    _fetchBookings();
    _fetchStaff();
  }

  void _refreshCalendar() {
    setState(() {
      selectedStaffIds.clear(); // clear filters
      _currentDate = DateTime.now(); // reset to today (optional)
    });

    _fetchStaff();
    _fetchBookings();
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  void _fetchBookings() async {
    final formatter = DateFormat('yyyy-MM-dd');
    late DateTime viewStart;
    late DateTime viewEnd;

    switch (_viewMode) {
      case CalendarViewMode.Weekly:
        viewStart =
            _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
        viewEnd = viewStart.add(Duration(days: 6));
        break;
      case CalendarViewMode.Daily:
        viewStart = _currentDate;
        viewEnd = _currentDate;
        break;
      case CalendarViewMode.FourDay:
        viewStart = _currentDate;
        viewEnd = _currentDate.add(Duration(days: 3));
        break;
    }

    final startDate = formatter.format(viewStart);
    final endDate = formatter.format(viewEnd);

    final url =
        Uri.parse('https://bokningsminuten-410ae.ey.r.appspot.com/bookings/');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start_date": startDate,
          "end_date": endDate,
          "authToken": widget.authtoken,
          "serverurl": widget.serverurl, // pass this from your widget or config
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> rawItems = data['items'];
        setState(() {
          bookingItems = rawItems.map((item) {
            return BookingItemStruct(
              id: item['id'] ?? '',
              date: item['date'] ?? '',
              time: item['time'] ?? '',
              status: item['status'] ?? '',
              customerFirstName: item['customer_first_name'] ?? '',
              customerLastName: item['customer_last_name'] ?? '',
              customerPhone: item['customer_phone'] ?? '',
              customerPhoneCountryCode:
                  item['customer_phone_country_code'] ?? '',
              currency: item['currency'] ?? '',
              amount: item['amount'] ?? '',
              deposit: item['deposit'] ?? '',
              note: item['note'] ?? '',
              services: List<ServiceStruct>.from(
                  item['services'].map((s) => ServiceStruct(
                        startAt: s['start_at'] ?? '',
                        endAt: s['end_at'] ?? '',
                        serviceId: s['service_id'],
                        assistantId: s['assistant_id'],
                        assistantName: s['assistant_name'],
                      ))),
            );
          }).toList();
        });
      }
    } catch (e) {
      print('API error: $e');
    }
  }

  void _fetchStaff() async {
    final authtoken = widget.authtoken;
    final url =
        Uri.parse('https://bokningsminuten-410ae.ey.r.appspot.com/assistants');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "authToken": widget.authtoken,
          "serverurl": widget.serverurl, // pass this from your widget or config
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          staffList = List<Map<String, dynamic>>.from(data['items']);
        });
      } else {
        print('Failed to load staff: ${response.body}');
      }
    } catch (e) {
      print('Staff API error: $e');
    }
  }

  void _changeDate(DateTime date) {
    setState(() {
      _currentDate = date;
    });
    _fetchBookings();
  }

  void _showStaffFilterDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("Filter by Staff"),
          content: SizedBox(
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (context, setDialogState) {
                return ListView(
                  shrinkWrap: true,
                  children: staffList.map((staff) {
                    final staffId = staff['id'];
                    final isSelected = selectedStaffIds.contains(staffId);

                    return CheckboxListTile(
                      title: Text(staff['name']),
                      value: isSelected,
                      onChanged: (bool? checked) {
                        setState(() {
                          if (checked == true) {
                            selectedStaffIds.add(staffId);
                          } else {
                            selectedStaffIds.remove(staffId);
                          }
                        });
                        setDialogState(() {}); // 👈 Triggers visual update
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => selectedStaffIds.clear());
                Navigator.of(ctx).pop();
              },
              child: Text("Clear"),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }

  void _changeView(CalendarViewMode mode) {
    setState(() {
      _viewMode = mode;
    });
    _fetchBookings();
  }

  DateTime get _weekStartDate =>
      _currentDate.subtract(Duration(days: _currentDate.weekday - 1));

  Widget _buildDateNavigationBar() {
    String formattedDate;

    switch (_viewMode) {
      case CalendarViewMode.Weekly:
        final start = _weekStartDate;
        final end = start.add(Duration(days: 6));
        formattedDate =
            "${DateFormat('dd MMM').format(start)} - ${DateFormat('dd MMM yyyy').format(end)}";
        break;

      case CalendarViewMode.Daily:
        formattedDate = DateFormat('dd MMMM yyyy').format(_currentDate);
        break;
      case CalendarViewMode.FourDay:
        final end = _currentDate.add(Duration(days: 3));
        formattedDate =
            "${DateFormat('dd MMM').format(_currentDate)} - ${DateFormat('dd MMM yyyy').format(end)}";
        break;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        final controls = [
          ElevatedButton(
            onPressed: () => _changeDate(DateTime.now()),
            child: Text("Today"),
          ),
          ElevatedButton.icon(
            onPressed: _refreshCalendar, // 👈 New function we'll create
            icon: Icon(Icons.refresh),
            label: Text('Refresh'),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<CalendarViewMode>(
              value: _viewMode,
              icon: Icon(Icons.view_agenda),
              items: CalendarViewMode.values.map((mode) {
                return DropdownMenuItem(
                  value: mode,
                  child: Text(mode.name),
                );
              }).toList(),
              onChanged: (mode) {
                if (mode != null) _changeView(mode);
              },
            ),
          ),
          /* DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              hint: Text("Select staff"),
              value: null,
              items: staffList.map((staff) {
                final isSelected = selectedStaffIds.contains(staff['id']);
                return DropdownMenuItem<int>(
                  value: staff['id'],
                  child: Container(height: 500,width: 300,
                    child: StatefulBuilder(
                      builder: (context, setInnerState) => CheckboxListTile(
                        value: isSelected,
                        title: Text(staff['name']),
                        onChanged: (bool? selected) {
                          setState(() {
                            if (selected == true) {
                              selectedStaffIds.add(staff['id']);
                            } else {
                              selectedStaffIds.remove(staff['id']);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (_) {}, // do nothing on base change
              isExpanded: false,
              icon: Icon(Icons.people),
            ),
          ),*/

          Container(
            constraints: BoxConstraints(maxWidth: 120),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('24'),
              value: _is24HourFormat,
              onChanged: (value) {
                setState(() {
                  _is24HourFormat = value;
                });
              },
            ),
          ),
          Text(
            formattedDate,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          InkWell(
              child: Icon(Icons.filter_list, color: Colors.black),
              onTap: _showStaffFilterDialog),
        ];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isMobile
                  ? Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      children: controls,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controls,
                    ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  DateTime _navigateDate(int direction) {
    switch (_viewMode) {
      case CalendarViewMode.Weekly:
        return _currentDate.add(Duration(days: 7 * direction));
      case CalendarViewMode.Daily:
        return _currentDate.add(Duration(days: direction));

      case CalendarViewMode.FourDay:
        return _currentDate.add(Duration(days: 4 * direction));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Column(
        children: [
          _buildDateNavigationBar(),
          Expanded(child: _buildView(_viewMode)),
        ],
      ),
    ));
  }

  Widget _buildView(CalendarViewMode mode) {
    switch (mode) {
      case CalendarViewMode.Weekly:
        return _buildCalendarGrid(7);
      case CalendarViewMode.FourDay:
        return _buildCalendarGrid(4);
      case CalendarViewMode.Daily:
        return _buildDailyStaffView();

      default:
        return Center(child: Text('View not implemented'));
    }
  }

  Widget _buildCalendarGrid(int dayCount) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 65; // Time column
    final columnWidth = availableWidth / dayCount;

    final startDate =
        (_viewMode == CalendarViewMode.Weekly) ? _weekStartDate : _currentDate;

    final days =
        List.generate(dayCount, (i) => startDate.add(Duration(days: i)));
    return Column(
      children: [
        // Sticky Header Row
        Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () => _changeDate(_navigateDate(-1)),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () => _changeDate(_navigateDate(1)),
                ),
              ],
            ),
            ...List.generate(dayCount, (index) {
              return Container(
                width: columnWidth - 5,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEE').format(days[index]),
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: DateTime.now().day == days[index].day &&
                                DateTime.now().month == days[index].month &&
                                DateTime.now().year == days[index].year
                            ? Colors.purple
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.purple,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 9),
                      child: Text(
                        DateFormat('dd').format(days[index]),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: DateTime.now().day == days[index].day &&
                                  DateTime.now().month == days[index].month &&
                                  DateTime.now().year == days[index].year
                              ? Colors.white
                              : Colors.purple,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),

        // Body
        Expanded(
          child: Row(
            children: [
              SingleChildScrollView(
                controller: _verticalScrollController, // 🔗 same controller
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: _reorderedHours().map((hour) {
                            final isPinned = hour == _pinnedHour;
                            final formattedTime = _is24HourFormat
                                ? '${hour.toString().padLeft(2, '0')}:00'
                                : TimeOfDay(hour: hour, minute: 0)
                                    .format(context);

                            return GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  _pinnedHour = hour;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Pinned $formattedTime'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                height: hourHeight,
                                alignment: Alignment.center,
                                width: 65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(formattedTime,
                                        style: TextStyle(fontSize: 12)),
                                    if (isPinned)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Icon(Icons.push_pin,
                                            size: 14, color: Colors.red),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: List.generate(dayCount, (dayIndex) {
                            return SizedBox(
                              width: columnWidth,
                              child: Column(
                                children: _reorderedHours().map((_) {
                                  return Container(
                                    height: hourHeight,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: Colors.grey.shade200),
                                        right: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
// Blue horizontal line for current time
/*
                    // Events
                    ...bookingItems
                        /* final index = event.startTime.difference(startDate).inDays;
                      if (index < 0 || index >= dayCount) return SizedBox.shrink();

                      final hourOffset = _reorderedHours().indexOf(event.startTime.hour);
                      if (hourOffset == -1) return SizedBox.shrink();

                      final top = hourOffset * hourHeight +
                          (event.startTime.minute / 60.0) * hourHeight;
                      final height = (event.endTime.difference(event.startTime).inMinutes / 60) * hourHeight;
                      final left = columnWidth * index;*/
                        .where((event) {
                      // ✅ Show all if no staff selected
                      if (selectedStaffIds.isEmpty) return true;

                      // ✅ Only include bookings where any service has a matching assistant ID
                      return event.services != null &&
                          event.services!.any((service) =>
                              service.assistantId != null &&
                              selectedStaffIds.contains(service.assistantId));
                    }).map((event) {
                      final index =
                          event.startTime.difference(startDate).inDays;

                      // 🧹 Skip if event is not in visible date range
                      if (index < 0 || index >= dayCount)
                        return SizedBox.shrink();

                      final hourOffset =
                          _reorderedHours().indexOf(event.startTime.hour);
                      if (hourOffset == -1) return SizedBox.shrink();

                      // 🎯 Positioning logic
                      final top = hourOffset * hourHeight +
                          (event.startTime.minute / 60.0) * hourHeight;
                      final height =
                          (event.endTime.difference(event.startTime).inMinutes /
                                  60.0) *
                              hourHeight;
                      final left = columnWidth * index;

                      return Positioned(
                        top: top,
                        left: left + 60,
                        width: columnWidth,
                        height: height,
                        child: GestureDetector(
                          onTap: () => _showEventDialog(context, event),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: event.statusColor.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Text(
                                event.displayTitle,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    if (_currentDate.year == DateTime.now().year &&
                        _currentDate.month == DateTime.now().month &&
                        _currentDate.day == DateTime.now().day) ...[
                      Positioned(
                        top: _calculateCurrentTimeTopOffset(),
                        left: 65,
                        right: 0,
                        child: Container(
                          height: 2,
                          color: Colors.purple,
                        ),
                      ),*/

                    ...bookingItems
                        .where((event) {
                          if (selectedStaffIds.isEmpty) return true;
                          return event.services != null &&
                              event.services!.any((service) =>
                                  service.assistantId != null &&
                                  selectedStaffIds
                                      .contains(service.assistantId));
                        })
                        .toList()
                        .groupBy((event) =>
                            "${event.startTime}-${event.startTime.hour}-${event.startTime.day}")
                        .entries
                        .expand((groupedEntry) {
                          final overlappingEvents = groupedEntry.value;
                          final count = overlappingEvents.length;

                          return overlappingEvents.asMap().entries.map((entry) {
                            final event = entry.value;
                            final positionInGroup = entry.key;

                            final index =
                                event.startTime.difference(startDate).inDays;
                            if (index < 0 || index >= dayCount)
                              return SizedBox.shrink();

                            final hourOffset =
                                _reorderedHours().indexOf(event.startTime.hour);
                            if (hourOffset == -1) return SizedBox.shrink();

                            final top = hourOffset * hourHeight +
                                (event.startTime.minute / 60.0) * hourHeight;
                            final height = (event.endTime
                                        .difference(event.startTime)
                                        .inMinutes /
                                    60.0) *
                                hourHeight;

                            final fullColumnLeft = columnWidth * index + 60;
                            final eventWidth = columnWidth / count;
                            final eventLeft =
                                fullColumnLeft + (positionInGroup * eventWidth);

                            return Positioned(
                              top: top,
                              left: eventLeft,
                              width: eventWidth,
                              height: height,
                              child: GestureDetector(
                                onTap: () => _showEventDialog(context, event),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          event.statusColor.withOpacity(0.85),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Text(
                                      event.displayTitle,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                        })
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailyStaffView() {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 65; // Reserve 65 for hours column
    final staffColumns = staffList;
    final columnWidth = staffColumns.isNotEmpty
        ? availableWidth / staffColumns.length
        : availableWidth;

    return Column(
      children: [
        // Staff Header Row with Horizontal Scroll
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(width: 65), // Empty space for time column
              ...staffColumns.map((staff) {
                return Container(
                  width: columnWidth,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Text(
                    staff['name'] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
        // Body
        Expanded(
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Row(
                    children: [
                      // Time Column
                      Column(
                        children: _reorderedHours().map((hour) {
                          final formattedTime = _is24HourFormat
                              ? '${hour.toString().padLeft(2, '0')}:00'
                              : TimeOfDay(hour: hour, minute: 0)
                                  .format(context);
                          return Container(
                            height: hourHeight,
                            width: 65,
                            alignment: Alignment.center,
                            child: Text(formattedTime,
                                style: TextStyle(fontSize: 12)),
                          );
                        }).toList(),
                      ),
                      // Staff Columns
                      Row(
                        children: staffColumns.map((staff) {
                          return SizedBox(
                            width: columnWidth,
                            child: Column(
                              children: _reorderedHours().map((_) {
                                return Container(
                                  height: hourHeight,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade200),
                                      right: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  // Bookings
                  ...bookingItems.where((event) {
                    return event.date ==
                        DateFormat('yyyy-MM-dd').format(_currentDate);
                  }).map((event) {
                    final assistantId = event.services!.isNotEmpty
                        ? event.services!.first.assistantId
                        : null;
                    final staffIndex = staffColumns
                        .indexWhere((staff) => staff['id'] == assistantId);

                    if (staffIndex == -1) return SizedBox.shrink();

                    final hourOffset =
                        _reorderedHours().indexOf(event.startTime.hour);
                    if (hourOffset == -1) return SizedBox.shrink();

                    final top = hourOffset * hourHeight +
                        (event.startTime.minute / 60.0) * hourHeight;
                    final height =
                        (event.endTime.difference(event.startTime).inMinutes /
                                60.0) *
                            hourHeight;
                    final left = 65 + (staffIndex * columnWidth);

                    return Positioned(
                      top: top,
                      left: left,
                      width: columnWidth,
                      height: height,
                      child: GestureDetector(
                        onTap: () => _showEventDialog(context, event),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: event.statusColor.withOpacity(0.85),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.all(6),
                            child: Text(
                              event.displayTitle,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  // Current Time Indicator
                  if (_currentDate.year == DateTime.now().year &&
                      _currentDate.month == DateTime.now().month &&
                      _currentDate.day == DateTime.now().day) ...[
                    Positioned(
                      top: _calculateCurrentTimeTopOffset(),
                      left: 65,
                      right: 0,
                      child: Container(
                        height: 2,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showEventDialog(BuildContext context, BookingItemStruct event) {
    final start = event.startTime;
    final end = event.endTime;

    // Find assistant name (first service assistant)
    final String assistantName = event.services!.isNotEmpty
        ? (event.services!.first.assistantName ?? 'Unknown Assistant')
        : 'No Assistant';
    final status;
    // Optionally modify assistant name based on booking status
    String assistantDisplayName = assistantName;
    switch (event.status.toLowerCase()) {
      case 'sln-b-completed':
        status = 'Completed';
        break;
      case 'sln-b-pending':
        status = 'Pending';
        break;
      case 'sln-b-cancelled':
        status = 'Cancelled';
        break;
      default:
        status = 'no status';
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(event.shop?.title ?? ''),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("⏱ ${DateFormat('EEEE, dd MMM yyyy').format(start)}"),
            Text(
                "🕒 ${DateFormat.jm().format(start)} - ${DateFormat.jm().format(end)}"),
            const SizedBox(height: 10),
            Text("👤 Customer: ${event.displayTitle}"),
            Text("📞 Phone: ${event.customerPhoneFormatted}"),
            const Divider(),
            if (event.services!.isNotEmpty)
              Text("💇 Services: ${event.services!.length}"),
            Text(
                "🧑‍💼 Assistant: $assistantDisplayName"), // <-- showing assistant name
            if (event.note!.isNotEmpty) Text("📝 Note: ${event.note}"),
            Text("📌 Status: ${event.status}"),
            const SizedBox(height: 10),
            Text("💰 Total: ${event.totalFormatted}"),
            Text("💸 Deposit: ${event.currency}${event.deposit}"),
            Text("💵 Net Payable: ${event.netFormatted}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
/*
  void _showEventDialog(BuildContext context, BookingItemStruct event) {
    final start = event.startTime;
    final end = event.endTime;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(event.shop!.title ?? ''),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("⏱ ${DateFormat('EEEE, dd MMM yyyy').format(start)}"),
            Text(
                "🕒 ${DateFormat.jm().format(start)} - ${DateFormat.jm().format(end)}"),
            const SizedBox(height: 10),
            Text("👤 ${event.displayTitle}"),
            Text("📞 ${event.customerPhoneFormatted}"),
            const Divider(),
            if (event.services!.isNotEmpty)
              Text("💇 Tjänster: ${event.services!.length ?? ''}"),
            if (event.note!.isNotEmpty) Text("📝 Anteckning: ${event.note}"),
            Text("📌 Status: ${event.status}"),
            const SizedBox(height: 10),
            Text("💰 Total: ${event.totalFormatted}"),
            Text("💸 Deposition: ${event.currency}${event.deposit}"),
            Text("💵 Att betala: ${event.netFormatted}"),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Stäng')),
        ],
      ),
    );
  }*/
}
