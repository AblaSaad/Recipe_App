import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app_/models/ad.model.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial(ads: []));
  Future<void> getAds() async {
    emit(AdsLoading());
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
    emit(AdsInitial(ads: dataDecoded.map((e) => Ad.fromJson(e)).toList()));
  }
}
