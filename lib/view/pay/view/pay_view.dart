import 'package:carousel_slider/carousel_slider.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/core/constants/pay_const.dart';
import 'package:enhance/view/enhance/view/enhance_view.dart';
import 'package:enhance/view/pay/config/payment_configurations.dart';
import 'package:enhance/view/pay/vm/pay_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pay/pay.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  _PayState createState() => _PayState();
}

class _PayState extends BaseState<Pay> {
  PayViewModel _viewModel = PayViewModel();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseView<PayViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: PayViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(
              context: context,
              title: const LottieCustomWidget(
                  path: AppIcons.APPLOTTIE_WELCOME, width: 120, height: 120),
              lastIconPath: AppIcons.APPLOTTIE_CROSS),
          _buildCarousel,
          _cardBody(),
          _packetBody(),
          _payButton
        ],
      );

  Widget get _buildCarousel => Column(
        children: [
          Container(
            height: dynamicHeight(.2),
            margin:
                EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.01)),
            child: CarouselSlider(
              disableGesture: false,
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 2),
                height: dynamicHeight(.3),
                viewportFraction: .7,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 1,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                // autoPlay: false,
              ),
              items: imgList
                  .map((item) => ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          height: dynamicHeight(.2),
                        ),
                      ))
                  .toList(),
            ),
          ),
          AnimatedSmoothIndicator(
              activeIndex: activeIndex, count: imgList.length)
        ],
      );

  Widget _cardBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: dynamicHeight(.02), bottom: 0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieCustomWidget(
                  path: AppIcons.APPLOTTIE_STORE, width: 50, height: 50),
              Text(
                "Custom Store",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              LottieCustomWidget(
                  path: AppIcons.APPLOTTIE_STORE, width: 50, height: 50)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: dynamicWidth(.9),
          height: dynamicHeight(.3),
          margin: EdgeInsetsDirectional.symmetric(
              horizontal: dynamicWidth(.05), vertical: dynamicHeight(.01)),
          decoration: BoxDecoration(
              color: AppColors.APPCOLOR_BLUE_2,
              borderRadius: BorderRadius.circular(15)),
          child: Observer(builder: (context) {
            return ListView(
              children: [
                _enhanceCard(),
                _textToImageCard(),
                _textToSpeechCard(),
                _converterhCard(),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _enhanceCard() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.01)),
      width: dynamicWidth(.8),
      height: dynamicHeight(.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_BLUE_3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Enhance"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    void currency() {
                      Locale locale = Localizations.localeOf(context);
                      var format = NumberFormat.simpleCurrency(
                          locale: locale.toString());
                      print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
                      print("CURRENCY NAME ${format.currencyName}"); // USD
                    }

                    currency();
                    _viewModel.removeEnhanceCount();
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(_viewModel.enhanceCount.toString())),
              IconButton(
                  onPressed: () => _viewModel.addEnhanceCount(),
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _textToImageCard() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.01)),
      width: dynamicWidth(.8),
      height: dynamicHeight(.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_BLUE_3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Text to image"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () => _viewModel.removeTextToImageCount(),
                  icon: const Icon(
                    Icons.remove_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(_viewModel.textToImageCount.toString())),
              IconButton(
                  onPressed: () => _viewModel.addTextToImageCount(),
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _textToSpeechCard() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.01)),
      width: dynamicWidth(.8),
      height: dynamicHeight(.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_BLUE_3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Text to speech"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () => _viewModel.removeTextToSpeechCount(),
                  icon: const Icon(
                    Icons.remove_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(_viewModel.textToSpeechCount.toString())),
              IconButton(
                  onPressed: () => _viewModel.addTextToSpeechCount(),
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _converterhCard() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.01)),
      width: dynamicWidth(.8),
      height: dynamicHeight(.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_BLUE_3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Converter"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () => _viewModel.removeConverterCount(),
                  icon: const Icon(
                    Icons.remove_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(_viewModel.converterCount.toString())),
              IconButton(
                  onPressed: () => _viewModel.addConverterCount(),
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppColors.APPCOLOR_COLORFUL_4,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _packetBody() {
    return SizedBox(
      width: dynamicWidth(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[_packetBodyLeft(), _packetBodyRight()],
      ),
    );
  }

  Widget _packetBodyLeft() {
    return Container(
      height: dynamicHeight(.18),
      width: dynamicWidth(.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_COLORFUL_4),
    );
  }

  Widget _packetBodyRight() {
    return Container(
      height: dynamicHeight(.18),
      width: dynamicWidth(.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.APPCOLOR_COLORFUL_2),
    );
  }

  Widget get _payButton => Expanded(
        child: GooglePayButton(
          paymentConfiguration:
              PaymentConfiguration.fromJsonString(defaultGooglePay),
          paymentItems: _paymentItems,
          type: GooglePayButtonType.buy,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

void onApplePayResult(paymentResult) {
  // Send the resulting Apple Pay token to your server / PSP
}

void onGooglePayResult(paymentResult) {
  // Send the resulting Google Pay token to your server / PSP
}
