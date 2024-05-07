import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario(
      {required String nome,
      required String nascimento,
      required String cpf,
      required String email,
      required String senha,
      required String telefone,
      required String endereco,
      required String complemento,
      required String cep}) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: senha);

    await userCredential.user!.updateDisplayName(nome);
  }
}
