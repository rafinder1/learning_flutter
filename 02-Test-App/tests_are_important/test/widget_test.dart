import 'package:flutter_test/flutter_test.dart';
import 'package:tests_are_important/data/person_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tests_are_important/domain/models/person.dart';
import 'package:tests_are_important/repositories/person_repository.dart';

import 'widget_test.mocks.dart';



@GenerateMocks([PersonRemoteDataSource])
void main() {
  late PersonRepository repository;
  late MockPersonRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPersonRemoteDataSource();
    repository = PersonRepository(remoteDataSource: mockRemoteDataSource);
  });

  test('should return a list of Person models', () async {
    // Arrange
    when(mockRemoteDataSource.getPersons()).thenAnswer((_) async => [
          {'firstName': 'John', 'lastName': 'Doe', 'age': 30},
          {'firstName': 'Jane', 'lastName': 'Smith', 'age': 25},
        ]);

    // Act
    final result = await repository.getAuthorModels();

    // Assert
    expect(result, isA<List<Person>>());
    expect(result.length, 2);
    expect(result[0].firstName, 'John');
    expect(result[0].lastName, 'Doe');
    expect(result[0].age, 30);
    expect(result[1].firstName, 'Jane');
    expect(result[1].lastName, 'Smith');
    expect(result[1].age, 25);
  });
}
