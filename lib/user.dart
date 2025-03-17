class User {
  final String name;
  final String email;
  final String profilePicture;

  User({
    this.name = "Guest", // Valor padrão para o nome
    this.email = "No email available", // Valor padrão para o email
    this.profilePicture =
        "assets/default_profile.png", required type, // Valor padrão para a foto de perfil
  });

  get type => null;
}
