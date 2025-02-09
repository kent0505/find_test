// import 'package:hive_flutter/hive_flutter.dart';

// @HiveType(typeId: 0)
// class Stats {
//   @HiveField(0)
//   final int id;

//   @HiveField(1)
//   String title;

//   Stats({
//     required this.id,
//     required this.title,
//   });
// }

// class StatsAdapter extends TypeAdapter<Stats> {
//   @override
//   final typeId = 0;

//   @override
//   Stats read(BinaryReader reader) {
//     return Stats(
//       id: reader.readInt(),
//       title: reader.readString(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Stats obj) {
//     writer.writeInt(obj.id);
//     writer.writeString(obj.title);
//   }
// }
