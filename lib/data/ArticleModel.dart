import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class ArticleData {
  String title;
  String body;
  String imgUrl;
  String magUrl;
  String articleUrl;
  String magName;
  String author;
  String age;
}

class ArticleModel {
  final String title;
  final String body;
  final String imageUrl;
  final String magazineUrl;
  final String articleUrl;
  final String magazineName;
  final String authorName;
  final String articleAge;

  ArticleModel({
    @required this.title,
    @required this.body,
    @required this.imageUrl,
    @required this.magazineUrl,
    @required this.articleUrl,
    @required this.magazineName,
    @required this.authorName,
    @required this.articleAge,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] as String,
      body: json["body"] as String,
      imageUrl: json["imageUrl"] as String,
      magazineUrl: json["magazineUrl"] as String,
      articleUrl: json["articleUrl"] as String,
      magazineName: json["magazineName"] as String,
      authorName: json["authorName"] as String,
      articleAge: json["articleAge"] as String,
    );
  }
}

class CarlosArticle implements ArticleData {
  @override
  String author = "Moi";

  @override
  String body =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus urna risus, tincidunt et malesuada nec, tristique sed mi. Suspendisse feugiat, nisl ut ornare mollis, felis nisi iaculis ex, a aliquet turpis ante id sapien. Aliquam porttitor vestibulum sem, ut scelerisque augue volutpat a. Aliquam mollis libero et bibendum euismod. In facilisis at nulla ut cursus. Donec maximus condimentum vehicula. Integer finibus iaculis metus, at varius libero volutpat ut. Mauris non nunc mauris. Vivamus odio ex, suscipit a ipsum vitae, malesuada imperdiet ex.\n"
      "Cras pretium sagittis nibh, sed rutrum nisi varius ut. Vestibulum justo nisl, ullamcorper ut placerat et, interdum at augue. Mauris urna odio, vulputate vitae urna sit amet, aliquam varius nulla. Cras ac tempor ante, eget aliquam nibh. Nullam elementum ultrices vestibulum. Curabitur tincidunt enim ut velit tincidunt facilisis. Sed rhoncus lectus et suscipit condimentum. Morbi metus mi, feugiat non consectetur efficitur, tincidunt at justo. Curabitur eu sem vitae nibh ultricies fermentum non id arcu. Nulla eu luctus ipsum.\n"
      "Integer sollicitudin tincidunt feugiat. Nulla eget finibus lectus, sit amet pellentesque sem. Aenean varius volutpat porta. Sed at urna blandit nisi luctus bibendum. Pellentesque non aliquet nunc, in maximus ipsum. Morbi suscipit accumsan molestie. Nullam sit amet scelerisque metus. Nunc ut consectetur ante. Morbi eget neque efficitur, ornare purus id, mollis sem. Nunc id leo urna.\n"
      "Aenean egestas pretium tincidunt. Donec lorem ante, suscipit egestas nulla ut, convallis laoreet felis. Nullam nec ex dapibus nulla sagittis iaculis. In feugiat felis eu dapibus porta. Aliquam et ligula sed orci tempus tincidunt non ut ipsum. Quisque euismod tempor maximus. Quisque quis dolor vel odio maximus eleifend. Duis sagittis a erat eu faucibus. Vestibulum iaculis condimentum eros eu tristique. Vestibulum ultricies purus ex, sed tristique nisl cursus eget. Ut nec velit pulvinar, dapibus tellus a, maximus tellus. Vivamus id sodales ligula, sit amet convallis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n"
      "Nullam ac sollicitudin nulla. Nulla id arcu ac elit aliquam suscipit. Phasellus suscipit tempor tortor luctus semper. Aliquam nec pellentesque mauris. Aenean tempor sapien vel nibh tincidunt, a euismod nunc laoreet. Nunc sagittis vestibulum justo posuere faucibus. Nam fermentum risus eu sem eleifend tempus. Suspendisse vel sagittis massa, id fringilla nunc. Suspendisse semper fermentum tristique. Pellentesque convallis neque vel ante congue pharetra. Nam feugiat consequat vehicula. In at metus accumsan risus sollicitudin imperdiet id id orci. In id maximus quam, tincidunt molestie ante. Etiam et metus eros. Proin cursus dui non condimentum ullamcorper. Sed eget felis a leo facilisis facilisis.";

  @override
  String imgUrl = "https://i.pinimg.com/originals/9c/44/ea/9c44eaa2030dbd76313b7c79e235a5f7.jpg";

  @override
  String magName = "AucunMag";

  @override
  String magUrl = "www.monsite.com";

  @override
  String title =
      "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";

