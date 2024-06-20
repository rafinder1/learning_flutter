import 'package:tests_are_important/data/person_remote_data_source.dart';
import 'package:tests_are_important/domain/models/person.dart';

class PersonRepository {
  PersonRepository({required this.remoteDataSource});

  final PersonRemoteDataSource remoteDataSource;

  Future<List<Person>> getAuthorModels() async {
    final json = await remoteDataSource.getPersons();
    return json.map((item) => Person.fromJson(item)).toList();
  }
}