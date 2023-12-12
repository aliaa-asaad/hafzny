part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
final class SignUpPost extends SignUpEvent {}
final class SignUpPostAge extends SignUpEvent {}
