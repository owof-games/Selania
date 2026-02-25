=== helping_mentor
{debug: passo da helping_mentor}
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour= translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

{      

    - player_accessiblePlaces has Kitchen && player_accessiblePlaces has Library:
        {shuffle once:
            - La neve sui monti dietro la stazione a volte mi ricorda casa.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - I cespugli della foresta credo nascondano qualche animaletto, ma per ora non ne ho preso nessuno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - All'inizio l'idea di avere anche una biblioteca da mantenere mi innervosiva, ma ora ne sono felice.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - Lo stagno sta cambiando molto dal tuo arrivo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            - La serra è così florida e viva ora.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - Dalla cucina arrivano sempre profumi insoliti. Ve la cavate tutt3 molto bene!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
        }
    
    - player_accessiblePlaces has Kitchen:
        {shuffle once:
            - Non sono mai stata una grande cuoca. Ma amo mangiare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            
            - Il cibo è un momento di unione anche con l'essere che l'ha generato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - La luce che si riflette sull'acqua della cucina è appagante.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - Gli alberi della cucina sono diversi da quelli della foresta, sono più ampi e muschiosi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
        }
      
    //- player_accessiblePlaces has Nest:
        {~ Da piccola amavo leggere, ma dove vivevo non c'erano biblioteche, e per molto tempo avevamo a malapena i soldi per mangiare.|A volte ho questo timore: posso davvero essere una buona mentore, anche se sono poco istruita?|Sono contenta di aver aperto la biblioteca, ma quella poltrona mi invita troppo a riposare, quando invece ci sono mille cose da fare.}#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
        
    - player_accessiblePlaces has Library:
         {shuffle once:
            - Da piccola amavo leggere, ma dove vivevo non c'erano biblioteche, e per molto tempo avevamo a malapena i soldi per mangiare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - A volte ho questo timore: posso davvero essere una buona mentore, anche se sono poco istruita?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - Sono contenta di aver aperto la biblioteca, ma quella poltrona mi invita troppo a riposare, quando invece ci sono mille cose da fare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
        }
    
    //Opinioni presenti da inizio gioco    
    - else:
        {shuffle once:
            - Sinceramente, non so che ne sarebbe di questo luogo senza tutta la manutenzione che devo fare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - Hai notato la bacheca alla stazione dei treni?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            - A volte vorrei che le cose in serra crescessero più velocemente, così da sapere subito se ho sbagliato qualcosa.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

            - A ovest dello stagno c'è spesso un grande baccano, ma fiori e fieno sono troppo alti per poter vedere cosa ci sia da quelle parti.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
        }
}

- (top)
    Come posso esserti utile, {player_pronouns has him: amico mio|{player_pronouns has her: amica mia|amicə miə}}?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
    
        + [Avrei bisogno di una mano.]
            -> support
        
        + {player_somethingStrange > 0 or (firstChar_InkLevel has ink_high && not little_storylets.infoImpo) && you_are_a_rewriter} [Mi è successa una cosa strana.]
            -> little_storylets
    
        + [Ho cambiato idea.]
            -> main

/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 
 === support
    ~ temp mentorName = translator(mentor_ActualName)
    - (top)
    Hai bisogno dei miei consigli?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
    
        + {you_are_a_rewriter}[Mi ripeteresti cosa devo fare?]
            -> to_do
        
        + [Ho una domanda su un luogo.]
            -> mentor_places_comments
        
        + [C'è una cosa che mi riguarda.]
            -> myself
        
        + [Vorrei consigli su come stare meglio.]
            -> mindfulness -> support
    
        + [Vorrei parlare d'altro.]
            -> helping_mentor.top
        -
            -> top   

    = myself
    ~ temp mentorName = translator(mentor_ActualName)
        Di cosa senti il bisogno?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            
            + [Vorrei cambiare il mio nome.]
                    -> name_choice -> support
            
            + [Vorrei cambiare i miei pronomi.]
                    -> gender -> support
            
            + [A dire il vero sono a posto così.]
                    -> helping_mentor.top
 
 

/* ---------------------------------

    Mentore utile: contenuti
       
 ----------------------------------*/

=== mentor_places_comments
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour= translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

//Strutturare come wave sintetica?
    Questi sono i luoghi che conosci.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
    Su quali vorresti avere informazioni?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral

- (top)

    + [Sulla stazione.]
            Intendi il luogo dove passo ore a spalare neve?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
            La stazione, ad est della foresta, è il posto dove approdano le nuove persone.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            {contentsTrainStop has FirstCharacterNotes or contentsTrainStop has SecondCharacterNotes: E dove arriva la cagnolina postina.}
            È anche il luogo attraverso cui potrai raggiungerci.
            O da cui andartene, quando vorrai.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_sad
                -> top

    + {greenhouse_entry_check}[Sulla serra.]
            La serra è il mio posto preferito: ho sempre amato coltivare fiori e piante!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
            Anche se lì dentro cresce della roba molto strana.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            La serra è un piccolo posto di meditazione.
            Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
            Tipo: come fa {mentorName} a tenere i vetri sempre così puliti?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                -> top

    + {forest}[Sulla foresta.]
            La foresta è un po' il nostro posto di passaggio.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            Non ho idea di chi abbia messo la panchina, sinceramente.
            E tenerla pulita tutti i giorni è una gran fatica.
            E quella pianta, quella cosa che è nel mezzo {firstChar_storyStatus == story_storyEnded or secondChar_storyStatus == story_storyEnded: non ho ancora capito come abbia iniziato a crescere.|non ho ancora capito come rimetterla in sesto.}
            E questo mi lascia molto frustrata.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_bored
            -> top
    
    + {pond}[Sullo stagno.]
            Lo stagno è un posto umido.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            E a modo suo rilassante.
            Serve ad arrivare alla serra.
            {
                -player_accessiblePlaces has Kitchen: 
                    E ad accedere alla cucina.
            }
            {
                - contentsPond has TheFrog:
                    E poi c'è quella rana. #speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_bored
            }
            -> top    
            
    + {(player_accessiblePlaces has Library) or (player_accessiblePlaces has Kitchen) or (player_accessiblePlaces has Nest)}[Sono altri i luoghi di cui vorrei parlare.]
            -> second_top
    
    + [Voglio parlare d'altro.]
        -> helping_mentor.top  

    
- (second_top)    
    + {player_accessiblePlaces has Library}[Sulla biblioteca.]
            La biblioteca è un posto... un posto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
            Ci sono molti racconti, ma chi ha il tempo di leggerli?##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_hurry
            Con tutta quella polvere che raccolgono, poi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_sad
            Però un paio di volte ho usato la poltrona per fare del body scan, e non è stato male.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Mi sono quasi addormentata.
            Quasi.
                -> second_top
            
    + {player_accessiblePlaces has Kitchen}[Sulla cucina.]
            La cucina è un posto poco igienico.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_bored
            No, ricominciamo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_sorry
            La cucina è un posto dove condividere un po' di intimità con una persona.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Provare a conoscerla meglio, provare a farti conoscere meglio, mentre cucinate qualcosa.
            E, magari, scoprire cosa stai sbagliando a dirle, e riuscire a conquistare prima la sua fiducia.
                -> second_top

    + {player_accessiblePlaces has Nest}[Sul nido.]
            Il nido non mi piace.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_bored
            Quello che accade lì è manipolazione, comunque tu la voglia mettere.
            E quindi è qualcosa di sbagliato.
            Non è un caso che sia l'unico luogo senza istruzioni, no?
                -> second_top
    
     + {player_accessiblePlaces has Dump}[Sulla discarica.]
            COMMENTO DA CREARE SULLA DISCARICA.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_bored
                -> second_top

    + [Vorrei parlare di un altro luogo.]
            -> top
    
    + [Vorrei parlare di qualcosa di diverso.]
        -> helping_mentor.top
    -

    -> helping_mentor.top

=== to_do
~ temp mentorName = translator(mentor_ActualName)

        {you_are_a_rewriter:La prima cosa da fare è: conquistare la <b><i>fiducia</b></i> della persona che devi aiutare.}#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
        {you_are_a_rewriter:Ci <b><i>parli</b></i>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.}
        {ink_and_rewriting: Fino a quando non è pronta per una <b><i>riscrittura</b></i>}
        {ink_and_rewriting: A quel punto inizi i tuoi <b><i>riscritture</b></i>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.}
        {ink_and_rewriting: Più inchiostro hai, più riscritture puoi fare.}
        {about_greenhouse: Per aumentare l'inchiostro puoi fare cose diverse. Come dare il giusto dono. E i doni migliori crescono nella serra.}
        {about_kitchen: E se mangiate qualcosa assieme, magari riesci anche a capire se stai o meno conquistando la fiducia di quella persona.}
        {ink_and_rewriting: Così, a fine riscrittura, in base alle cose che avrai detto, la persona sceglierà il suo <b><i>nuovo nome</b></i>.}
        {ink_and_rewriting: E poi si ricomincia.}
           -> helping_mentor.top



=== little_storylets
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Vorrei raccontarti una cosa strana.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

        * (voices){growing_check}[C'è una voce che mi racconta cose.]
            Voce?##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Sì.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Ad esempio mi descrive le piante della serra.
            O i luoghi in cui entro.
            Riscrivere la storie di altre persone richiede una forte empatia.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
            Sicuramente quella voce è il tuo modo di capire questo luogo.
            Un intuito latente che ora è più forte.##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Meglio della stanchezza dell'essere mentore, fidati.##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_hurry
                ~ player_somethingStrange --
                -> helping_mentor.top
                
        * (infoImpo){(firstChar_InkLevel has ink_high) or (secondChar_InkLevel has ink_high)} [Le personagge hanno informazioni importanti?]
            Dove l'hai sentita questa cosa, stellina?##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Quando stavo per fare le ultime domande a {charNameOne}, {voices:la|una} voce mi ha detto quanto inchiostro avevo e che avrei ricevuto una informazione importante.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            {not voices:Per la voce sarà la stanchezza, questo lavoro è faticoso.|Come ti dicevo, vedrai che è solo la tua empatia che parla.}##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_sad
            Comunque ogni cosa qui è importante, {player_name}.##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            Soprattutto se ti aiuta a raggiungere il tuo obiettivo.
                ~ player_somethingStrange --
                -> helping_mentor.top
        
        * (talkingWitch) {witch_intro} [Prima ho parlato con le radici nella foresta.]
            Sembra che vedano e sentano tutto quello che accade qui.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            E mi hanno chiesto come stavo dopo aver concluso la prima riscrittura.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            {infoImpo or voices:Stellina, di nuovo con questa voce?|Senti le voci, stellina?}##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_sad
            Sono in questo posto da non so quanto e non ho mai parlato con tronchi o rami o radici.##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
            Il tuo aiuto.
            Se senti ancora una volte delle voci, prenditi un po' di riposo.
                ~ player_somethingStrange --
                -> helping_mentor.top
        
        * (talkingFrog) {contentsPond has TheFrog} [C'è una rana blu parlante.]
            {
                - are_entities_together_in(Mentor, PG, Pond):
                    Ho notato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    {
                        - frog_and_mentor_chit_chat: 
                            E dopo averci parlato, non mi ispira molta fiducia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_bored
                            {
                                - are_two_entities_together(TheFrog, PG):
                                    Hai provata ad espirarla?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    Una volta ho espirato un insetto così grosso che ha fatto un rumore come di botto.
                                    E mi sono spaventato per il rumore.
                                    E a quel punto l'insetto si è spaventato a sua volta ed è finito nel naso di Tullio.
                                    Credo sia ancora lì dentro.
                                    Appunto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                            }
                    }
                    Quando me ne ha parlato {charNameTwo}, ho pensato fosse una bugia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            Ehi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    }
                    Invece me ne sono ricreduta.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                
                - else:
                    {
                        - frog_and_mentor_chit_chat: 
                            Ci ho parlato prima. E non mi ispira molta fiducia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        - else: 
                            Ho notato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral    
                    }
                    Molte cose qui stanno cambiando dal tuo arrivo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    Immagino che una rana parlante non sia la cosa più assurda che potesse capitarci, vero?  
            }
                ~ player_somethingStrange --
            -> helping_mentor.top
        
        * {foundLibro or take_this_book} [Ho trovato questo libro col mio nome.]
            E raccoglie informazioni su questo posto.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            E dove l'hai trovato?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
            {foundLibro: Sotto quel vecchio tronco alla foresta.|Me l'ha dato {charNameOne}.}#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Interessante.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
                {
                    - player_accessiblePlaces has Library:
                        Forse verrà dalla biblioteca?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
                    - else:
                        Avevo sentito parlare in passato di una biblioteca.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_neutral
                        Forse viene da lì?    
                }
            Immagino sia comunque utile per il tuo lavoro.
            Spero solo non parli male di me!##speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)}#portrait:mentore_sad
                -> helping_mentor.top
        
        + [Ripensandoci, non ho nulla di nuovo da dire.]
            -> helping_mentor.top
   


 === mindfulness
 //Randomizzo i contenuti e nel caso posso usare anche qui i trigger warning.
 LIST mentor_actualMindfulness = firstMind, secondMind, thirdMind, fourthMind, fifthMind
 VAR mentor_lastMindfulness = 0
 VAR mentor_pauseMindfulness = 10
 
 {
    - mentor_lastMindfulness > 0:
        {
            - mentor_actualMindfulness has firstMind:
                -> one
            - mentor_actualMindfulness has secondMind:
                -> two
            - mentor_actualMindfulness has thirdMind:
                -> three
            - mentor_actualMindfulness has fourthMind:
                -> four
            - mentor_actualMindfulness has fifthMind:
                -> five
        }
    
    - else:
        ~ mentor_lastMindfulness = mentor_pauseMindfulness
        ~ mentor_actualMindfulness = ()
        
         {shuffle:
            - 
                ~  mentor_actualMindfulness += firstMind
                -> one
            - 
                ~  mentor_actualMindfulness += secondMind
                -> two
            - 
                ~  mentor_actualMindfulness += thirdMind
                -> three
            - 
                ~  mentor_actualMindfulness += fourthMind
                -> four
            - 
                ~  mentor_actualMindfulness += fifthMind
                -> five               
         }
 
 }
 
    = one
     ~ temp mentorName = translator(mentor_ActualName)
     
        Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        Inizio ad osservare un oggetto e a dirmi dentro la testa cosa è.
        Una sedia, uno sgabello, un frigorifero, un tostapane, una lavatrice.
        Se la confusione è molta, cerco di partire con il generico, come <i>elettrodomestico</i>, e poi man mano che divento più concentrata inizio a scendere nel dettaglio.
        Se ci sono poche cose, provo a descrivere le parti di un oggetto.
        O del mio corpo.
        Cosa che evito nei giorni in cui non mi piaccio.
        Questa cosa funziona benissimo anche con gli odori, o i suoni, o il tatto, o persino il gusto.
        Ti aiuta a tornare coi piedi per terra.
            ->->
    
    = two
     ~ temp mentorName = translator(mentor_ActualName)
     
        Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        Una cosa che mi aiuta in queste situazioni è puntare una sveglia ogni due ore.
        E quando la sveglia suona provo a chiedermi:
        Come mi sto sentendo?
        Cosa sto facendo?
        Perché mi fa sentire così?
        Se mi rendo conto di star provando una emozione negativa, posso capire meglio cosa l'ha scatenata.
        Ma spesso mi rendo conto di essere serena in quel momento, o per lo meno tranquilla.
        E a quel punto capisco che non è vero che sto male tutto il giorno, ma che ci sono delle cose che non mi fanno stare bene.
        ->->
    
    = three
     ~ temp mentorName = translator(mentor_ActualName)
     
         Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral 
         Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
         Può essere il bracciolo di una sedia.
         Il tavolo.
         Il palo sull'autobus.
         Stringi e concentrati sulla sensazione.
         Questo ti permette di tornare in contatto col tuo corpo.
            ->->
    
    = four
     ~ temp mentorName = translator(mentor_ActualName)
     
        Il mio migliore amico è il body scan.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        Lo faccio al risveglio tra gli arbusti della foresta.
        Prima di tutto mi stendo, comoda, e faccio qualche respiro profondo.
        Poi inizio a concentrarmi sulla punta di uno dei piedi, e da lì sposto la concentrazione lungo tutto il piede, la caviglia, il polpaccio, il ginocchio, il quadricipite.
        Poi faccio la stessa cosa con l'altra gamba.
        E a quel punto mi sposto sul ventre, i glutei, i muscoli lombari, i dorsali, le spalle e via di seguito fino alla testa.
        Anche se conosco persone che preferiscono partire dalla testa e arrivare ai piedi.
        L'importante è che per tutto il processo ascolti quella parte del corpo senza giudicare, senza cercare di cambiarla.
        Respiri, accogli dolori e morbidezze, e quando te la senti, cambi area.
        Anche solo a parlarne mi sento già più rilassata.
            ->->
        
    = five
     ~ temp mentorName = translator(mentor_ActualName)
     
        Non so se ti capita di avere l'addome contratto.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
        Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
        Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
        Aiutandoti così a rilassare l'area.
        E a respirare meglio.
            ->->     

