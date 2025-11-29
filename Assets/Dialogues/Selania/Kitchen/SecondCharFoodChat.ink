/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
=== pre_start_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Quando cuciniamo? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Quando cuciniamo? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
    Cuciniamo ora?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_emotional

        + [Iniziamo!]
            -> cooking_with_second_char
        
        + [Ti chiedo ancora un attimo {charNameTwo}.]
            -> main
  
 
 
=== cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    -> storage_colors(SecondCharacter)->
    -> cooking_animations_on ->
    
    Sai {charNameTwo}, mentre cuciniamo potremmo parlare un po'.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        - (top)
    
    In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più... #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

            + [Parliamo di animali.]
                    -> first_theme
                    
            + [{second_char_main_storylets.six: Della scuola.|<i>{player_name} deve parlare ancora con {charNameTwo} per sbloccare questo tema.</i>}]
                {
                    - second_char_main_storylets.six:
                        -> second_theme
                    
                    - else:
                        -> top
                }
            
            + [{second_char_main_storylets.eight: Delle bugie.|<i>{player_name} deve parlare ancora con {charNameTwo} per sbloccare questo tema.</i>}]
                {
                
                    - second_char_main_storylets.eight:
                        -> third_theme
                    
                    - else:
                        -> top
                }
            
            + [Ho cambiato idea.]
            -> main

    
    = first_theme
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Animaliiiiiiiiiiii!
        A casa ho una vecchia enciclopedia, era del papà, che è piena di disegni e cose sugli animali.
        E poi a un mercatino abbiamo trovato una vecchia collezione di riviste sugli insetti.
        Poi ho dei modellini di dinosauri.
        Che però ultimamente non mi piacciono più.
        Mentre mi piace disegnare animali inventati mettendo assieme pezzi diversi.
        Il mio preferito è il prociorso, che è un po' procione e un po' orso e mangia il miele ma lo puoi coccolare.
        Perché l'orso ti mangerebbe la mano.
        Papà dice che sono fissato, ma mio fratello dice che sono molto intelligente e quindi è normale.
        Ci mettiamo anche il cioccolato?
        Una volta ho fatto uno spettacolo a casa con il teatrino i disegni e gli animali inventati.
        Quando faccio queste cose chiamo tutta la famiglia.
        E mi fanno i complimenti e ridono però non lo so.
        Mi sembra che i grandi le cose le fanno perché devono.
        Non lo so mica se si divertono davvero.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -    
        
        Ho una fame!
        Ho anche trovato del cacao!
        Ma a te come ti piace divertirti?

            {
                - not cooking_with_first_char: {player_name} prova a parlare, ma non escono le parole. Però gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        
            + [Preparo una base per biscotti sportivi.]
                ~ kitchen_recipeNoun = "Biscotti"
                Bleah.
                Non i biscotti.
                Ma lo sport.
                Bleah!
               
            + [Stendo della sfoglia per brioches giocose.]
                ~ kitchen_recipeNoun = "Brioches"
                E a chi giochi?
                A me piace tantissimo fare quelli di intelligenza ora.
                Quando sono a casa di mio fratello posso starci tutto il tempo che voglio!
             
            + [Impasto un preparato per crostate socievoli.]
               ~ kitchen_recipeNoun = "Crostata"
               Nel senso che stai sempre con le persone?
               Sempre?
               Anche dopo la scuola e il lavoro?
        
            + [Pulisco le formine per gelati artistici.]
                ~ kitchen_recipeNoun = "Gelato"
                Mmm.
                So che è roba che piace a {charNameOne}.
                A me mi piace fare le cose.
                Ma non so se mi piace guardarle.
    
            + [Raffreddo la frutta per sorbetti sonnacchiosi.]
                ~ kitchen_recipeNoun = "Sorbetto"
                {first_second_chit_chat: Ancora con questa cosa del dormire!|Che balle dormire!}
                Ci sono così tante cose da fare!
                Che noia!
            -
        Posso schiacciare qualcosa?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Mi piace schiacciare le cose perché alcune vanno dappertutto, altre fanno l'olio, altre sembrano dei dischi volanti!    
        E mi piace prevedere cosa succederà.
        Mi piacciono le cose che si possono prevedere.
        Anche per questo mi piacciono gli animali.
        Non è che un leone all'improvviso fa il ragioniere.
        O un coniglio diventa campione di videogiochi.
        E poi gli animali non sono cattivi.
        Fanno le cose che devono fare.
        E litigano per le cose importanti per loro.
        Ma non fanno male solo perché gli piace fare male.
        A parte i gatti.
        Che non mi piacciono.
        Però mi piace immaginare le persone come animali.
        Mi aiuta a capirle.
        E a prevedere di più cosa faranno.
        {charNameOne} per esempio mi ricorda un quokka perché con me è sempre giocosa.
        Mentre {mentorName} mi sembra un delfino perché sono simpatici fino a quando non sai cosa fanno davvero.
        E tu invece.
        No, dimmelo tu.
        Che animale sei?

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        Il profumo è buono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma quindi mangiamo solo dolce oggi?
        Questa è una cosa bellissima!
        Ma tu capisci sempre le persone?
        
            + [Aggiungo del caramello della perplessità.]
                ~ kitchen_recipeAdjective = "della perplessità"
                Anche io.
                Sono così difficili.
                È come capire degli animaletti strani.
                Come l'aye-aye o il rinopiteco.
                Ma almeno quello so che se piove starnutisce.
                Mentre mamma a volte è felice e a volte si arrabbia.

            + [Spolvero del cacao della convinzione.]
                ~ kitchen_recipeAdjective = "della convinzione"
                Magari mentre siamo assieme capisco qualcosa da te allora.
                Magari.
             
            + [Verso dello sciroppo della negazione.]
               ~ kitchen_recipeAdjective = "della negazione"
                Magari allora puoi provare anche tu con gli animali.
                O un'altra cosa che ti piace.
                L'amico di mio fratello usa i segni zodiacali.
                Che non hanno assolutamente senso.
                Contento lui.
                
            + [Grattugio della noce della vicinanza.]
                ~ kitchen_recipeAdjective = "della vicinanza"
                Si no boh.
                Le persone vicine mi sembrano ancora più incasinate.
                Per loro devo avere almeno tre animali per capirle.
    
            + [Mescolo della vaniglia della solitudine.]
                ~ kitchen_recipeAdjective = "della solitudine"
                Già.
                Si no boh.
                Quindi capita anche alle altre persone.
                Wow.
            -      

        Intanto preparo del succo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Ma non con le cose della serra, perché fanno cose strane.
        A me piacciono le cose strane.
        Ma le persone mi dicono sempre che sono strano.
        La cosa che mi dicono di più a casa è "Ma perché fai così?!?!"
        Con un sacco di gesti delle mani.
        E io provo a spiegarlo ma mica mi capiscono.
        E poi si arrabbiano perché mi dicono delle cose ma non sono davvero le cose che vogliono.
        I grandi sono strani.
        Ti dicono una cosa ma ne vogliono un'altra e quindi tu sbagli sempre alla fine.
        E dicono a me che sono strano.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        No non mettere lo zucchero a velo, non mi piace.
        Mi fa venire la tosse e poi mi sporco tutto!
        A me non piace essere strano.
        Io voglio essere {charNameTwo}.
        Nessuno dice a {mentorName} che è strana.
        Se si preoccupa tantissimo per qualcosa, {charNameOne} dice solo "Che ci vuoi fare, è {charNameTwo}".
        Voglio solo essere me.
        A te ti piace come ti trattano le altre persone?

            + [Guarnisco con delle ciliege deluse.]
                ~ kitchen_recipeComplement = "con ciliege deluse"
                A mamma piace tanto quella parola.
                Delusa.
                Di solito quando dice "{charNameTwo}, mi hai delusa."
                Poi le ciliege deludono sempre.
                Te le ricordi più buone.
                Poi le mangi e bleah!
               
            + [Decoro con della granella soddisfatta.]
                ~ kitchen_recipeComplement = "con granella soddisfatta"
                Deve essere bello.
                Come l'amico di mio fratello.
                Mio fratello dice che ha un cuore grande e gli vogliono tutti bene.
             
            + [Rifinisco con della glassa sofferente.]
               ~ kitchen_recipeComplement = "con glassa sofferente"
                Mmm.
                Mi dispiace.
        
            + [Aggiungo delle crema migliorante.]
                ~ kitchen_recipeComplement = "con crema migliorante"
                Nonna dice che tutto migliora, sempre.
                Però a me interessa più che una cosa arriva da qualche parte.
                Mica puoi migliorare all'infinito.
                Non c'ha senso.
    
            + [Spalmo della confettura altalenante.]
                ~ kitchen_recipeComplement = "con confettura altalenante"
                Cioè che dipende dalle persone?
                O dalla persona?
                Tipo mamma che un giorno ti adora e poi il giorno dopo non ti parla più?
            - 
        
        Mi sa che questo dolce lo faccio anche a mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            -> fourth_ingredient_dispatcher
    
    = second_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

            Bleah.
            Ma questa è una punizione!
            La scuola fa schifo.
            Ed è tutto lento.
            Mi annoia tantissimo.
            A scuola sono sempre in punizione.
            O prendo le note.
            Ma mi annoio.
            Mi annoio.
            Quando ci sono i compiti finisco subito.
            E non so cosa fare.
            A volte leggo.
            A volte faccio cadere le cose per raccoglierle.
            O vado in bagno.
            Ma si può andare in bagno solo una volta per lezione.
            Che è una cosa stupida.
            E infatti una volta Cristian della terza si è fatto la pipì addosso.
            Mettiamo le noccioline?
            Le punizioni sono stupide.

                + [Scelta blu]
                    -> color_variation_management(SecondCharacter, blueC)->
                
                + [Scelta gialla]
                    -> color_variation_management(SecondCharacter, yellowC)->
                
                + [Scelta rossa]
                    -> color_variation_management(SecondCharacter, redC)->
            
                + [Scelta verde]
                    -> color_variation_management(SecondCharacter, greenC)->
        
                + [Scelta viola]
                -> color_variation_management(SecondCharacter, purpleC)->
            -
            
            Possiamo usare la grattugia?
            Mi piace tanto grattugiare le cose!    
            Mi puniscono, ma poi sono il più bravo.
            Che è una cosa ancora più stupida.
            Tu sei {player_pronouns has him:il più bravo|{player_pronouns has her:la più brava|lə più bravə}} in quello che fai?

                {
                    - not cooking_with_first_char: {player_name} prova a parlare, ma non escono le parole. Però gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                }
            
            + [Preparo un mediocre stampo da cupcake.]
                ~ kitchen_recipeNoun = "Cupcake"
                    Nonna dice sempre che la virtù sta a metà.
                    Mamma dice che è una frase da perdenti.

            + [Pulisco le migliori formine da muffin.]
                ~ kitchen_recipeNoun = "Muffin"
                    Sii.
                    Tra migliori ci capiamo!!!
             
            + [Infarino la peggior teglia per tartellette.]
               ~ kitchen_recipeNoun = "Tartellette "
                    Uh.
                    Io tipo sono il peggiore a ginnastica.
                    Solo Lara è peggio di me.
                    Ma mi batte a inglese.
        
            + [Riscaldo l'unica piastra da waffle.]
                ~ kitchen_recipeNoun = "Waffle"
                    Sulla cima.
                    Anche io ci arrivo.
                    Sì sì.
    
            + [Controllo una disperata teglia da plumcake.]
                ~ kitchen_recipeNoun = "Plumcake"
                    Mi sembra piena di buchi, {player_name}.
                    Che vuole dire?
                    Non capisco.
            -  

            Per un po' a scuola hanno tolto i voti.
            Le maestre dicono che se guardiamo i voti poi non impariamo, cerchiamo solo di vincere.
            Cosa, non l'ho capito.
            Però alcune mamme si sono arrabbiate.
            Anche la mia.
            Posso assaggiare l'impasto?
            {charNameOne} ha lasciato solo cose vegane.
            Però sono buone!
            Se c'è una cosa che mi fa arrabbiare della mamma, è che quando si tratta di scuola lei sa solo arrabbiarsi.
            Se torno con un bel voto mi dice "Hai fatto il tuo dovere!" e poi torna a fare le sue cose.
            Ma se combino qualcosa, vengo punito.
            E poi dice a tutti che sono bravo.
            Quando siamo in giro dice "Come sono orgogliosa di {charNameTwo}, è il più bravo della classe!"
            E ho visto che se faccio un casino, più è grosso il casino più dice che sono bravo a scuola.
            Ma poi a casa si arrabbia.
            Mio fratello dice che non devo ascoltare mamma, perché non serve essere i più bravi, ma essere brave persone.
            Mamma dice che lui parla facile perché non ha nemmeno finito le superiori.
            Nonna dice che serve essere furbi.
            Io non so mica se posso essere tutte queste cose.

                + [Scelta blu]
                    -> color_variation_management(SecondCharacter, blueC)->
                
                + [Scelta gialla]
                    -> color_variation_management(SecondCharacter, yellowC)->
                
                + [Scelta rossa]
                    -> color_variation_management(SecondCharacter, redC)->
            
                + [Scelta verde]
                    -> color_variation_management(SecondCharacter, greenC)->
        
                + [Scelta viola]
                -> color_variation_management(SecondCharacter, purpleC)->
                -
            
            Ho trovato della cannella!
            Mi piace la cannella.
            Possiamo metterla?
            Papà dice che lui è bravo a lavoro perché è capace di fare le cose sotto pressione.
            E che il capo all'inizio diceva che era uno che <i>cazzeggiava</i>, ma poi ha visto che corre tantissimo con le scadenze.
            A me la pressione non mi piace.
            Mi agita.
            Mio fratello invece dice che lavora bene quando c'è tanto casino.
            E te?
            Magari poi io parlo tanto e tu cucini e ti agiti?
        
                + [Trito della menta isolata.]
                    ~ kitchen_recipeAdjective = "dell'isolamento"
                    Deve essere difficile questo lavoro allora.
                    Perché c'è sempre gente in giro.
                    E devi parlare con noi.
                
                + [Sbuccio della vaniglia frenetica.]
                    ~ kitchen_recipeAdjective = "della frenesia"
                    Un po' come {mentorName} allora.
                    Che corre sempre da una parte all'altra.
                
                + [Spremo del cedro organizzato.]
                    ~ kitchen_recipeAdjective = "dell'organizzazione"
                    Io ci provo a organizzarmi.
                    Ma non mi viene benissimo.
                    Voglio fare le cose con calma.
                    Ma poi finisco nel caos.
            
                + [Setaccio della cannella ritardataria.]
                    ~ kitchen_recipeAdjective = "del ritardamento"
                    Lara in classe fa sempre così.
                    Arriva sempre il giorno dopo coi compiti.
                    La maestra dice che Lara si dimenticherà la testa a casa un giorno.
        
                + [Frullo del caffè caotico.]
                    ~ kitchen_recipeAdjective = "della caoticità"
                    Io non posso bere il caffè.
                    Mamma dice che faccio già abbastanza casini da solo.
                    Però conosco il caos.
                -      

        Mi sa che mi preparo del succo.
        A te ti piace?
        C'è una cosa che voglio dirti.
        E che dico solo a te.
        Perché sembra triste.
        Ma non mi piace quando le persone sono tristi per me.
        A scuola ho un posto segreto.
        C'è una porticina che si nasconde nel muro, e che porta sotto il tetto.
        E lì c'è un sacco di polvere e scatole.
        Ma ci sono le finestre e c'è luce.
        E allora mi metto lì a leggere.
        A volte durante l'intervallo, così mi lasciano in pace.
        A volte anche durante le lezioni.
        E mi prendo le note.
        Ma non mi hanno ancora scoperto.
        Ci ho letto tutto "La storia infinita".
        Due volte.
        E un libro sugli insetti della città che mi ha dato mio fratello.
        È il mio posto segreto.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        Che profumino!
        Mi sa che manca poco.
        Posso assaggiare?
        Scotta!
        Però ora che ci penso.
        Così sembra che le persone non mi piacciono.
        Ma a me piacciono tanto, {player_name}.
        Solo che non le capisco.
        Mi piace stare da solo.
        Ma non mi piace sentirmi solo.
        E boh.
        Forse sono qui perché mi sento solo.
        Magari con te capisco come fare?
        Tu ti senti {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}?

            + [Do una spolverata di moltissimo cacao.]
                ~ kitchen_recipeComplement = "con moltissimo cacao"
                Però ora hai me!
                E {charNameOne}!
                E me!
                
            + [Incorporo un poco di marmellata.]
                ~ kitchen_recipeComplement = "con poca marmellata"
                In effetti già qui hai fatto tante amicizie, vero?
                Anche con me.
             
            + [Non aggiungo nulla.]
               ~ kitchen_recipeComplement = "senza guarnizioni"
                Woah.
                Deve essere bello.
                Spero di essere anche io tuo amico!
        
            + [Spennello della glassa solitaria.]
                ~ kitchen_recipeComplement = "con glassa solitaria"
                Mio fratello è uno solitario.
                Dice che è un orso.
                Anche il suo amico dice che è un orso.
                E poi ridono.
                Non ho mica capito perché.
    
            + [Farcisco con pochi ma affidabili pezzetti di cioccolato.]
                ~ kitchen_recipeComplement = "con affidabili pezzetti di cioccolato"
                Come nonna.
                Che dice che la vita ti da un grande amore, due grandi amicizie, tre grandi rotture di gatto.
                Non abbiamo un gatto.
                Quindi non ne ho rotto nessuno.
            -  
        
        Sono contento che parli di cose serie con me.
        Gli adulti pensano che i bambini siano stupidi.
        Ma sappiamo tantissime cose.
        Ma ora ho fame.
            -> fourth_ingredient_dispatcher
    
    
    = third_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Mi vuoi sgridare di nuovo?
        Ti ho già chiesto scusa.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -  
        Scusami comunque.
            {
                - food_gift_second_char:
                    Sono contento di aver fatto pace con {mentorName}.
                    Ma sono ancora un po' arrabbiato.
                    E questo mi fa arrabbiare velocemente.

                - about_violence_and_peace:
                    Sto ancora cercando di non essere arrabbiato con {mentorName}.
                    E non mi piace essere arrabbiato.
                    Mi fa arrabbiare di più.

                - else:
                    Sono ancora arrabbiato con {mentorName}.
                    E non mi piace essere arrabbiato.
                    Mi fa arrabbiare di più.
            }

        Facciamo qualcosa con la frutta?
        Mamma pensa che mangio solo schifezze.
        Ma la frutta mi piace.
        C'è una cosa che mi fa arrabbiare tanto tanto quasi si parla di bugie.
        Perché in casa sembra che sia solo io a dire le bugie.
        Ma mamma ne dice tante.
        E le sue sono brutte.
        Perché non dice mai cose giganti.
        No.
        Lei dice che non ha fatto cose che ha fatto.
        Cose che non ha fatto a me.
        O mi dà la colpa per cose che ha fatto lei.
        E quando lei dice qualcosa, papà le crede sempre.
        E nonna non le crede, ma mi dice che fa finta di crederci per non litigare.
        Le sue bugie fanno male.
        Le mie no.
        Tutte le bugie sono sbagliate?

            {
                - not cooking_with_first_char: {player_name} prova a parlare, ma non escono le parole. Però gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        
            + (bugie_innocenti) [Sbuccio delle pesche innocenti.]
                ~ kitchen_recipeNoun = "Pesche"
                Esatto!
                Ci sono bugie che non fanno male a nessuno.
                E sono anche carine!
               
            +(bugie_omesse) [Affetto delle mele omesse.]
                ~ kitchen_recipeNoun = "Mele"
                Come quando non dici che hai fatto una cosa.
                Fino a quando non ti scoprono.
                Però poi finisci nei guai.
                Grossi.
             
            + (bugie_difensive)[Taglio delle pere difensive.]
               ~ kitchen_recipeNoun = "Pere"
               A scuola servono le bugie per difendersi.
               Tantissime.
               Le maestre pensano sempre che hai fatto qualcosa di brutto.
        
            + (bugie_nessuna)[Sciacquo delle prugne impeccabili.]
                ~ kitchen_recipeNoun = "Prugne"
                Si no boh.
                Nessuna persona non dice le bugie.
                Anche perché ci ricordiamo sempre le cose diverse da come sono.
                Magari <i>pensi</i> di non dire bugie.
                Ma le dici comunque.
    
            + (bugie_autoinganno)[Spremo delle arance dell'autoinganno]
                ~ kitchen_recipeNoun = "Arance"
                Come quando mi dico che a ginnastica sono stato bravo.
                Anche se sono caduto con la faccia sulle scarpe di Tommaso.
                Che schifo!
            -  
        Posso assaggiare?
        Comunque i grandi fanno un sacco di regole.
        Ma poi le rompono tantissimo.
        E poi sgridano noi bambini se lo facciamo.
        Ci metto della menta.
        Ecco.
        A scuola ho un soprannome.
        Un soprannome brutto.
        Perché una volta ho detto una bugia così grossa che tutti si sono arrabbiati.
        E ora c'ho questo soprannome addosso.
        Lo so che dico tantissime bugie.
        A volte non me ne accorgo nemmeno.
        Ma.
        Mmm.
        Nonna dice sempre che "ma" è amico del diavolo.
        Ma con le bugie le persone mi ascoltano.
        E poi.
        La mia vita è.
        Non è che le mie cose piacciono agli altri bambini.
        Non posso vedere i cartoni.
        Non ho i fumetti.
        Ho pochissimi giochi.
        Posso giocare ai videogiochi di mio fratello, ma non sono quelli dei miei compagni.
        Io non so cosa dire.
        E quindi o sto da solo, o devo dire bugie.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        Guarda!
        La frutta piace anche ai pesci!
        Che faccia buffa quello!
        Ci sono compagni che piacciono a tutti.
        Lara ha un sacchissimo di amiche!
        Jin è il primo che viene cercato ogni volta che si gioca a qualcosa.
        Tommaso è antipatico invece.
        Ma la sua famiglia è ricca.
        E ha la piscina e tantissimi giochi.
        A te cosa ti rende interessante?

            + [Shakero un bicchiere vuoto.]
                ~ kitchen_recipeAdjective = "del vuoto"
                Non è vero!
                Abbiamo già parlato tantissimo!
               
            + [Aggiungo della lavanda empatica.]
                ~ kitchen_recipeAdjective = "dell'empatia"
                Come quando io mi faccio male e tu senti dolore?
                Deve essere faticoso!
             
            + [Grattugio della scorza di chinotto sportivo.]
               ~ kitchen_recipeAdjective = "della sportività"
                Magari conosci Jin.
                O suo fratello.
                Il fratello di Jin è ENORME!
                È campione di sollevamento pesi.
                Una volta mi ha alzato con una sola mano!
        
            + [Misuro dell'acqua di rose erudita.]
                ~ kitchen_recipeAdjective = "dell'erudizione"
                Anche a me piace sapere le cose.
                Ma poi devi trovare le persone a cui piacciono le cose che piacciono a te.
                O ti dicono che sei strano.
    
            + [Macino del pepe rosa divertito.]
                ~ kitchen_recipeAdjective = "del divertimento"
                Scherzi e battute!
                Ma lontano dalle maestre.
                E da {mentorName}.
            -      
    
        Bleah.
        Le spezie sono strane.
        Nei cibi sono buone.
        Ma da solo fanno bleah.
        A mio fratello non dico mai bugie.
        E inventiamo tante storie.
        Mio fratello mi dice che le storie sono delle bugie condivise.
        E per questo non fanno male.
        Una volta era triste.
        E mi ha detto che le persone creano cose per mentire.
        Per dirsi che possono esistere cose diverse da quelle che si hanno.
        E che l'arte è una bella bugia per farci andare avanti quando le cose fanno schifo.

            + [Scelta blu]
                -> color_variation_management(SecondCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(SecondCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(SecondCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(SecondCharacter, greenC)->
    
            + [Scelta viola]
               -> color_variation_management(SecondCharacter, purpleC)->
            -
        
        Con la frutta avanzata ci preparo un succo!
        A me non mi piacciono i grandi.
        E so che devo diventare grande.
        Ma mi fa paura.
        L'unica cosa bella di diventare grande è che posso avere una casa tutta per me.
        E comprarmi uno struzzo senza che la mamma rompa.
        Voglio andare a scuola su uno struzzo.
        Non è vero che gli struzzi sono stupidi.
        Fanno delle cose che non capiamo, ma che per loro sono fondamentali per sopravvivere.
        Come dire bugie quando sei un bambino.
        Per te cosa significa essere grande?
        
            + [Unisco della cioccolata angosciata.]
                ~ kitchen_recipeComplement = "con cioccolata angosciata"
                Vedi?
                Perché dovrei diventare grande?!?
               
            + [Caramello delle scorze di limone indipendente.]
                ~ kitchen_recipeComplement = "con limone indipendente"
                Perché fai quello che vuoi?
                Questo è bello.
                Per lo struzzo.
                E magari anche una volpe.
                E una lontra.
                I grandi possono avere uno zoo?
             
            + [Guarnisco con marshmallow responsabili.]
               ~ kitchen_recipeComplement = "con marshmallow responsabili"
               Sì no boh.
               Anche i bambini sono responsabili.
               Quindi non è tanto diverso no?
        
            + [Spolvero dello zenzero fallito.]
                ~ kitchen_recipeComplement = "con zenzero fallito"
                Non voglio diventare grandeeeeeee.
                Non vogliooooo!
    
            + [Verso del succo d'ananas esplorativo.]
                ~ kitchen_recipeComplement = "con ananas esplorativo"
                Non ci avevo pensato.
                Però posso viaggiare dove voglio.
                Noi viaggiamo poco.
                Perché non abbiamo soldi.
                Però conosco tutti i posto segreti del mio quartiere!
                E alcuni sono pericolosi!
            -  
        Comunque giuro su tutto tuttissimo che ho smesso di dirti bugie.
        E ho tanta fame, {player_name}.
        Tanta tanta fame!
            -> fourth_ingredient_dispatcher
    

    
        //La chiusura è comune, sempre per ridurre il rischio di errori
        = fourth_ingredient_dispatcher
        Abbiamo sporcato tantissime cose.
        Dici che si lavano da sole?
        Dici che è pronto?
        
            {
                - backpack_findedGifts == ():
                    Dato che lo zaino di {player_name} è vuoto, non è possibile inserire un ingrediente speciale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> recipe_name_creator ->
                    -> at_table_with_second_char
                
                - else:
                    -> add_ingredient
            
            }
            
                = add_ingredient
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                
                Dato che lo zaino di {player_name} contiene degli oggetti, può inserirne uno nel piatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {
                - not cooking_with_first_char:
                    Abbiamo la sensazione che il giusto ingrediente possa dare un tocco speciale alla ricetta di {player_name} e {charNameTwo}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    E aiutare {player_name} a capire un po' meglio {charNameTwo}.
            }
                
                    + [Voglio aggiungere un ingrediente speciale.]
                        -> extra_ingredient_management(SecondCharacter)->
                        ~ disableNestDialogue()
                    
                    + [Ho cambiato idea.]
                    -
            A tavola!
            Ho tantissima aquilina!
            
                    -> recipe_name_creator ->
                    -> at_table_with_second_char
    


=== at_table_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ move_entity(CookingWithSecondCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    Hai visto che pancia grande che ho ora?
    Grazie {player_name}, era buonissimo!
    E poi questo {piatto} sembra una cosa da cinema.
        {
            - firstChar_storyStatus == story_storyStarted:
                Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                Dovevo lasciargli un pezzetto!
            - else:
                Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                Un po' mi manca.
        }

    A me mi piace parlare, ma gli adulti non mi ascoltano mai così tanto.
        {
            -cooking_with_second_char.first_theme:
                E sono contento che mi hai chiesto degli animali.
                E le cose che mi hai detto sulle persone.
                Grazie.

            -cooking_with_second_char.second_theme:
            
            -cooking_with_second_char.third_theme:
            
        }


        {
            - kitchen_secondCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
                
        }
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_secondCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_secondCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_secondCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_secondCharExtraIngredientReaction, che è uguale a {kitchen_secondCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        {
                            - not at_table_with_first_char.extra_ing_feedback:
                                Poiché {player_name} ha aggiunto ingrediente adorato da {charNameTwo}, riceverà un consiglio su come gestire le conversazioni con lui.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        }

                    Mi è piaciuto tanto tanto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    Lo vuoi sapere un segreto?
                    Alla fine non sono <i>così</i> strano.
                    Ma mi piace quando le persone sono <b>coerenti</b>.
                    Sennò mi sembra che vuoi avere ragione, non che mi vuoi parlare davvero.
                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        {
                            - not at_table_with_first_char.extra_ing_feedback:
                                Poiché {player_name} ha aggiunto ingrediente detestato da {charNameOne}, non riceverà alcun consiglio su come gestire le conversazioni con lui.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        }
                    Però {ingredientTranslator(kitchen_secondCharExtraIngredient)} mi ha fatto suuuuuperschifo.
                    Super.
                    Bleah!
                        -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        {
                            - not at_table_with_first_char.extra_ing_feedback:
                                Poiché {player_name} ha aggiunto ingrediente detestato da {charNameOne}, riceverà un consiglio fumoso su cosa fare parlando con lui.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        }
                    Mi è piaciuto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.
                    Non il mio preferito, ma quasi.
                    Mi ha fatto pensare una cosa.
                    Mi piacciono i cani.
                    Ma non mi piace quando fanno le cose a caso.
                    Tipo correre a destra e sinistra e ovunque.
                    Devi andare dove devi andare.
                    Come quando si parla.
                        -> relationship_feedback
            
    
        
    = relationship_feedback
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Mi sa che sono davvero pieno.
        Abbiamo parlato tanto, vero, qui?
        Non abbiamo mai passato così tanto tempo assieme.
        E penso che se ti ho conosciuto solo qui in cucina ora e {charNameOne} mi dice: vuoi fare amicizia con {player_name}?

            -> secondAffinityCalc ->
            {
                - secondAffinityCalc == 1:
                    {
                        - secondChar_relationshipStatus == 0:
                            Rispondo di no.
                            Perché non so.
                            Non è che mi è piaciuto molto molto come abbiamo parlato.

                        - secondChar_relationshipStatus == 1:
                            Rispondo subito sììììììììì!
                            Mi sono divertito.
                            E mi è sembrato che mi hai ascoltato davvero.
                            E mi piace questa cosa!
                    }
                    
                - secondAffinityCalc == 2:
                    {
                        - secondChar_relationshipStatus == 0:
                            Rispondo di no.
                            Perché non so.
                            Non è che mi è piaciuto molto molto come abbiamo parlato.
                        
                        - secondChar_relationshipStatus == 1:
                            Sì no boh.
                            Devo ancora capirlo.
                            Perché ci sono stati dei momenti in cui ho detto "Ma che figo che è avere qui {player_name}".
                            E dei momenti in cui non ti capivo.
                        
                        - secondChar_relationshipStatus == 2:
                            Rispondo subito sììììììììì!
                            Mi sono divertito.
                            E mi è sembrato che mi hai ascoltato davvero.
                            E mi piace questa cosa!
                    }    
        
            }

    Abbiamo ancora tante chiacchierate da fare, vero?        
            
        -> ending_cooking_with_second_char



=== ending_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Però ora devo farmi due passi o mi addormento.
    E non voglio dormire.
    Voglio fare qualche dispetto.
    A dopo {player_name}!

        -> cooking_animations_off ->
        ~ move_entity(SecondCharacter, Pond)
        ~ kitchen_secondCharCookingTogetherInvite = false
        -> update_colors(SecondCharacter) ->
        -> check_kitchen_recap ->

        -> main


/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== second_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per second_char_cooking_tracker. }
    
    ->->


=== second_char_cooking_alone
{debug: passo per second_char_cooking_alone.}
-> cooking_animations_on ->

{kitchen_secondCharCookingTime:
    
        - 1:
            {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
        
    }



-> main




=== food_gift_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{debug: passo per food_gift_second_char.}

    M: E proteggono tutta la biblioteca?
    R: Sì! Vedi che sono carini?
    M: Continuo a pensare che non siano carini, ma ora mi fanno un po' meno paura.
    M: Ehi {player_name}! {charNameTwo} mi diceva che c'è questa biblioteca in Portogallo dove i pipistrelli proteggono i libri!
    R: Sìì! E allora ho pensato di mettere una casetta per pipistrelli in cucina.
    R: Così tengono lontani gli insetti fastidiosi!
    M: E poi mi ha preparato questo piatto, ehm, curioso.
    R: Si chiama PanTutto.
    R: So cucinare tantissime cose!
    M: Hai imparato dalla tua mamma?
    R: No.
    R: A casa ci sto tanto da solo, e quindi mi invento le cose. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    R: Ma cucinare è come un laboratorio.
    R: E quindi ho inventato tanti piatti.
    R: Sono contento che l'hai assaggiato, {mentorName}!
    R: Ma non mi arrabbio se non ti piace.
    R: So che i vecchi mangiano solo cose schifose come i broccoli.
    M: Dovresti assaggiare la mia sacher, bimbo: ti porta direttamente in paradiso.
    R: Ha il cioccolato?
    M: Ha il cioccolato, e tanto.
    M: {charNameTwo}: abbiamo fatto pace?
    R: Mmm.
    R: Sì.
    R: Ma già da prima.
    M: Posso abbracciarti?
    R: No.
    R: Ma puoi farmi quella torta al cioccolato?

    ~ secondChar_pauseTalking = secondChar_pauseDuration
    ~ secondChar_justTalked = true


-> main