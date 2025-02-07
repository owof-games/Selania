//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR currentReceiver = ()

=== contenuti_inventario ===
+ [Inventory]
    {findedGifts != (): -> inventarietto|->vuoto}

    =inventarietto
    <i>Hai con te {list_with_commas(findedGifts)}.</i>
    -> main

    = vuoto
    <i>L'inventario è vuoto.</i>
    -> main


=== gestione_inventario ===
{debug: I doni trovati sono {findedGifts}.}
Dono...
/* ---------------------------------

            Coltivabili

 ----------------------------------*/


+ {findedGifts has MuschioDelleAmanti} [Del muschio delle amanti.]
    ~ findedGifts -= MuschioDelleAmanti
    {
        - currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} è confusa dal dono.</i>
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
        
        
        
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            {uppercaseTranslator(secondCharacterState)} ha apprezzato molto il tuo dono.
            ~ currentReceiver = ()
            -> dono_storia_due.esito_inchiostro
        
    
        - currentReceiver has ThirdCharacter:
            ~ thirdCharacterInkLevel --
            Spettro tre è disgustato dal tuo dono.
            ~ currentReceiver = ()    
            -> dono_storia_tre.esito_inchiostro
    }
    -> main



+ {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ findedGifts -= BaccaDellaAddolorata

    {
    - currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} Ti sorride.</i>
        <i>Si rigira la bacca tra la mani, e sembra più serena.</i>
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        ~ currentReceiver = ()
        -> first_story_gift.ink_outcome
        
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
       <i>{uppercaseTranslator(thirdCharacterState)} è confuso dal dono.</i>
       ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main    




+ {findedGifts has LaSpazzata} [Un frammento della Spezzata.]
    ~ findedGifts -= LaSpazzata
    
    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, e se lo getta alle spalle.</i>
        -> first_story_gift.ink_outcome

    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        {uppercaseTranslator(thirdCharacterState)} apprezza mediamente il tuo dono.
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main



+ {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ findedGifts -= BrinaDellImpossibile

    {
    - currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} rifiuta il tuo dono, disgustata.</i>
         //~ firstCharacterSpecialEvent = true
         ~ currentReceiver = ()
        -> first_story_gift.ink_outcome




    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
        
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        <i>{uppercaseTranslator(thirdCharacterState)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ thirdCharacterSpecialEvent = true
         ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    -> main
    
    
+ {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ findedGifts -= CantoDelleCompagne

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} inizia a saltellare di gioia.</i>
         ~ currentReceiver = ()
        -> first_story_gift.ink_outcome




    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
        
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        <i>{uppercaseTranslator(thirdCharacterState)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ thirdCharacterSpecialEvent = true
         ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    -> main

+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi

    {
    - currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} ti guarda delusa.</i>
         ~ currentReceiver = ()
        -> first_story_gift.ink_outcome
        
        

    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
        
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        <i>{uppercaseTranslator(thirdCharacterState)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ thirdCharacterSpecialEvent = true
         ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    -> main

+ {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ findedGifts -= NonTiScordarDiTe

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} sussurra "nonno".</i>
        <i>Le lacrime le rigano il viso.</i>
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
        
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        <i>{uppercaseTranslator(thirdCharacterState)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ thirdCharacterSpecialEvent = true
         ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    -> main
    
/* ---------------------------------

            Oggetti trovabili

 ----------------------------------*/    
+ {findedGifts has blanket} [Una coperta.]
    ~ findedGifts -= blanket
    
    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} la stende a terra, e si rilassa.</i>
        <i>Sembra sollevata.</i>
        ~ currentReceiver = ()
        -> first_story_gift.ink_outcome
    
    
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel ++
        ~ thirdCharacterInkLevel ++
        <i>{uppercaseTranslator(thirdCharacterState)} se la avvolge attorno al corpo.
        <i>Sembra sollevata.</i>
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }

 
    
+ {findedGifts has emptyvase} [Un vaso vuoto.]
    ~ findedGifts -= emptyvase
    
    {
    - currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} ti guarda perplessa.</i>
        <i>Prova a suonarlo, ma non esce nulla di buono.</i>
        ~ currentReceiver = ()
        -> first_story_gift.ink_outcome
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ thirdCharacterInkLevel --
        <i>{uppercaseTranslator(thirdCharacterState)} ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.</i>
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    
    
    
    -> main
    
    

    //Se la lista è vuota
    + {findedGifts == ()} [Non ho nulla da donare.]
    + [Ho bisogno di ragionarci ancora un poco.]
        -> main 
    + ->
    - 
-> main
