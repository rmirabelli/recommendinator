enum ModifierType {
  add,
  remove,
}

class Modifier {
  String ingredient;
  ModifierType modifierType;

  Modifier(
    this.ingredient,
    this.modifierType,
  );
}
