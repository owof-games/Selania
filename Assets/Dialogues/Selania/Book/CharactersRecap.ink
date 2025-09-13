=== first_character_recap
+ {are_two_entities_together(FirstRecap, PG)} [FirstRecap]
~ enableBigDialogue()

{
    - knowing_first_character.one: Ho conosciuto una persona nuova, si chiama Chitarra. Quando l'ho incontrata era preoccupata perché non riuscita a trovare lə sua migliore amicə, Talco. Non le piace molto il suo nome, ha l'impressione che essere una Chitarra per una come lei, che ha fatto il conservatorio, significhi arrendersi. Quando mi ha chiesto che nome dovrebbe avere secondo me, non sono {pronouns has him:stato|{pronouns has her:stata|statə}} capace di darle una risposta.
    
}

{
    - knowing_first_character.two: Chitarra sembra davvero persa senza Talco. Da tanto non andava in giro senza di ləi. Di sicuro, sembra non avere in simpatia Mentore.
    
}

{
    - knowing_first_character.three: Ogni persona vicina a Chitarra sembra avere un'idea su come lei dovrebbe vivere la sua vita. Anna, una delle sue amiche, insiste perché divenga assistete di un suo professore, tal Ghiberti. Olga vuole che metta su una band e sfondi per locali. Talco vuole che partecipi a qualche reality musicale. Ed Ennio pensa che abbia completamente sbagliato strada. Tutte queste persone sono famiglia per Chitarra, ed è frustrata perché qualsiasi scelta prenderà, delulderà qualcunə.
    
}

{
    - knowing_first_character.four: A Chitarra il silenzio pesa, e molto. Senza musica teme di sbroccare.
    
}

{
    - knowing_first_character.five: Chitarra ama fare festa, ed è abituata ad essere circondata da persone. Vive con cinque amich3, e poi ci sono l3 ospiti. D'estate fanno le feste sul tetto dove suonano e cantano. Il silenzio di questo posto la fa star male, perché può sentire i propri pensieri.
    
}

{
    - knowing_first_character.six: Chitarra mi ha raccontato la storia di questo ragazzo, Jonah. Un prodigio che dopo una carriera sfolgorante in Cina ha deciso di tornare in Italia, e le cose gli sono andate di merda. Non si capisce se ora mendichi, suoni per i ricchi, o lavori in un supermercato. Ma la storia di Jonah lascia una domanda a Chitarra: cosa fare quando si sa fare bene solo una cosa ma il mondo non permette di farla? Si accettano compromessi o si muore di fame? O si aspetta fino a quando non è il mondo a decidere per te?
    
}

{
    - knowing_first_character.seven: Chitarra ha ritirato fuori quel professore, il Ghiberti. E gli sta sulle scatole perché vede la musica come qualcosa di matematico. È una cosa che non le piace, perché rende l'idea che esistano errore e verità, e cito: "anche perché quelli pieni di verità hanno sempre finito per ammazzare quell3 come me e Talco."
    
}

{
    - knowing_first_character.eight: È tornata a parlare del Ghiberti. Dice che sembra felice ma in realtà sorride come un robot. Ed è tornata sul discorso dell'errore. Secondo Chitarra l'errore serve per fare esperienza e comunità. Se non si sbaglia non si cresce. Se non si sbaglia non c'è occasione per il perdono. Nei numerini del Ghiberti per Chitarra c'è la morte.
    
}

{
    - knowing_first_character.nine: Chitarra pensa di non far schifo a parlare.
    
}

{
    - knowing_first_character.ten: Chitarra mi ha raccontato qualcosa di diverso. L'anno scorso assieme ad altr3 attivist3 ha protetto gli alberi di un parco per una settimana, alberi che il Comune voleva abbattere. E quando ha sentito gli alberi cantare nel silenzio, si è sentita viva. Poi sono arrivati i poliziotti, hanno arrestato tutt3, gli alberi son stati abbattuti, e Chitarra è tornata a sentirsi inutile.
    
}

{
    - knowing_first_character.eleven: Per la prima volta Chitarra mi ha parlato della sua famiglia d'origine. La passione per la musica l'ha presa dal padre, ma era il nonno paterno ad essere musicista. Da piccola poteva sentire le vecchie registrazioni del nonno, giocare coi suoi strumenti. Ma ora che è grande suo padre tiene queste cose come delle reliquie. E se prima rideva molto, ora ha smesso. E vuole che la figlia si trovi "un lavoro vero".
    
}

