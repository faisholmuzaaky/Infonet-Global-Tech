import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:survey/model/survey_model.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(SurveyInitial());

  readJsonFile() async {
    emit(SurveyLoading());
    final jsonString = await rootBundle.loadString('assets/kuesioner.json');
    final jsonData = json.decode(jsonString);
    final Survey survey = Survey.fromJson(jsonData);
    emit(SurveySuccess(survey));
  }
}
