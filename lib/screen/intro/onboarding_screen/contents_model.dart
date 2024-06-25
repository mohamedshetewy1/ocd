class Contents {
  String? image;
  String? image2;
  String? title;
  String? subtitle;
  String? description;

  Contents(
      {this.image, this.subtitle, this.description, this.title, this.image2});
}

List<Contents> contents = [
  Contents(
      title: '',
      subtitle: 'هل تشعر ان يدك غير نظيفه؟',
      image: 'assets/images/onboarding/onboarding1.png',
      image2: "assets/images/onboarding/Rectangle 26.png",
      description:
          " دعونا نتعلم كيف التعامل مع هذا الشعور والتغلب علي الوسواس"),
  Contents(
      title: '',
      subtitle: 'نحن نفهم مدي صعوبة التعلم مع الهواجس',
      image: 'assets/images/onboarding/onboarding2.png',
      image2: "assets/images/onboarding/Rectangle 26.png",
      description: "وسوف نتعلم معا كيفية التحكم في تلك الافكار "),
  Contents(
      title: '',
      subtitle: 'فلنبدأ رحلة التعافي والتغلب علي الوسواس القهرى معا',
      image: 'assets/images/onboarding/onboarding3.png',
      image2: "assets/images/onboarding/Rectangle 26.png",
      description: " سوف تكون قويا ونحن هنا لمساعدتك  "),
];
