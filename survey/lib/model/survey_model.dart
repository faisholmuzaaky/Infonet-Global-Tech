class Survey {
  int id;
  String name;
  String keterangan;
  List<Kategori> kategori;

  Survey({
    required this.id,
    required this.name,
    required this.keterangan,
    required this.kategori,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    List<dynamic> kategoriList = json['kategori'];
    List<Kategori> kategori =
        kategoriList.map((k) => Kategori.fromJson(k)).toList();

    return Survey(
      id: json['id'],
      name: json['name'],
      keterangan: json['keterangan'],
      kategori: kategori,
    );
  }
}

class Kategori {
  int id;
  int no;
  String kategori;
  List<Pertanyaan> pertanyaan;

  Kategori({
    required this.id,
    required this.no,
    required this.kategori,
    required this.pertanyaan,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    List<dynamic> pertanyaanList = json['pertanyaan'];
    List<Pertanyaan> pertanyaan =
        pertanyaanList.map((p) => Pertanyaan.fromJson(p)).toList();

    return Kategori(
      id: json['id'],
      no: json['no'],
      kategori: json['kategori'],
      pertanyaan: pertanyaan,
    );
  }
}

class Pertanyaan {
  int id;
  int no;
  String pertanyaan;
  String tipe;
  Pilihan pilihan;
  Angka angka;
  Yatidak yatidak;

  Pertanyaan({
    required this.id,
    required this.no,
    required this.pertanyaan,
    required this.tipe,
    required this.pilihan,
    required this.angka,
    required this.yatidak,
  });

  factory Pertanyaan.fromJson(Map<String, dynamic> json) {
    return Pertanyaan(
      id: json['id'],
      no: json['no'],
      pertanyaan: json['pertanyaan'],
      tipe: json['tipe'],
      pilihan: Pilihan.fromJson(json['pilihan']),
      angka: Angka.fromJson(json['angka']),
      yatidak: Yatidak.fromJson(json['yatidak']),
    );
  }
}

class Pilihan {
  List<PilihanItem> pilihan;
  String petunjuk;
  String lampiranFoto;

  Pilihan({
    required this.pilihan,
    required this.petunjuk,
    required this.lampiranFoto,
  });

  factory Pilihan.fromJson(Map<String, dynamic> json) {
    List<dynamic> pilihanList = json['pilihan'];
    List<PilihanItem> pilihan =
        pilihanList.map((item) => PilihanItem.fromJson(item)).toList();

    return Pilihan(
      pilihan: pilihan,
      petunjuk: json['petunjuk'],
      lampiranFoto: json['lampiran_foto'],
    );
  }
}

class PilihanItem {
  String status;
  String keterangan;

  PilihanItem({
    required this.status,
    required this.keterangan,
  });

  factory PilihanItem.fromJson(Map<String, dynamic> json) {
    return PilihanItem(
      status: json['status'],
      keterangan: json['keterangan'],
    );
  }
}

class Angka {
  String status;
  int from;
  int to;
  String petunjuk;
  String lampiranFoto;

  Angka({
    required this.status,
    required this.from,
    required this.to,
    required this.petunjuk,
    required this.lampiranFoto,
  });

  factory Angka.fromJson(Map<String, dynamic> json) {
    return Angka(
      status: json['status'],
      from: json['from'],
      to: json['to'],
      petunjuk: json['petunjuk'],
      lampiranFoto: json['lampiran_foto'],
    );
  }
}

class Yatidak {
  String ya;
  String tidak;
  String petunjuk;
  String lampiranFoto;

  Yatidak({
    required this.ya,
    required this.tidak,
    required this.petunjuk,
    required this.lampiranFoto,
  });

  factory Yatidak.fromJson(Map<String, dynamic> json) {
    return Yatidak(
      ya: json['ya'],
      tidak: json['tidak'],
      petunjuk: json['petunjuk'],
      lampiranFoto: json['lampiran_foto'],
    );
  }
}
