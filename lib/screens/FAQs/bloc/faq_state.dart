part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {
  const FaqLoading();

  @override
  List<Object> get props => [];
}

class FaqSuccess extends FaqState {
  final List<FAQData> data;

  const FaqSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class FaqError extends FaqState {
  final String error;
  const FaqError({required this.error});

  @override
  List<Object> get props => [error];
}
