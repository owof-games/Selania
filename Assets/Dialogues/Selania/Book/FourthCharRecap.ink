=== fourth_character_recap
+ (check){are_two_entities_together(FourthRecap, PG)} [FourthRecap]
    ~ enableBigDialogue()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
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
    
        - fourthChar_giftedObject == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - fourthChar_giftedObject == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - fourthChar_giftedObject == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - fourthChar_giftedObject == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - fourthChar_giftedObject == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - fourthChar_giftedObject == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - fourthChar_giftedObject == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - fourthChar_giftedObject == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}


{main_story_fourth_character: confessione.}
{main_story_fourth_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {fourthChar_ActualName}.}

//Eventuale commento della rana.

{fourth_character_feedback: Dopo aver aiutato {fourthChar_ActualName}, {mentor_ActualName} mi ha detto che<>}
{
    - fourthChar_possibleStates has Grizzly: feedback Mentore
        
    - fourthChar_possibleStates has Lupo: feedback Mentore
                    
    - fourthChar_possibleStates has Delfino:feedback Mentore
                    
    - fourthChar_possibleStates has Capibara:feedback Mentore
    
    - fourthChar_possibleStates has Corvo:feedback Mentore
}

{fourth_character_notes.one: Dopo la sua partenza, {fourthChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthChar_possibleStates has Corvo:
        sddd
}

{fourth_character_notes.two: Nella sua seconda lettera {fourthChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthChar_possibleStates has Corvo:
        sddd
}


{fourth_character_notes.three: Nella sua terza lettera {fourthChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthChar_possibleStates has Corvo:
        sddd
}

-> rewriter_book_with_flow
