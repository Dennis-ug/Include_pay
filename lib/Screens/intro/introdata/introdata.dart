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
        """Securely and conveniently access a wide range of banking services provided by SACCOs that are powered by iRembo Finance. """,
    img: "assets/Screen1.jpg",
  ),
  IntroModels(
      title: "Money Transfers",
      body:
          """Money transfer just got easier. Enjoy mobile money transfers from your wallet to SACCO account at your convinience.""",
      img: "assets/screen2.jpg"),
  IntroModels(
      title: "Quick Loans",
      body:
          """Apply for a quick loan online with the Include Pay app and avail of instant cash loans with minimum requirements and documentation.""",
      img: "assets/screen3.jpg"),
  IntroModels(
    title: "Online Payments",
    body:
        """Pay school fees, from your SACCO account. You can also pay bills, utilities and shop for your favorite goodies online. """,
    img: "assets/screen4.jpg",
  )
];
