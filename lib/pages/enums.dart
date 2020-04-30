enum Gender{
	male,
	female,
	other
}

enum EventType{
	Concert,
	Comedy,
	Sports,
	Circus,
	Theatre,
	Dance


}

//extension EventTypeExtension on EventType{
//	 String get name{
//	 	switch(this){
//			case EventType.Theatre:
//				return "Theatre";
//			case EventType.Concert:
//				return "Concert";
//			case EventType.Comedy:
//				return "Comedy";
//			case EventType.Dance:
//				return "Dance";
//			case EventType.Circus:
//				return "Circus";
//			case EventType.Sports:
//				return "Sports";
//		}
//
//	 }
//}