  @override
  String age = "42d";

  @override
  String articleUrl = "https://fr.wikipedia.org/wiki/Lorem_ipsum";
}

class BobArticle implements ArticleData {
  @override
  String age = "12";

  @override
  String articleUrl = "https://fr.wikipedia.org/wiki/Bob_l%27%C3%A9ponge";

  @override
  String author = "Wikipedia";

  @override
  String body =
      "Bob l'éponge (SpongeBob SquarePants) est une série télévisée d'animation comique américaine, créée par l'animateur et ex-biologiste1 Stephen Hillenburg, diffusée depuis le 1er mai 1999 sur Nickelodeon.\n"
      "La série se centre principalement sur les exploits et aventures d'une petite éponge jaune rectangulaire anthropomorphe et de ses amis localisés au fond de l'Océan Pacifique dans une ville nommée « Bikini Bottom ». Sa popularité a permis de créer une franchise. C'est la série qui a la plus forte audience de la chaîne de télévision Nickelodeon, la plus grande distribution sur MTV Networks (renommée ViacomCBS Domestic Media Networks) et figure parmi les dessins animés de Nicktoons les plus regardés2. En date de 2020, Bob l'éponge est classé le seul dessin animé resté populaire durant 21 ans sans avoir la moindre baisse d'audience, il est également le seul Nicktoon des années 1990 à ne pas avoir pris fin.\n"
      "Le personnage de Bob l'éponge a été imaginé par Stephen Hillenburg en 1984 lors d'une étude de la biologie marine à l'Ocean Institute du Dana Point en Californie, où il rédige un scénario intitulé The Intertidal Zone, dans lequel des formes de vie marines anthropomorphes étaient mises en scène, dont son personnage principal. Hillenburg quitte l'institut pour devenir animateur en 1987, et rejoint plus tard la California Institute of the Arts en 1992. Dans cet institut, il crée la thèse du film Wormholes (1992), ce qui le conduit à une carrière de réalisateur, scénariste, producteur, et producteur exécutif de la série Rocko's Modern Life créée par Joe Murray. Il débute alors le développement de la série Bob l'éponge en 1996.\n"
      "La série est diffusée pour la première fois aux États-Unis sur Nickelodeon après la diffusion de la douzième cérémonie du Kids' Choice Awards. Les premiers épisodes sont Bienvenue à bord, Le Grand Nettoyage et Asphyxies en chaîne. L'avant-première « officielle » de la série est diffusée le 17 juillet 1999 suivant les épisodes Sculptures sur bulles et Un nouveau comique. En 2000, la popularité de la série s'accroît. Le 19 novembre 2004, le tout premier film de la série est diffusé au cinéma. Bob l'éponge est relancé pour une treizième saison le 14 juillet 20193.\n"
      "Bob l'éponge est diffusé internationalement et traduit dans diverses langues.\n";

  @override
  String imgUrl =
      "https://www.serial-gamers.fr/wp-content/uploads/2019/06/thq-nordic-announces-spongebob-squarepants-battle-for-bikini-bottom-rehydrated_feature.jpg";
  @override
  String magName = "Wikipedia";

  @override
  String magUrl = "wikipedia.fr";

  @override
  String title = "Bob l'eponge, ce bro";
}

class PatrickArticle implements ArticleData {
  @override
  String age = "3";

  @override
  String articleUrl = "https://fr.wikipedia.org/wiki/Patrick_%C3%89toile_de_mer";

  @override
  String author = "Wikipedia";

  @override
  String body =
      "Patrick Étoile de mer, ou Patrick Étoile (Patrick Star), est un personnage de la série télévisée d'animation américaine Bob l'éponge. Il apparaît pour la première fois dès le premier épisode de la série, intitulé Bienvenue à bord !, diffusé aux États-Unis le 1er mai 1999. Il est doublé dans la version originale par Bill Fagerbakke, en version française par Érik Colin jusqu'en 2013, puis par Boris Rehlinger et en version québécoise par Hugolin Chevrette-Landesque. Patrick Étoile est conçu par le biologiste et animateur Stephen Hillenburg peu après l'annulation de sa série Rocko's Modern Life en 1996. À cette époque, Hillenburg tente de créer une série télévisée mettant en scène une éponge très optimiste qui agace son entourage tout en s'inspirant des idées de Laurel et Hardy et de Pee-Wee Herman.";

  @override
  String imgUrl = "https://daexie.files.wordpress.com/2016/02/tvbp32x9.png?w=640";

  @override
  String magName = "Wikipedia";

  @override
  String magUrl = "wikipedia.fr";

  @override
  String title = "Patrick, ce bro";
}
