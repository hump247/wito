

class YaliojiriCardController {
  final List<YaliojiriCardDetails> _yaliojiriCardDetails = [
    YaliojiriCardDetails(
      yaliojiriCard: YaliojiriCard(id: 'id'),
      yaliojiriCard_details: [
        YaliojiriCardDetail(
          subtitle: 'Serikali Kuongeza Ubora wa bei za ununuzi wa mkonge',
          title: 'Soko la mkonge\nlaongezeka Thamani',
          imageUrl: 'assets/logo/image1.jpg',
        ),
      ],
    ),
    YaliojiriCardDetails(
      yaliojiriCard: YaliojiriCard(id: 'id'),
      yaliojiriCard_details: [
        YaliojiriCardDetail(
          subtitle:
              'Raisi Mh. Samia suluhu Kutoa ruzuku ya pembejeo kwa wakulima wadogo',
          title: 'Wakulima kupewa\npembejeo Bure',
          imageUrl: 'assets/logo/image2.jpg',
        ),
      ],
    ),
    YaliojiriCardDetails(
      yaliojiriCard: YaliojiriCard(id: 'id'),
      yaliojiriCard_details: [
        YaliojiriCardDetail(
          subtitle:
              'Bei za bidhaa sokoni kushuka baada ya Mipaka ya nchi kufunguliwa',
          title: 'Bidhaa Mpya Sokoni\nkupunguza Mfumuko wa bei',
          imageUrl: 'assets/logo/image3.jpg',
        )
      ],
    )
  ];

  List<YaliojiriCardDetails> get yaliojiriCardDetails => _yaliojiriCardDetails;
}

class YaliojiriCardDetails {
  final YaliojiriCard yaliojiriCard;
  final List<YaliojiriCardDetail> yaliojiriCard_details;

  YaliojiriCardDetails({
    required this.yaliojiriCard_details,
    required this.yaliojiriCard,
  });
}

class YaliojiriCardDetail {
  final String title;
  final String imageUrl;
  final String subtitle;

  YaliojiriCardDetail({
    required this.subtitle,
    required this.title,
    required this.imageUrl,
  });
}

class YaliojiriCard {
  final String id;
  YaliojiriCard({required this.id});
}
