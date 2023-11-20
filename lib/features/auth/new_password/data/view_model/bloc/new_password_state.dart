part of 'new_password_bloc.dart';

@immutable
sealed class NewPasswordState {}

final class NewPasswordInitial extends NewPasswordState {}
final class NewPasswordLoading extends NewPasswordState {}

final class NewPasswordLoaded extends NewPasswordState {}

final class NewPasswordError extends NewPasswordState {}
