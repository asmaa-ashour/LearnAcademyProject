import 'package:flutter/material.dart';
import 'package:second/core/class/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        //   Image.asset(
        //   "assets/AdobeStock_355164962_Preview.ai",
        //   height: 70,
        //   width: 50,
        // ))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(
                child: Text("offlinefailure..."),
              )
            : statusRequest == StatusRequest.serverfailure
                ? const Center(
                    child: Text("serverfailure..."),
                  )
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text('No Data...'),
                      )
                    : widget;
  }
}
