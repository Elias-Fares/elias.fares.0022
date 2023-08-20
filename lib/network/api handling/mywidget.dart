import 'package:flutter/material.dart';
import 'package:my_app/core/consatnt/appcolors.dart';

class MyWidget extends StatelessWidget {
  MyWidget({required this.state, this.onLoading, required this.onSuccess, this.onFailure, this.onErrorFunction});

  final String state;
  Widget? onLoading;
  final Widget onSuccess;
  Widget? onFailure;
  Function? onErrorFunction;

  @override
  Widget build(BuildContext context) {
    print(".....................   $state      ...................");
    if (state == 'loading')
      return onLoading ?? Center(child: CircularProgressIndicator(color: AppColors.green,));
    else if (state == 'done')
      return onSuccess;
    else if (state == 'error')
      return onFailure != null
          ? onFailure!
          : onErrorFunction != null
              ? Center(
                  child: Column(
                    children: [
                      Text('Error'),
                      TextButton(
                        onPressed: () {
                          print('Retry');
                          onErrorFunction!();
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                )
              : Center(child: Text('error text'));

    return Container();
  }
}