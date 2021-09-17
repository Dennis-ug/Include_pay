class IntroModels {
  final String title;
  final String body;
  final String img;
  IntroModels({required this.title, required this.body, required this.img});
}

List<IntroModels> introdata = [
  IntroModels(
    title: "Welcome to Include Pay",
    body:
        """Securely and conveniently access a wide range of banking services provided by SACCOs that are powered by \n iRembo Finance. """,
    img: "assets/Screen1.jpg",
  ),
  IntroModels(
      title: "Pay Fees",
      body:
          """Studying is quiet demanding, IncludePay offers you an opportunity to pay for your studies with ease""",
      img: "assets/Screen2.jpg"),
  IntroModels(
      title: "Quick Loans",
      body:
          """Apply for a quick agriculture loan with IncludePay app and avail of instant cash loans with minimum requirements and documentation """,
      img: "assets/Screen3.jpg"),
];
