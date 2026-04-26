/* ---------------------------------

   First Char Recap

 ----------------------------------*/

=== first_character_recap
+ (check) {are_two_entities_together(FirstRecap, PG)} [FirstRecap]

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


//Appunto sul dono fatto
{
    - firstChar_giftedObject != ():
        {
            - firstChar_favouritesGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed era entusiasta!
            
            - firstChar_goodGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
            
            - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
        
        }
}        
       
    {
        - grimoire_firstChar != (): <b><i>Appunti dalle conversazioni.</b></i><N><>
    }
 
    {
        - grimoire_firstChar has grimFirstCharKitchenAlone:
            Dopo aver cucinato da sola, {charNameOne} ha parlato del rapporto che ha con sua madre, e di come lei non la capisca fino in fondo. Ma sa che è una donna che parla poco ma ci tiene tanto alle altre persone. Ha raccontato a {player_name} del cibo che ha preparato quando è salita a trovarla, del riordino della casa, del saper dire "Ti voglio bene" solo coi fornelli. E che da quando {charNameOne} questa cosa un po' l'ha portata con sé, cucinando cenoni con le ame.
    }

    {
        - grimoire_firstChar has grimFirstCharKitchenEnded:
            Cucinando assieme, {charNameOne} e {player_name} hanno preparato un buon piatto di {kitchen_firstCharRecipe}. <>
            {
                - at_table_with_first_char.good_reaction:
                    Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che <b>si trova più a suo agio con le cose emotive, che non con i dati freddi e distaccati</b>.

                - at_table_with_first_char.meh_reaction:
                    Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che <b>ci sono cose che stanno nel mezzo per lei, tipo quando una persona dice che si risolve tutto facendo cose, o che non prende mai le cose sul serio</b>. Sono cose che non le dicono niente, ma non fanno nemmeno schifo.
            }
    }
    {
        - grimoire_firstChar has grimFirstCharKitchenOne:
            Durante l'incontro in cucina, {charNameOne} ha parlato delle sue relazione. Ha raccontato di aver avuto un'infanzia senza amici, ma con un forte legame con suo padre, che le ha passato l'amore per la musica. E dai suoi ha imparato che le relazioni sono cura e sacrificio. Con l'arrivo al nord ha fatto molte amicizie in Conservatorio, scoprendo però che nei gruppi si litiga, e questa cosa l'ha riempita di conflitti, soprattutto quando il rapporto con un'amica è stato lasciato morire. Crede anche che non ci sia una differenza vera tra amicizia e amore, e che sia un problema per lo più culturale e linguistico, e le complicazioni che nascono vengono dalle parole che ancora mancano per parlare a modo delle relazioni.
    }
    {
        - grimoire_firstChar has grimFirstCharKitchenTwo:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo desiderio di salvare il mondo. E delle sue difficoltà: non si sente brava a parlare di cose politiche, e La Rifugia è nata perché ha potuto vedere un problema concreto e decidere di fare qualcosa, mentre altre parole cariche la fanno sentire inadeguata. E crede che parte di questa inadeguatezza venga dalle dinamiche social e dal giudizio costante. Ritiene che questo tolga la possibilità di sbagliare, ma gli sbagli creano possibilità impreviste. Come il gorgonzola. E poi ha citato la sua amica Valeria, che dice che l'attivismo deve dare piacere, e che a {charNameOne} piace addormentarsi sapendo di aver portato qualcosa di buono nel mondo. E poi: <i>più gorgonzola, meno poliziott3.</i>
    }
    {
        - grimoire_firstChar has grimFirstCharKitchenThree:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo rapporto con la creatività. Ha detto che ci sono cose che sa pensare solo quando compone, e per questo è terapeutico. Ma che è preoccupata perché il lavoro la stanca così tanto che a volte non riesce a comporre nulla. E ha paura di non esistere più se dovesse smettere di creare. Creare per lei poi è come gettare un ponte: sia tra le persone che ha conosciuto, sia tra persone che non si conoscono. Trovare l'universale nel particolare, così da potersi ritrovare.
    }
    {
        - grimoire_firstChar has grimFirstOpenKitchen:
            Aprendo la strada per la cucina, {charNameOne} ha detto che il cibo apre alle confidenze, e che si è ricordata tutte le belle chiacchierate fatte a tavola.

    }
   

-> rewriter_book_with_flow
