const HASURA_URL = "https://ilove-marajo.herokuapp.com/v1/graphql";

String subQuery = """
  subscription {
    Municipios {
      id
      nome
    }
  }
""";