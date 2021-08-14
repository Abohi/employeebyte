import 'package:dartz/dartz.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/models/country_model/countries_model.dart';
import 'package:employeebyte/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countriesFutureProvider = FutureProvider<Either<NetworkFailure,CountriesModel?>>((ref) => ref.read(authRepositoryProvider).getCountriesAndState());