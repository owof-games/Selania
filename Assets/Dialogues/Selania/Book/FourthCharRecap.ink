=== fourth_character_recap
+ (check){are_two_entities_together(FourthRecap, PG)} [FourthRecap]
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

-> rewriter_book_with_flow
