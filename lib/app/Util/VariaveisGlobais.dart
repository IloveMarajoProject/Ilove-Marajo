const HASURA_URL = "https://ilove-marajo.herokuapp.com/v1/graphql";


class VariaveisQuery {
  
  static String pegarMunicipios = """
  subscription  {
    Municipios {
      id
      nome
    }
  }
  """;
}