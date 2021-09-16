
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
    final Widget child;
    final bool isLoading;
    const LoadingView({Key? key, required this.child, required this.isLoading});

    @override
  Widget build(BuildContext context) {
    return isLoading ? _content : child;
  }

  Widget get _loading {
    return const Center(
       child: CircularProgressIndicator(),
    );
  }
  Widget get _content {
    return Stack(
      children: [
        child,
        _loading
      ],
    );
  }

}