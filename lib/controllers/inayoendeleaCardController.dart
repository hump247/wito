class InayoendeleaCardController {
  final List<InayoendeleaCardDetails> _inayoendeleaCardDetails = [
    InayoendeleaCardDetails(
      inayoendeleaCard: InayoendeleaCard(id: 'id'),
      inayoendeleaCard_details: [
        InayoendeleaCardDetail(
          title: 'Madaftari ya Kujifunza Hisabati',
          imageUrl: 'assets/icon/book1.jpeg',
        ),
      ],
    ),
    InayoendeleaCardDetails(
      inayoendeleaCard: InayoendeleaCard(id: 'id'),
      inayoendeleaCard_details: [
        InayoendeleaCardDetail(
          title: 'Vifaa vya Kisasa vya Michezo',
          imageUrl: 'assets/icon/balls.jpeg',
        ),
      ],
    ),

  ];

  List<InayoendeleaCardDetails> get inayoendeleaCardDetails => _inayoendeleaCardDetails;
}

class InayoendeleaCardDetails {
  final InayoendeleaCard inayoendeleaCard;
  final List<InayoendeleaCardDetail> inayoendeleaCard_details;

 InayoendeleaCardDetails({
    required this.inayoendeleaCard_details,
    required this.inayoendeleaCard,
  });
}

class InayoendeleaCardDetail {
  final String title;
  final String imageUrl;


  InayoendeleaCardDetail({

    required this.title,
    required this.imageUrl,
  });
}

class InayoendeleaCard {
  final String id;
  InayoendeleaCard({required this.id});
}
