const String userTable = "cached_user";

class CachedUsersFields {
  static final List<String> values = [
    /// Add all fields
    id, userName, summ,date
  ];
  static const String id = "_id";
  static const String userName = "user_name";
  static const String summ = "summ";
  static const String date = "date";
}

//summani avval int qilib saqlab qo'yganmidiz?
// ha
//xatoda shu, string qilib shun bitta appni uninstall qilib keyin run qiling,
//yangiptan saqlang
// ustoz keyin men boshqa page malumot saqlab olib boshqa page da chizmoqchiman
//ha bo'ladi faqat ma'lumot chiqarmoqchi bo'lgan pageizdi har kirganda yangi ochishib kirsangiz shunda init state ichida datani chaqirib olasiz,updated list keladi shunda
// qarz add menda malumot qo'shadi  qarz view ko'rsatadi shu page larga bir qarab bering


class CachedUser {
  final int? id;
  final String summ;
  final String userName;
  final String date;

  CachedUser({
    this.id,
    required this.userName,
    required this.date,
    required this.summ
  });

  CachedUser copyWith({
    int? id,
    String? userName,
    String? summ,
    String? date
  }) =>
      CachedUser(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        summ: summ??this.summ,
        date:  date ?? this.date
      );

  static CachedUser fromJson(Map<String, Object?> json) => CachedUser(
    id: json[CachedUsersFields.id] as int?,
    userName: json[CachedUsersFields.userName] as String,
    summ: json[CachedUsersFields.summ]as String,
    date:  json[CachedUsersFields.date] as String
  );

  Map<String, Object?> toJson() => {
    CachedUsersFields.id: id,
    CachedUsersFields.userName: userName,
    CachedUsersFields.date:date,
    CachedUsersFields.summ:summ
  };

  @override
  String toString() => '''
        ID: ${this.id} 
        USER NAME ${this.userName} 
        SUMM ${this.summ}
        DATE ${this.date}
      ''';
}