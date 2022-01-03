import 'package:flutter/material.dart';
import 'package:shimmer_effect_sample_flutter/card_list_item.dart';
import 'package:shimmer_effect_sample_flutter/circle_list_item.dart';
import 'package:shimmer_effect_sample_flutter/shimmer.dart';
import 'package:shimmer_effect_sample_flutter/shimmer_gradient.dart';
import 'package:shimmer_effect_sample_flutter/shimmer_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Effect Sample'),
      ),
      body: Shimmer(
          linearGradient: shimmerGradient,
          child: ListView(
            children: [
              _buildTopRowItem(),
              _buildListItem(),
            ],
          )),
    );
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: Row(
        children: const [
          CircleListItem(),
          CircleListItem(),
        ],
      ),
    );
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }
}
