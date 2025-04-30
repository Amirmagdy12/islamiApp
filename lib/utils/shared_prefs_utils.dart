import 'package:shared_preferences/shared_preferences.dart';
class PrefsKeys{
  static const String mostRecent ='most_recent_keys';
}
void  updateMostRecentIndicesList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList = prefs.getStringList(PrefsKeys.mostRecent)??[];
  mostRecentIndicesList.add('$newSuraIndex');
  prefs.setStringList(PrefsKeys.mostRecent, mostRecentIndicesList);
}
Future<List<int>> readMostRecentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 List<String> mostRecentIndicesAssString =prefs.getStringList(PrefsKeys.mostRecent)??[];
 List<int> mostRecentIndicesAssInt = mostRecentIndicesAssString.map((element)=>int.parse(element)).toList();
 return mostRecentIndicesAssInt;
}