=== fifth_character_recap
+ (check){are_two_entities_together(FifthRecap, PG)} [FifthRecap]

    ~ enableBigDialogue()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthCharacterState)
        

<b><i>Appunti dalle conversazioni.</b></i> Ho incontrato una persona che mi ha detto di chiamarla Mentore, perché mi farà da guida in questo luogo. E dopo avermi chiesto nomi e pronomi, mi ha {player_pronouns has him:invitato|{player_pronouns has her:invitata|invitatə}} a parlare con le persone che trovo in giro. {about_ink_usage: Per poi dirmi che sono {player_pronouns has him:un Riscrittore|{player_pronouns has her:una Riscrittora|unə Riscrittorə}}, e darmi un po' di indicazioni su cosa dovrei fare.}

{that_little_liar_storylet: Dopo l'arrivo del bimbo, la prima cosa che mi ha chiesto è se son {player_pronouns has him:riuscito|{player_pronouns has her:riuscita|riuscitə}} a mandarlo a casa. Dice che qui non è sicuro per i bambini, che lui le ha tirato un calcio. Ma che le fa tenerezza, e per questo gli sembra un Riccio.}


{
    - knowing_fifth_character.five:
        Da quando sono qui, per la prima volta Mentore ha ammesso di essere stanca. E di sentire caldo. E poi si è lasciata andare ai ricordi: il suo primo bacio, l'uomo che ha sposato. A cui ha dedicato il resto dei suoi giorni, fino a quando non è arrivata qui. E mi ha chiesto cosa significa per me amare un'altra persona. Per poi definirsi una "sciocca romantica", e dirmi che l'amore è ovunque, anche qui. Amore per noi.
    
}



{
    - knowing_fifth_character.four:
        Ora che {charNameTwo} ha trovato il suo nome, Mentore si chiede se non sia stata troppo severa con lui. Dice che era spaventata, e forse ha reagito con violenza. Si è chiesta cosa possa significare essere un genitore che si rende conto che suo figlio, così piccolo, ha già perso la sua strada. E perché non pensa al pallone, o allo studio, invece che al futuro e all'ambiente.
}


{
    - knowing_fifth_character.three:
        Mentore mi ha raccontato che a volte ci sono persone, persone passate da qui, che vorrebbe sentire più spesso. Ma le loro lettere non arrivano, o arrivano sempre più di rado E allora si chiede se ha sbagliato qualcosa.
    
}



{
    - knowing_fifth_character.two:
        Mentore è rimasta colpita da come {charNameOne} sia stata insieme consapevole delle opinioni delle persone care, eppure capace di non perdere sé stessa. E poi mi ha chiesto di pregare per lei.
}



{
    - knowing_fifth_character.one:
        Durante una chiacchierata, Mentore mi ha raccontato che il suo posto preferito è la serra, perché vedere crescere le cose la fa sentire appagata, la sensazione di permettere con le proprie mani a un altro corpo di crescere al meglio.
}


//Da riordinare

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



{
    - rewriting_proposal_first_character.secret_ending: 
    Dopo aver concluso la sua riscrittura, {charNameOne} mi ha chiesto qual è secondo me il confine tra essere una brava persona ed essere una manipolatrice, riferendosi a {charNameFive}.
}

{
    - rewriting_proposal_second_character.secret_ending: 
    Dopo aver scelto il suo nome, {charNameTwo} mi ha detto che {charNameFive} non gli sembra felice. Che gli ricorda mamma quando gira per casa dando cosnigli e dicendo cose sorridendo, per poi rinchiudersi in camera e restare in silenzio per ore.
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


{
    - first_character_notes.one:
        <b>Lettere di {charNameOne}.</b></i>
    
    
        Ciao {player_name}, come stai? Alla fine Talco è sempre statə qui, me idiota. E ha creduto alla mia storia! Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci. <>

           {
                - firstChar_possibleStates has Triangolo:
                    Io, invece, non riesco a prendere uno strumento in mano da che sono tornata. <>
                    
                - firstChar_possibleStates has RagazzaOrchestra:
                    Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi. <>
                    
                - firstChar_possibleStates has FlautoDolce:
                    Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                    E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                    Tu e quel posto mi avete reso una mollacciona.
                    Ma non è così male, alla fine. <>
                    
                - firstChar_possibleStates has Ocarina:
                    Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                    Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                    Sono felice ama, davvero felice. <>
                    
                - firstChar_possibleStates has Violino:
                    Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                    No, non ho esagerato col vinello.
                    Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi! <>
            }
        Spero che lì vada tutto bene. E che {charNameFive} non sia sempre pesantona. Alla prossima lettera. <i>{charNameOne}</i>
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

-> rewriter_book_with_flow