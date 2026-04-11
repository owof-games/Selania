=== tired_frog
{debug_frog: passo da tired_frog.}
    ~ temp dice = RANDOM(1,5)
{debug_frog: il valore di dice è {dice}.}
{debug_frog: il valore di frog_giftability è {frog_giftability}.}

{
    - frog_tiredValue > 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
        -> top

    - else:
        {
            - frog_giftability == false && LIST_COUNT(frog_allAvailableMissions) > LIST_COUNT(frog_allMissionsCompleted):
                {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                                Ho un po' di commissioni a disposizione, ma non avrei niente con cui ringraziarti, almeno per ora.
                                                                Torna più tardi.
                -> main

            - else:
                -> franco_missionsDispatcher
        }
}
    
- (top)

    {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                    Franco è stanchino ora.
                                                    Torna più tardi e provo a darti una zampa.
                                                    Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.

-> main


=== function franco_pauseSpecialStorylets()
{debug_frog: passo franco_pauseSpecialStorylets().}
    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax


=== closed_exchange
{debug_frog: passo closed_exchange.}

    {charTag(Franco, "{portrait_Franco()}")}:       Girino!

{
    - closed_exchange == 1:                         Gattino!
                                                    Bambino!
                                                    Hai mai visto quante cose piccole finiscono con "ino?"
                                                    Tranne il pino.
                                                    Non dovrebbe chiamarsi "pone"?
                                                    Ma non Pino il girino, che è grosso come, uh, una lettera da zia Graaak.
                                                    "Dice Pino di dire a {player_name} quella faccenda delle commissioni finite."
                                                    "E poi se gli riporti la sua crema solare."
                                                    Vero!
                                                    La crema!
                                                    Anche per noi è importante proteggere la nostra pelle.
                                                    Poi ci vengono le bolle.
                                                    Anche se alcune rane le apprezzano.
                                                    Uh, un'altra lettera di zia Graaak.
                                                    "LE COMMISSIONI! DEVI DIRE CHE NON SONO INFINITE!"
                                                    "SENNO' POI COME FA UNA PERSONA A DECIDERE QUALE AIUTO VUOLE DA TE?!?"
                                                    "E QUINDI DEVI SOLO DIRE "NE HO ALCUNE SPECIALI CHE HANNO LE LORO REGOLE, MA LE COMMISSIONI A DISPOSIZIONE ORA SONO SOLO DIECI!"
                                                    "E SE LE COMMISSIONI SONO SOLO DIECI, QUANTE VOLTE PUOI AIUTARE QUELLA POVERA ANIMA, FRANCO? QUANTE?"
                                                    Perdonami {player_name}, ma nella mia famiglia tutti si agitano così velocemente.
                                                    Sai che quasi quasi mi faccio un pisolino ora?

    - else:

    {shuffle:
                                                    - Facciamo un bel duo, noi due.
                                                    Io il cervello, tu la mano.
                                                    Quella è una mano, vero?
                                                    A dopo girino!

                                                    - xyz

    }      
    

}



    //Svuoto il destinatario della commissione attuale per sicurezza
    @animation:RewriterBook
    ~ frog_allMissionsCompleted += frog_currentMission
    //Levo per sicurezza dalle commissioni update
    ~ frog_updatedMissions -= frog_currentMission
    ~ frog_currentMission = ()
    ~ notification_francoQuests = false
    ~ frog_suspended_gift = false

-> main