{
    - knowing_first_character.twelve: Chitarra mi ha parlato di sua madre. È stata la madre a permetterle di frequentare il conservatorio, ma con l'obiettivo di portare prestigio alla famiglia. Chitarra sa che non è possibile, che per il mondo della classica è già vecchia, ma la madre non è pronta a capirlo.
    
}




//Appunto sul dono fatto
{
    - first_story_gift.ink_outcome:
    {
    
        - firstGift == EderaDelleAmanti:
            Le ho donato una foglia di <b>Edera delle Amanti</b>, ma non ha compreso il significato del mio dono.
            
        - firstGift == BaccaDellaAddolorata:
            Le ho donato una <b>Bacca dell'Addolorata</b> e ha sorriso, si è rasserenata.
            
        - firstGift == LaSpazzata:
            Le ho donato un rametto della <b>Spazzata</b> e, infastidita, l'ha lanciato via.
            
        - firstGift == BrinaDellImpossibile: 
            Le ho donato un frammento di <b>Brina dell'Impossibile</b> e l'ha gettato a terra, spaventata. Almeno sono ricomparse le linee della mia mano.
            
        - firstGift == CantoDelleCompagne: 
            Le ho donato una goccia di <b>Canto delle Compagne</b> e si è messa a cantare il nome delle persone amate.
            
        - firstGift == LicheneDegliAbissi: 
            Le ho donato una traccia dell'odore del <b>Lichene degli Abissi</b> ed era palesemente delusa.
            
        - firstGift == NonTiScordarDiTe: 
            Le ho donato l'impronta del <b>Non Ti Scordar Di Te</b>: ha sussurrato "nonno" e ha inizito a piangere.
            
        - firstGift == CardoAspinato: 
            Le ho donato un ciuffo di peli di <b>Cardo Aspinato</b> e sul momento sembra disgustata, ma poi si è messa a ridere.
    
    }    

}



{main_story_first_character: confessione.}

//Eventuale commento della rana.

{main_story_first_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {firstCharacterState}.}

{first_character_feedback: Dopo aver aiutato {firstCharacterState}, {fifthCharacterState} mi ha detto che<>}

{
    - firstCharacterPossibleStates has Grizzly: feedback Mentore
        
    - firstCharacterPossibleStates has Lupo: feedback Mentore
                    
    - firstCharacterPossibleStates has Delfino:feedback Mentore
                    
    - firstCharacterPossibleStates has Capibara:feedback Mentore
    
    - firstCharacterPossibleStates has Corvo:feedback Mentore
}

