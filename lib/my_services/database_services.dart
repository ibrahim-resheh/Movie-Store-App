import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseServices {
  static const CONFIG_FILE_URL = "https://drive.google.com/u/0/uc?id=1YiW9E8GTT5vi46NMLywGICVPOAaUPUHH&export=download";
  static const NEW_MOVIES_FILE_URL = "https://drive.google.com/u/0/uc?id=14mSYmV-L2dT5dM7DwXC8xS9lAkIg8cqq&export=download";
  static const ARCHIVE_URL = "https://drive.google.com/u/0/uc?id=1kmzNdS8ughBTWAuzkRkKkGt0-xMMs4xK&export=download";

  static void checkVersion() async {
    bool isVersionUpdated = await isVersionUpToDate();
    if(isVersionUpdated){
      print('no need for update');
      return;
    }else{
      int responseStatus2 = await downloadNewMoviesFile();
      if(responseStatus2 == 200){
        print('new movies downloaded');
      }else{
        deleteConfigFile();
        print('new movies not downloaded');
      }
      int responseStatus1 = await downloadArchiveFile();
      if(responseStatus1 == 200){
        print('archive downloaded');
      }else{
        deleteConfigFile();
        print('archive not downloaded');
      }
    }

  }

  static Future<bool> isVersionUpToDate()async{
    double currentVersion = 0.0;
    double newVersion = 0.0;
    String path = await getPath();
    String filePath = "$path/config.json";
    final file = File(filePath);
    bool isFileExists = await file.exists();
    if (isFileExists){
      print('file found');
      final content = await file.readAsString();
      Map map = json.decode(content);
      currentVersion = map['version'];
      print(map['version']);
    }
    print('current version $currentVersion');
    int responseStatus = await downloadConfigFile();
    if(responseStatus == 200){
      final content = await file.readAsString();
      Map map = json.decode(content);
      newVersion = map['version'];
      print('new version ${map['version']}');
    }
    if(newVersion > currentVersion){
      print('file outdated');
      return false;
    }else{
      print('file up to date');
      return true;
    }
  }

  static Future<int> downloadConfigFile() async {
    var dio = Dio();
    String path = await getPath();
    try{
      Response response = await dio.download(CONFIG_FILE_URL, '$path/config.json');
      print(response.statusCode);
      return response.statusCode;
    }on DioError catch (e){
      print("error error ${e.message}");
      //throw(e);
    }catch(e){
      print("error error ${e.toString()}");
      //throw(e);
    }
    return 0;
  }

  static Future<int> downloadNewMoviesFile() async {
    var dio = Dio();
    String path = await getPath();
    try{
      Response response = await dio.download(NEW_MOVIES_FILE_URL, '$path/NewMovies.xlsx');
      print(response.statusCode);
      return response.statusCode;
    }on DioError catch (e){
      print("error error ${e.message}");
      //throw(e);
    }catch(e){
      print("error error ${e.toString()}");
      //throw(e);
    }
    return 0;
  }

  static Future<int> downloadArchiveFile() async {
    var dio = Dio();
    String path = await getPath();
    try{
      Response response = await dio.download(ARCHIVE_URL, '$path/Archive.csv');
      print(response.statusCode);
      return response.statusCode;
    }on DioError catch (e){
      print("error error ${e.message}");
      //throw(e);
    }catch(e){
      print("error error ${e.toString()}");
      //throw(e);
    }
    return 0;
  }

  static Future<String> getPath() async {
    Directory appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir.path;
    return appDocPath;
  }

  static void deleteConfigFile() async {
    final path = await getPath();
    String filePath = "$path/config.json";
    final file = File(filePath);
    if(await file.exists()){
      await file.delete();
    }
  }
}