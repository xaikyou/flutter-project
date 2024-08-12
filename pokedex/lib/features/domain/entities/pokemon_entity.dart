class PokemonEntity {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });
}

//! Sprites

class SpritesEntity {
  final OtherEntity other;
  const SpritesEntity({
    required this.other,
  });
}

class OtherEntity {
  final OfficialArtworkEntity officialArtwork;
  const OtherEntity({
    required this.officialArtwork,
  });
}

class OfficialArtworkEntity {
  final String frontDefault;
  final String frontShiny;
  const OfficialArtworkEntity({
    required this.frontDefault,
    required this.frontShiny,
  });
}

//! Types

class TypesEntity {
  final TypeEntity type;
  const TypesEntity({
    required this.type,
  });
}

class TypeEntity {
  final String name;
  const TypeEntity({
    required this.name,
  });
}
