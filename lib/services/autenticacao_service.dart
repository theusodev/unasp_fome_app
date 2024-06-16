import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutenticacaoService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> cadastrarUsuario(
      {required String nome,
      required String nascimento,
      required String cpf,
      required String email,
      required String senha,
      required String telefone,
      required String endereco,
      required String complemento,
      required String cep}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      await userCredential.user!.updateDisplayName(nome);

      // Salvar dados no Firestore
      await _firestore.collection('usuarios').doc(userCredential.user!.uid).set({
        'nome': nome,
        'nascimento': nascimento,
        'cpf': cpf,
        'email': email,
        'telefone': telefone,
        'endereco': endereco,
        'complemento': complemento,
        'cep': cep,
      });

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "O usuário já está cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuarios(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogar() async {
    return _firebaseAuth.signOut();
  }

  signInWithGoogle() {}
}
