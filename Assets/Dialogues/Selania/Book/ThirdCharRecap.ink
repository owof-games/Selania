=== third_character_recap
+ (check){are_two_entities_together(ThirdRecap, PG)} [ThirdRecap]
    ~ enableBigDialogue()   
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

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
    
        - thirdChar_giftedObject == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - thirdChar_giftedObject == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - thirdChar_giftedObject == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - thirdChar_giftedObject == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - thirdChar_giftedObject == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - thirdChar_giftedObject == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - thirdChar_giftedObject == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - thirdChar_giftedObject == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}



{main_story_third_character: confessione.}

//Eventuale commento della rana.


{main_story_third_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {thirdChar_ActualName}.}

{third_character_feedback: Dopo aver aiutato {thirdChar_ActualName}, {mentor_ActualName} mi ha detto che<>}
{
    - thirdChar_possibleStates has Grizzly: feedback Mentore
        
    - thirdChar_possibleStates has Lupo: feedback Mentore
                    
    - thirdChar_possibleStates has Delfino:feedback Mentore
                    
    - thirdChar_possibleStates has Capibara:feedback Mentore
    
    - thirdChar_possibleStates has Corvo:feedback Mentore
}

{third_character_notes.one: Dopo la sua partenza, {thirdChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdChar_possibleStates has Corvo:
        sddd
}

{third_character_notes.two: Nella sua seconda lettera {thirdChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdChar_possibleStates has Corvo:
        sddd
}


{third_character_notes.three: Nella sua terza lettera {thirdChar_ActualName} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdChar_possibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdChar_possibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdChar_possibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdChar_possibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdChar_possibleStates has Corvo:
        sddd
}
-> rewriter_book_with_flow

