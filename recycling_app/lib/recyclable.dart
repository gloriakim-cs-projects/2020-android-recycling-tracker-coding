class Recyclable {
  final String title; //e.g. chip bags
  final String description; // e.g. (PLASTIC)
  final String recycle; // e.g. trash / electronic waste
  final String
      recycleDesc; // e.g. This item is not recyclable in Denton Recycling Facility
  final String instruction; //e.g. Simply place it in a tashcan.
  final String
      specialFacility; // e.g.  Although it is generally not recyclable, you can visit BestBuy to recycle electronics.
  final String recyclingPreparation;
  final String recyclingProcess;
  final String alternativeOptions; // e.g. purchase Clorox, which is composable.
  final String
      why; //e.g. chip bags are not recyclabel in Denton Facility because...
  final String donate; // e.g. do not donate
  final String creativeUse; // e.g. pinterest chip bag upcycel examples

  Recyclable({
    this.title,
    this.description,
    this.recycle,
    this.recycleDesc,
    this.instruction,
    this.specialFacility,
    this.recyclingPreparation,
    this.recyclingProcess,
    this.alternativeOptions,
    this.why,
    this.donate,
    this.creativeUse,
  });
}