{first_character_notes.one: Dopo la sua partenza, {firstCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - firstCharacterPossibleStates has Triangolo: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - firstCharacterPossibleStates has RagazzaOrchestra: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - firstCharacterPossibleStates has FlautoDolce:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - firstCharacterPossibleStates has Ocarina:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - firstCharacterPossibleStates has Violino:
        sddd
}

{first_character_notes.two: Nella sua seconda lettera {firstCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - firstCharacterPossibleStates has Triangolo: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - firstCharacterPossibleStates has RagazzaOrchestra: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - firstCharacterPossibleStates has FlautoDolce:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - firstCharacterPossibleStates has Ocarina:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - firstCharacterPossibleStates has Violino:
        sddd
}


{first_character_notes.three: Nella sua terza lettera {firstCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - firstCharacterPossibleStates has Triangolo: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - firstCharacterPossibleStates has RagazzaOrchestra: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - firstCharacterPossibleStates has FlautoDolce:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - firstCharacterPossibleStates has Ocarina:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - firstCharacterPossibleStates has Violino:
        sddd
}

-> main


=== second_character_recap
+ {are_two_entities_together(SecondRecap, PG)} [SecondRecap]
~ enableBigDialogue()

{
    - knowing_second_character.one: prima informazione.
    
}

{
    - knowing_second_character.two: prima informazione.
    
}

{
    - knowing_second_character.three: prima informazione.
    
}

{
    - knowing_second_character.four: prima informazione.
    
}

{
    - knowing_second_character.five: prima informazione.
    
}

{
    - knowing_second_character.six: prima informazione.
    
}

{
    - knowing_second_character.seven: prima informazione.
    
}

{
    - knowing_second_character.eight: prima informazione.
    
}

{
    - knowing_second_character.nine: prima informazione.
    
}

{
    - knowing_second_character.ten: prima informazione.
    
}

{
    - knowing_second_character.eleven: prima informazione.
    
}

{
    - knowing_second_character.twelve: prima informazione.
    
}


//Appunto sul dono fatto
{
    - second_story_gift.ink_outcome:
    {
    
        - secondGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - secondGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - secondGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - secondGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - secondGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - secondGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - secondGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - secondGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    }    

}


{main_story_second_character: confessione.}


//Eventuale commento della rana.



{main_story_second_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {secondCharacterState}.}

{second_character_feedback: Dopo aver aiutato {secondCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - secondCharacterPossibleStates has Grizzly: feedback Mentore
        
    - secondCharacterPossibleStates has Lupo: feedback Mentore
                    
    - secondCharacterPossibleStates has Delfino:feedback Mentore
                    
    - secondCharacterPossibleStates has Capibara:feedback Mentore
    
    - secondCharacterPossibleStates has Corvo:feedback Mentore
}

{second_character_notes.one: Dopo la sua partenza, {secondCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - secondCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - secondCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - secondCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - secondCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - secondCharacterPossibleStates has Corvo:
        sddd
}

{second_character_notes.two: Nella sua seconda lettera {secondCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - secondCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - secondCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - secondCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - secondCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - secondCharacterPossibleStates has Corvo:
        sddd
}


{second_character_notes.three: Nella sua terza lettera {secondCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - secondCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - secondCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - secondCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - secondCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - secondCharacterPossibleStates has Corvo:
        sddd
}
-> main



=== third_character_recap
+ {are_two_entities_together(ThirdRecap, PG)} [ThirdRecap]
~ enableBigDialogue()

{
    - knowing_third_character.one: prima informazione.
    
}

{
    - knowing_third_character.two: prima informazione.
    
}

{
    - knowing_third_character.three: prima informazione.
    
}

{
    - knowing_third_character.four: prima informazione.
    
}

{
    - knowing_third_character.five: prima informazione.
    
}

{
    - knowing_third_character.six: prima informazione.
    
}

{
    - knowing_third_character.seven: prima informazione.
    
}

{
    - knowing_third_character.eight: prima informazione.
    
}

{
    - knowing_third_character.nine: prima informazione.
    
}

{
    - knowing_third_character.ten: prima informazione.
    
}

{
    - knowing_third_character.eleven: prima informazione.
    
}

{
    - knowing_third_character.twelve: prima informazione.
    
}

//Appunto sul dono fatto
{
    - third_story_gift.ink_outcome:
    {
    
        - thirdGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - thirdGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - thirdGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - thirdGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - thirdGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - thirdGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - thirdGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - thirdGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}



{main_story_third_character: confessione.}

//Eventuale commento della rana.


{main_story_third_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {thirdCharacterState}.}

{third_character_feedback: Dopo aver aiutato {thirdCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - thirdCharacterPossibleStates has Grizzly: feedback Mentore
        
    - thirdCharacterPossibleStates has Lupo: feedback Mentore
                    
    - thirdCharacterPossibleStates has Delfino:feedback Mentore
                    
    - thirdCharacterPossibleStates has Capibara:feedback Mentore
    
    - thirdCharacterPossibleStates has Corvo:feedback Mentore
}

{third_character_notes.one: Dopo la sua partenza, {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}

{third_character_notes.two: Nella sua seconda lettera {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}


{third_character_notes.three: Nella sua terza lettera {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}
-> main



=== fourth_character_recap
+ {are_two_entities_together(FourthRecap, PG)} [FourthRecap]
~ enableBigDialogue()

{knowing_fourth_character.one: prima informazione.}
{knowing_fourth_character.two: seconda informazione.}
{knowing_fourth_character.three: terza informazione.}
{knowing_fourth_character.four: quarta informazione.}
{knowing_fourth_character.five: quinta informazione.}
{knowing_fourth_character.six: sesta informazione.}
{knowing_fourth_character.seven: settima informazione.}
{knowing_fourth_character.eight: ottava informazione.}
{knowing_fourth_character.nine: nona informazione.}
{knowing_fourth_character.ten: decima informazione.}
{knowing_fourth_character.eleven: undicesima informazione.}
{knowing_fourth_character.twelve: dodicesiam informazione.}

//Appunto sul dono fatto
{
    - fourth_story_gift.ink_outcome:
    {
    
        - fourthGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - fourthGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - fourthGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - fourthGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - fourthGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - fourthGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - fourthGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - fourthGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}


{main_story_fourth_character: confessione.}
{main_story_fourth_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {fourthCharacterState}.}

//Eventuale commento della rana.

{fourth_character_feedback: Dopo aver aiutato {fourthCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - fourthCharacterPossibleStates has Grizzly: feedback Mentore
        
    - fourthCharacterPossibleStates has Lupo: feedback Mentore
                    
    - fourthCharacterPossibleStates has Delfino:feedback Mentore
                    
    - fourthCharacterPossibleStates has Capibara:feedback Mentore
    
    - fourthCharacterPossibleStates has Corvo:feedback Mentore
}

{fourth_character_notes.one: Dopo la sua partenza, {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}

{fourth_character_notes.two: Nella sua seconda lettera {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}


{fourth_character_notes.three: Nella sua terza lettera {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}

-> main


=== fifth_character_recap
+ {are_two_entities_together(FifthRecap, PG)} [FifthRecap]
~ enableBigDialogue()

Una persona che si fa chiamare {fifthCharacterState} ti ha detto di parlare in giro con le persone che incontrerai.

{that_little_liar_storylet: a {fifthCharacterState} non piacciono i bambini?}
{watering_can_storylet: non è più un dubbio.}

{main_story_first_character.secret_ending: secondo {firstCharacterState}, {fifthCharacterState} è xyz.}
{main_story_second_character.secret_ending: secondo {secondCharacterState}, {secondCharacterState} è xyz.}


{
    - knowing_fifth_character.one: prima informazione.
    
}

{
    - knowing_fifth_character.two: prima informazione.
    
}

{
    - knowing_fifth_character.three: prima informazione.
    
}

{
    - knowing_fifth_character.four: prima informazione.
    
}

{
    - knowing_fifth_character.five: prima informazione.
    
}

{
    - knowing_fifth_character.six: prima informazione.
    
}

{
    - knowing_fifth_character.seven: prima informazione.
    
}

{
    - knowing_fifth_character.eight: prima informazione.
    
}

{
    - knowing_fifth_character.nine: prima informazione.
    
}

{
    - knowing_fifth_character.ten: prima informazione.
    
}

{
    - knowing_fifth_character.eleven: prima informazione.
    
}

{
    - knowing_fifth_character.twelve: prima informazione.
    
}

//Appunto sul dono fatto
{
    - fifth_story_gift.ink_outcome:
    {
    
        - fifthGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - fifthGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - fifthGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - fifthGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - fifthGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - fifthGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - fifthGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - fifthGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}


//Eventuale commento della rana.

{main_story_fifth_character: confessione.}

{main_story_fifth_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {fifthCharacterState}.}

{fifth_character_feedback: Dopo aver aiutato {fifthCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - fifthCharacterPossibleStates has Grizzly: feedback Mentore
        
    - fifthCharacterPossibleStates has Lupo: feedback Mentore
                    
    - fifthCharacterPossibleStates has Delfino:feedback Mentore
                    
    - fifthCharacterPossibleStates has Capibara:feedback Mentore
    
    - fifthCharacterPossibleStates has Corvo:feedback Mentore
}

{fifth_character_notes.one: Dopo la sua partenza, {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}

{fifth_character_notes.two: Nella sua seconda lettera {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}


{fifth_character_notes.three: Nella sua terza lettera {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}

-> main


=== frog_character_recap
+ {are_two_entities_together(FrogRecap, PG)} [FrogRecap]
~ enableBigDialogue()

C'è una rana bluastra dalle parti dello stagno.

-> main


=== dog_character_recap
+ {are_two_entities_together(DogRecap, PG)} [DogRecap]
~ enableBigDialogue()

dog
-> main



=== witch_character_recap
+ {are_two_entities_together(WitchRecap, PG)} [WitchRecap]
~ enableBigDialogue()

Un vecchio tronco, dove hai trovato il libro col tuo nome.

{talking_witch.first_story_ended_check: cose che scopro sul fungo a fine della prima storia.}
{talking_witch.second_story_ended_check: cose che scopro sul fungo a fine della second storia.}
{talking_witch.third_story_ended_check: cose che scopro sul fungo a fine della third storia.}
{talking_witch.fourth_story_ended_check: cose che scopro sul fungo a fine della fourth storia.}
{talking_witch.fifth_story_ended_check: cose che scopro sul fungo a fine della fifth storia.}

-> main