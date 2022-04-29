// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:food_app/src/models/user.dart';

// class UserServices {
//   String collection = "users";
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   void createUser(Map<String, dynamic> values) {
//     String id = values["id"];
//     _firestore.collection(collection).doc(id).set(values);
//   }

//   void updateUser(Map<String, dynamic> values) {
//     _firestore.collection(collection).doc(values['id']).update(values);
//   }

//   Future<userModel> getUserById(String id) =>
//       _firestore.collection(collection).doc(id).get().then((doc) {
//         return userModel.fromSnapshot(doc);
//       });
// }
