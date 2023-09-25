part of 'survey_cubit.dart';

@immutable
sealed class SurveyState {}

final class SurveyInitial extends SurveyState {}

final class SurveyLoading extends SurveyState {}

final class SurveySuccess extends SurveyState {
  final Survey survey;
  SurveySuccess(this.survey);
}
