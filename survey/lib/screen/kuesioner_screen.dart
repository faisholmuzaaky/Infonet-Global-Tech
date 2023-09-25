part of 'screen.dart';

enum PilihanItemPertanyaan { green, red }

class KuesionerScreen extends StatefulWidget {
  const KuesionerScreen({super.key});

  @override
  State<KuesionerScreen> createState() => _KuesionerScreenState();
}

class _KuesionerScreenState extends State<KuesionerScreen> {
  String? pilihan;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        title: const Text('SURVEY APP'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (context, state) {
          if (state is SurveySuccess) {
            state.survey.kategori.first.pertanyaan;
            return PageView.builder(
              controller: pageController,
              itemCount: state.survey.kategori.first.pertanyaan.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      '${index + 1} / ${state.survey.kategori.first.pertanyaan.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    pertanyaan(
                      index,
                      state.survey.kategori.first.pertanyaan[index],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (index != 0)
                              ? ElevatedButton(
                                  onPressed: () {
                                    pageController.animateToPage(
                                      index - 1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(),
                          (index + 1 !=
                                  state.survey.kategori.first.pertanyaan.length)
                              ? ElevatedButton(
                                  onPressed: () {
                                    pageController.animateToPage(
                                      index + 1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('KIRIM'),
                                ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget pertanyaan(int index, Pertanyaan pertanyaan) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            pertanyaan.pertanyaan,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        (pertanyaan.tipe == "ya/tidak")
            ? Text(
                pertanyaan.yatidak.petunjuk,
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )
            : (pertanyaan.tipe == "pilihan")
                ? Text(
                    pertanyaan.pilihan.petunjuk,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                : (pertanyaan.tipe == "isian angka")
                    ? Text(
                        pertanyaan.angka.petunjuk,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
        const SizedBox(height: 36),
        (pertanyaan.tipe == "ya/tidak")
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                        child: const Text('TIDAK'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: const Text('YA'),
                      ),
                    )
                  ],
                ),
              )
            : (pertanyaan.tipe == "pilihan")
                ? Column(
                    children: [
                      RadioListTile(
                        title: Text(pertanyaan.pilihan.pilihan[0].keterangan),
                        value: pertanyaan.pilihan.pilihan[0].status,
                        groupValue: pilihan,
                        onChanged: (value) {
                          setState(() {
                            pilihan = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(pertanyaan.pilihan.pilihan[1].keterangan),
                        value: pertanyaan.pilihan.pilihan[1].status,
                        groupValue: pilihan,
                        onChanged: (value) {
                          setState(() {
                            pilihan = value;
                          });
                        },
                      )
                    ],
                  )
                : (pertanyaan.tipe == "isian angka")
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                '${pertanyaan.angka.from} - ${pertanyaan.angka.to}',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
      ],
    );
  }
}
