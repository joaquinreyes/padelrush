import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/managers/api_manager.dart' show kBaseURL, kClubID;
import 'package:padelrush/utils/custom_extensions.dart';

import '../app_styles/app_colors.dart';
import '../app_styles/app_text_styles.dart';
import '../routes/app_pages.dart';
import 'custom_dialog.dart';
import 'main_button.dart';

class TermsAndCondition extends ConsumerStatefulWidget {
  final bool showButton;
  final bool isTerms;
  final ScrollController scrollController;

  const TermsAndCondition(
      {super.key,
      this.isTerms = true,
      this.showButton = false,
      required this.scrollController});

  @override
  ConsumerState<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends ConsumerState<TermsAndCondition> {
  String? _backendText;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchPolicies();
  }

  Future<void> _fetchPolicies() async {
    try {
      final response = await Dio().get('$kBaseURL/$kClubID/policies');
      final data = response.data?['data'];
      if (data != null) {
        final text = widget.isTerms
            ? data['terms_and_conditions']
            : data['privacy_policy'];
        if (text != null && text.toString().isNotEmpty) {
          final stripped = text
              .toString()
              .replaceAll(RegExp(r'<[^>]*>'), '')
              .replaceAll('&nbsp;', ' ')
              .replaceAll('&amp;', '&')
              .replaceAll('&lt;', '<')
              .replaceAll('&gt;', '>')
              .replaceAll('&quot;', '"')
              .trim();
          if (stripped.isNotEmpty) {
            setState(() {
              _backendText = stripped;
            });
          }
        }
      }
    } catch (_) {
      // Fallback to locale text
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        color: AppColors.white,
        closeIconColor: AppColors.black,
        contentPadding: EdgeInsets.only(top: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              widget.isTerms
                  ? "TERMS_AND_CONDITIONS".trU(context)
                  : "COMMUNICATIONS".trU(context),
              style: AppTextStyles.popupHeaderTextStyle.copyWith(color: AppColors.black),
            )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 500.h,
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : Scrollbar(
                      controller: widget.scrollController,
                      thumbVisibility: true,
                      thickness: 5,
                      radius: Radius.circular(10.r),
                      child: SingleChildScrollView(
                        controller: widget.scrollController,
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            _backendText ??
                                (widget.isTerms
                                    ? "TERMS_AND_CONDITIONS_TEXT".tr(context)
                                    : "COMMUNICATIONS_TEXT".tr(context)),
                            style: AppTextStyles.poppinsRegular(
                                fontSize: 14.sp,),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
            ),
            if (widget.showButton)
              Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 15, right: 15),
                  child: MainButton(
                    label: "AGREE_AND_CONTINUE".trU(context),
                    isForPopup: true,
                    onTap: () {
                      ref.read(goRouterProvider).pop(true);
                    },
                    borderRadius: 12.r,
                    height: 40.h,
                    width: double.infinity,
                  )),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}
