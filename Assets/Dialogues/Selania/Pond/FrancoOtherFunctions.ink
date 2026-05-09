=== tired_frog
{debug_frog: passo da tired_frog.}
    ~ temp dice = RANDOM(1,5)
{debug_frog: il valore di dice è {dice}.}
{debug_frog: il valore di frog_giftability è {frog_giftability}.}

{

    - frog_allMissionsCompleted == ():
        -> franco_missionsDispatcher

    - frog_justPaused == true:
        -> franco_missionsDispatcher

    - frog_tiredValue > 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
        ~ frog_justPaused = true
        -> top

    - else:
        {
            - frog_giftability == false && LIST_COUNT(frog_allAvailableMissions) > LIST_COUNT(frog_allMissionsCompleted):
                {charTag(Franco, "party")}:                     Girino!
                                                                Ho un po' di commissioni a disposizione, ma non avrei niente con cui ringraziarti, almeno per ora.
                                                                Torna più tardi.
                -> main

            - else:
                -> franco_missionsDispatcher
        }
}
    
- (top)

    {charTag(Franco, "party")}:                     Girino!
    {charTag(Franco, "neutral")}:                   Franco è stanchino ora.
                                                    Torna più tardi e provo a darti una zampa.
    {charTag(Franco, "question")}:                  Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.
                                                    
                                                        ~ move_entity(Franco, Safekeeping)

    -> main


=== function franco_pauseSpecialStorylets()
{debug_frog: passo franco_pauseSpecialStorylets().}
    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax


=== closed_exchange
{debug_frog: passo closed_exchange.}

    {charTag(Franco, "party")}:                     Girino!

{
    - closed_exchange == 1:                         Gattino!
                                                    Bambino!
    {charTag(Franco, "question")}:                  Hai mai visto quante cose piccole finiscono con "ino?"
                                                    Tranne il pino.
                                                    Non dovrebbe chiamarsi "pone"?
    {charTag(Franco, "neutral")}                    Ma non Pino il girino, che è grosso come, uh, una lettera da zia Graaak.
    {charTag(Franco, "reading")}:	                "Dice Pino di dire a {player_name} quella faccenda delle commissioni finite."
                                                    "E poi se gli riporti la sua crema solare."
    {charTag(Franco, "neutral")}:	                Vero!
                                                    La crema!
                                                    Anche per noi è importante proteggere la nostra pelle.
                                                    Poi ci vengono le bolle.
    {charTag(Franco, "party")}:                     Anche se alcune rane le apprezzano.
    {charTag(Franco, "neutral")}:                   Uh, una lettera di zia Graaak.
    {charTag(Franco, "reading")}:	                "LE COMMISSIONI! DEVI DIRE CHE NON SONO INFINITE!"
                                                    "SENNO' POI COME FA UNA PERSONA A DECIDERE QUALE AIUTO VUOLE DA TE?!?"
                                                    "E QUINDI DEVI SOLO DIRE "NE HO ALCUNE SPECIALI CHE HANNO LE LORO REGOLE, MA LE COMMISSIONI A DISPOSIZIONE ORA SONO SOLO DIECI!"
                                                    "E SE LE COMMISSIONI SONO SOLO DIECI, QUANTE VOLTE PUOI AIUTARE QUELLA POVERA ANIMA, FRANCO? QUANTE?"
    {charTag(Franco, "question")}:	                Perdonami {player_name}, ma nella mia famiglia tutti si agitano così velocemente.
                                                    Sai che quasi quasi mi faccio un pisolino ora?

    - else:

    {shuffle once:
                                                    -   {charTag(Franco, "party")}:         Facciamo un bel duo noi due.
                                                                                            Io il cervello, tu la mano.
                                                                                            Quella è una mano, vero?
                                                                                            A dopo girino!

                                                    -   {charTag(Franco, "party")}:         Non la senti la soddisfazione di qualcosa di concluso?
                                                        {charTag(Franco, "question")}:      E non confuso?
                                                                                            Illuso?
                                                                                            Escluso?
                                                                                            Deluso.
                                                                                            Uh, dicevamo?

                                                    -   {charTag(Franco, "neutral")}:       Come dice sempre Tullio: "Per fortuna che non sai guidare."
                                                                                            E come dice sempre Giulio: "Dopo il lavoro bisogna riposare."
                                                                                            E ora riposiamo un po', {player_name}!

                                                    -   {charTag(Franco, "party")}:         Siamo un portento assieme, abbiamo chiuso un'altra commissione!
                                                        {charTag(Franco, "neutral")}:       Anche se zia Graaak dice che sono più un tormento.
                                                                                            Forse perché da piccolo soffiavo tantissimo.
                                                                                            E una volta ho avuto un raffreddore che faceva piovere ovunque.
                                                                                            Uh, una lettera di Tullio.
                                                        {charTag(Franco, "reading")}:	    "Quella è la tormenta, Franco."
                                                                                            "Tu sei un tormento di coccole."
                                                        {charTag(Franco, "party")}:         Quanto è carino?
                                                                                            Devo assolutamente spupazzarlo.

                                                    -   {charTag(Franco, "party")}:         Un'altra commissione chiusa dal dream team Franco e {player_name}!
                                                                                            Chi ci ferma più, a noi?
                                                        {charTag(Franco, "question")}:      A parte la polizia, {~per quella cosa dei volantini.|dopo quella faccenda della molotov.|per via di quegli adesivi su Mangione.|per via di quel datacenter in fiamme.|dopo la schedatura alla manifestazione per la Palestina.}
                                                        {charTag(Franco, "neutral")}:       Ma è un'altra storia.
                                                        {
                                                            - are_two_entities_together(PG, FourthCharacter):
                                                                {charTag(FourthCharacter, "neutral")}:    Non cambiare mai Franco.
                                                        }  

    }      
    

}



    //Svuoto il destinatario della commissione attuale per sicurezza
    @animation:RewriterBook
    ~ frog_allMissionsCompleted += frog_currentMission
    //Levo per sicurezza dalle commissioni update
    ~ frog_availableCommonMissions -= frog_currentMission
    ~ frog_updatedMissions -= frog_currentMission
    ~ frog_currentMission = ()
    ~ frog_suspended_gift = false
    //Togliamo la pausa
    ~ frog_justPaused = false

-> main