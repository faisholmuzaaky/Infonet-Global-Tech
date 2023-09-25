part of 'screen.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel product;
  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int activeIndex = 0;
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title!.toUpperCase()),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: widget.product.images!.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = widget.product.images![index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.previousPage(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.black.withOpacity(0.2),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.nextPage(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.black.withOpacity(0.2),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 20,
                          color: Colors.black.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              widget.product.images!.length,
                              (index) => Container(
                                height: 10,
                                width: 10,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: activeIndex == index
                                      ? Colors.blue
                                      : const Color(0xFFEEEEEE),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$ ${widget.product.price}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.description!,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('BUY'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            urlImage,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
