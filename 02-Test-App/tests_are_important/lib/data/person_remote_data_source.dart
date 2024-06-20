class PersonRemoteDataSource {
  Future<List<Map<String, dynamic>>> getPersons() async {
    return [
      {
        'firstName': 'John',
        'lastName': 'Doe',
        'age': 30,
      },
      {
        'firstName': 'Jane',
        'lastName': 'Smith',
        'age': 25,
      },
    ];
  }
}
