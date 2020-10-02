import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class CreateData {
  String uid;
  CreateData({this.uid});

  CollectionReference users = Firestore.instance.collection('users');
  Future adduser(String username, String photourl) async {
    return await users
        .document(uid)
        .setData({'Username': username, 'Photo': photourl});
  }

  Stream<UserData> get datastream {
    return users.document(uid).snapshots().map(userdata);
  }

  UserData userdata(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data['Username'], url: snapshot.data['Photo']);
  }

  CollectionReference favorites = Firestore.instance.collection('favorites');
  Future addfavorite(
      bool story0, story1, story2, story3, story4, story5) async {
    return await favorites.document(uid).setData({
      'Story0': story0,
      'Story1': story1,
      'Story2': story2,
      'Story3': story3,
      'Story4': story4,
      'Story5': story5,
    });
  }

  Future updatefavorite(bool story, int index) async {
    return await favorites.document(uid).updateData({'Story$index': story});
  }

  Stream<List<bool>> get favoritestream {
    return favorites.document(uid).snapshots().map(favoritedata);
  }

  List<bool> favoritedata(DocumentSnapshot snapshot) {
    List<bool> list = [];
    for (var i = 0; i < 6; i++) {
      list.add(snapshot.data['Story$i']);
    }
    print(list);
    return list.toList();
  }

  Future uploadImage(File imagetoupload, String username) async {
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(uid);
    try {
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(imagetoupload);
      StorageTaskSnapshot task = await uploadTask.onComplete;
      var downloadUrl = await firebaseStorageRef.getDownloadURL();
      return await users
          .document(uid)
          .setData({'Username': username, 'Photo': downloadUrl});
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteImage(String imagetodelete) async {
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imagetodelete);
    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      print(e.toString());
    }
  }
}

class UserData {
  final String name;
  var url;

  UserData({this.url, this.name});
}
