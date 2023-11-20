part of 'new_password_bloc.dart';

@immutable
sealed class NewPasswordEvent {}
final class NewPasswordPost extends NewPasswordEvent {}
