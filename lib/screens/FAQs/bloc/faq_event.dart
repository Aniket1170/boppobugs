part of 'faq_bloc.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

class GetFaq extends FaqEvent {
  const GetFaq();

  @override
  List<Object> get props => [];
}
