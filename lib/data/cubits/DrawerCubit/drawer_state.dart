part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}
final class DrawerSignInEmail extends DrawerState {}
final class DrawerSignInPhone extends DrawerState {}