part of 'database.dart';

class CharacterHandler<T>{
  late Box<T> _box;

  Future<void> add({required T character}) async {
    _box = await _openBox();
    List<T> list = [];
    if(_box.length > 0){
      for(int i=0; i < _box.length; i++){
        T? data = _box.getAt(i);
        list.add(data as T);
      }
      if(!list.contains(character)){
        await _box.add(character);
      }
    } else{
      await _box.add(character);
    }
  }

  Future<void> delete({required T character}) async {
    _box = await _openBox();
    for(int i=0; i < _box.length; i++){
      if((_box.getAt(i) as CharacterDb).id == (character as CharacterDb).id){
        await _box.deleteAt(i);
      }
    }
  }

  Future<List<T>> get() async {
    _box = await _openBox();
    List<T> list = [];
    if(_box.length > 0){
      for(int i=0; i < _box.length; i++){
        T? data = _box.getAt(i);
        list.add(data as T);
      }
      return list;
    }
    return [];
  }

  _openBox() async => _box = await Hive.openBox<T>('character');
}