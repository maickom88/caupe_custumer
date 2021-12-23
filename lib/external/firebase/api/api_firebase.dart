// import 'package:caupe_custumer/data/models/available_model.dart';
// import 'package:caupe_custumer/data/models/city_model.dart';
// import 'package:caupe_custumer/data/models/helps_model.dart';
// import 'package:caupe_custumer/domain/usecases/save_available.dart';
// import 'package:caupe_custumer/domain/usecases/save_cities.dart';
// import 'package:caupe_custumer/domain/usecases/update_photo_avatar.dart';
// import 'package:caupe_custumer/domain/usecases/update_serivce.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';

// import '../../../core/errors/failure.dart';
// import '../../../data/datasources/datasources.dart';
// import '../../../data/models/category_model.dart';
// import '../../../data/models/portfolio_model.dart';
// import '../../../data/models/service_model.dart';
// import '../../../data/models/user_model.dart';
// import '../../../domain/entities/entities.dart';
// import '../../../domain/usecases/create_portifolio.dart';
// import '../../../domain/usecases/delete_portfolio.dart';
// import '../collections.dart';

// class ApiFirebase implements ApiDatasource {
//   final _firestore = FirebaseFirestore.instance;
//   final _firebaseStorage = FirebaseStorage.instance;
//   @override
//   Future<UserModel> getOrCreateUser(AuthResponse params) async {
//     try {
//       final users = _firestore.collection(Collections.users);
//       final user = users.doc(params.email);
//       final body = await user.get();
//       if (!body.exists) {
//         final userInfo = UserModel(
//           name: params.name!,
//           photo: params.photoUrl!,
//           email: params.email!,
//           guid: '',
//         );
//         await user.set(userInfo.toMap());
//         return userInfo;
//       }

//       return UserModel.fromMap(body.data()!);
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<UserModel> updateInformationUser(UserModel params) async {
//     try {
//       final users = _firestore.collection(Collections.users);
//       final user = users.doc(params.email);
//       await user.set(params.toMap());
//       return params;
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<String> createPortfolio(PortfolioParams params) async {
//     try {
//       final upload = await _firebaseStorage
//           .ref('${params.email}/portfolio')
//           .child(basename(params.file.path))
//           .putFile(params.file);
//       return await upload.ref.getDownloadURL();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<PortfolioModel>> getPortfolios(String params) async {
//     try {
//       final users = _firestore.collection(Collections.portfolios);
//       final user = await users.doc(params).get();
//       if (user.data() == null) {
//         throw Exception;
//       }
//       return [];
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<PortfolioModel> deletePortfolio(DeletePortfolioParams params) async {
//     try {
//       // final users = _firestore.collection(Collections.portfolios);
//       // final user = users.doc(params.email);
//       // await user.set({'photos': params.portfolio.photos});
//       return PortfolioModel.fromModel(params.portfolio);
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<CategoryModel>> getCategories() async {
//     try {
//       final snapshots =
//           await _firestore.collection(Collections.categories).get();
//       final categories =
//           snapshots.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
//       return categories;
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<ServiceModel>> getServices(String params) async {
//     try {
//       final documents = _firestore.collection(Collections.services).doc(params);
//       final snapshots = await documents.get();
//       final data = snapshots.data()?['services'] as List;
//       return data.map((e) => ServiceModel.fromMap(e)).toList();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<ServiceModel>> updateService(ServiceParams params) async {
//     try {
//       final service = params.services
//           .map((e) => ServiceModel.fromModel(e).toMap())
//           .toList();
//       final documents =
//           _firestore.collection(Collections.services).doc(params.email);
//       documents.set({'services': service});
//       return params.services.map((e) => ServiceModel.fromModel(e)).toList();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<CityModel>> getCities() async {
//     try {
//       final snapshots = await _firestore.collection(Collections.cities).get();
//       final cities =
//           snapshots.docs.map((e) => CityModel.fromMap(e.data())).toList();
//       return cities;
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<CityModel> saveCities(CitiesParams params) async {
//     try {
//       // final cities =
//       //     params.cities.map((e) => CityModel.fromModel(e).toMap()).toList();
//       // final documents =
//       //     _firestore.collection(Collections.availableCities).doc(params.email);
//       // documents.set({'cities': cities});
//       return;
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<CityModel>> getAvailableCities(String params) async {
//     try {
//       final documents =
//           _firestore.collection(Collections.availableCities).doc(params);
//       final snapshots = await documents.get();
//       final data = snapshots.data()?['cities'] as List;
//       return data.map((e) => CityModel.fromMap(e)).toList();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<AvailableModel>> saveAvailable(AvailableParams params) async {
//     try {
//       final availables = params.available
//           .map((e) => AvailableModel.fromModel(e).toMap())
//           .toList();
//       final documents =
//           _firestore.collection(Collections.availables).doc(params.email);
//       documents.set({'availables': availables});
//       return params.available.map((e) => AvailableModel.fromModel(e)).toList();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<AvailableModel>> getAvailables(String params) async {
//     try {
//       final documents =
//           _firestore.collection(Collections.availables).doc(params);
//       final snapshots = await documents.get();
//       final data = snapshots.data()?['availables'] as List;
//       return data.map((e) => AvailableModel.fromMap(e)).toList();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<String> updatePhotoAvatar(AvatarParams params) async {
//     try {
//       final upload = await _firebaseStorage
//           .ref(params.email)
//           .child('avatar')
//           .putFile(params.file);
//       return await upload.ref.getDownloadURL();
//     } catch (e) {
//       throw ServerError();
//     }
//   }

//   @override
//   Future<List<HelpsModel>> getHelps(String params) {
//     // TODO: implement getHelps
//     throw UnimplementedError();
//   }
// }
