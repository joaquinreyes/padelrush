import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/components/user_booking_card.dart';
import 'package:padelrush/components/user_lessons_events_card.dart';
import 'package:padelrush/components/user_open_match_card.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/models/user_bookings.dart';
import 'package:padelrush/repository/booking_repo.dart';
import 'package:padelrush/repository/user_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/screens/home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import 'package:padelrush/models/court_booking.dart' as bookingModel;

import '../../../../../../globals/constants.dart';

class UserBookingsList extends ConsumerStatefulWidget {
  const UserBookingsList({super.key, this.isPast = false});

  final bool isPast;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpComingBookingsState();
}

class _UpComingBookingsState extends ConsumerState<UserBookingsList> {
  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(fetchUserAllBookingsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: bookings.when(
        data: (data) => buildBookingList(context, data),
        loading: () => const CupertinoActivityIndicator(radius: 10),
        error: (error, stackTrace) {
          myPrint("stackTrace: $stackTrace");
          return SecondaryText(text: error.toString());
        },
      ),
    );
  }

  Widget buildBookingList(BuildContext context, List<UserBookings> data) {
    List<UserBookings> bookings = [];
    if (widget.isPast) {
      bookings = data.where((e) => e.isPast).toList();
    } else {
      bookings = data.where((e) => !e.isPast).toList();
    }

    final currentCustomerID = ref.read(userProvider)?.user?.id ?? "";
    bookings.removeWhere(
      (e) {
        int? index = e.players?.indexWhere(
            (element) => element.customer?.id == currentCustomerID);
        if (index == null || index == -1) {
          return false;
        } else {
          return false;
        }
      },
    );

    if (bookings.isEmpty) {
      return SecondaryText(
        text: widget.isPast
            ? "NO_PAST_BOOKINGS".tr(context)
            : "NO_UPCOMING_BOOKINGS".tr(context),
      );
    }

    final dateList = bookings.dateList;
    if (widget.isPast) {
      dateList.sort((a, b) => b.compareTo(a));
    } else {
      dateList.sort((a, b) => a.compareTo(b));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildBookingWidgets(dateList, bookings),
    );
  }

  List<Widget> buildBookingWidgets(
      List<DateTime> dateList, List<UserBookings> bookings) {
    final widgets = <Widget>[];

    for (var date in dateList) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          child: Text(
            Utils.formatBookingDate(date, context),
            style: AppTextStyles.poppinsBold(
              fontSize: 16.sp,
            ),
          ),
        ),
      );

      final dateBookings =
          bookings.where((e) => e.bookingDate == date).toList();

      widgets.addAll(
        dateBookings.map((booking) {
          final isOpenMatch = booking.service?.isOpenMatch ?? false;
          final isEvent = booking.service?.isEvent ?? false;
          final isLessonEvent = booking.service?.isLesson ?? false;
          return Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Builder(builder: (context) {
                if (isEvent || isLessonEvent) {
                  return InkWell(
                    onTap: () {
                      _onTap(isOpenMatch, isEvent, isLessonEvent, booking);
                    },
                    child: UserLessonsEventsCard(
                        booking: booking, isPast: widget.isPast),
                  );
                }
                if (isOpenMatch) {
                  return InkWell(
                    onTap: () {
                      _onTap(isOpenMatch, isEvent, isLessonEvent, booking);
                    },
                    child: UserOpenMatchCard(booking: booking),
                  );
                }
                return InkWell(
                  onTap: () {
                    _onTap(isOpenMatch, isEvent, isLessonEvent, booking);
                  },
                  child: UserBookingCard(
                    booking: booking,
                  ),
                );
              }),
            ),
          );
        }),
      );
      // widgets.add(16.verticalSpace);
    }
    return widgets;
  }

  _onTap(bool isOpenMatch, bool isEvent, bool isLessonEvent,
      UserBookings booking) async {
    // If booking is unpaid, show payment dialog directly
    if (booking.isPlayerPendingPayment(ref)) {
      await _showPaymentDialog(booking);
      return;
    }

    Future nav;
    if (isEvent || isLessonEvent) {
      if (isLessonEvent) {
        nav = ref
            .read(goRouterProvider)
            .push("${RouteNames.lesson_info}/${booking.id}");
      } else {
        nav = ref
            .read(goRouterProvider)
            .push("${RouteNames.event_info}/${booking.id}");
      }
    } else if (isOpenMatch) {
      nav = ref
          .read(goRouterProvider)
          .push("${RouteNames.match_info}/${booking.id}");
    } else {
      nav = ref
          .read(goRouterProvider)
          .push("${RouteNames.bookingInfo}/${booking.id}");
    }
    nav.then((value) {
      ref.invalidate(fetchUserAllBookingsProvider);
    });
  }

  Future<void> _showPaymentDialog(UserBookings booking) async {
    try {
      String sportName = "";
      if ((booking.players ?? []).isNotEmpty &&
          booking.players!.first.customer?.sportsLevel.isNotEmpty == true) {
        sportName =
            booking.players!.first.customer!.sportsLevel.first.sportName ?? "";
      }

      List<bookingModel.BookingCourts> listCourts = [];
      for (var e in (booking.courts ?? [])) {
        listCourts.add(bookingModel.BookingCourts.fromJson(e.toJson()));
      }
      final isEvent =
          (booking.service?.serviceType ?? "").toLowerCase() == "event";
      final singleEvent =
          (booking.service?.eventType ?? "").toLowerCase() == "single";

      dynamic paid = await showDialog(
        context: context,
        builder: (context) {
          return BookCourtDialog(
            allowPayLater: false,
            getPendingPayment: true,
            payRemainingOpenMatch: false,
            payRemainingEvent: isEvent,
            payRemainingLesson: !isEvent,
            eventDoubleJoin: !singleEvent,
            showRefund: true,
            coachId: null,
            courtPriceRequestType: CourtPriceRequestType.join,
            bookings: bookingModel.Bookings(
                id: booking.id,
                price: booking.service!.price,
                duration: booking.duration2,
                isOpenMatch: true,
                sport: bookingModel.Sport(sportName: sportName),
                location: bookingModel.Location(
                    id: booking.service!.location!.id,
                    courts: listCourts,
                    locationName: booking.service!.location!.locationName)),
            bookingTime: booking.bookingStartTime,
            court: (booking.courts ?? []).isEmpty
                ? {}
                : {
                    (booking.courts ?? []).first.id ?? 0:
                        (booking.courts ?? []).first.courtName ?? ""
                  },
          );
        },
      );

      if (paid is bool && paid) {
        Utils.showMessageDialog(
            context, "YOU_HAVE_PAID_SUCCESSFULLY".tr(context));
        ref.invalidate(fetchUserAllBookingsProvider);
        ref.invalidate(walletInfoProvider);
      }
    } catch (e) {
      myPrint("Error showing payment dialog: $e");
    }
  }
}
