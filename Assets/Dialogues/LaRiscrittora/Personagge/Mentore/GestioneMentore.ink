//Liste per gestire i luoghi dove troviamo il mentore
//NOTA: IL MENTORE NON COMPARE MAI NEL LABIRINTO, QUELLO è SPAZIO PRIVATO
VAR luoghiMentorePrimoTier =(Giardino, Mausoleo, Funghi)
VAR luoghiMentoreSecondoTier =(Giardino, Mausoleo, Funghi, Falene)
VAR luoghiMentoreTerzoTier = (Giardino, Mausoleo, Biblioteca, Falene, Funghi, Tisane, Sirene)
VAR luoghiMentoreIncontrato = ()
VAR mentore_location = ()
    

=== random_luogo_mentore
//Ho una lista di luoghi che svuoto e poi resetto, così che sia percepibile come effettivamente randomica
//Quando poi avrò le storie un attimo settate, andranno risistemate le condizioni del cambio tier

        {   
            - storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa: -> random_luogo_mentore_terzo_tier
            - storiaUno == Conclusa: -> random_luogo_mentore_secondo_tier
            - else:  -> random_luogo_mentore_primo_tier
        }



=== random_luogo_mentore_primo_tier
    {
        - luoghiMentorePrimoTier != ():
            -> runDomPrimoTier
        - else:
            ~ luoghiMentorePrimoTier = (Giardino, Mausoleo, Funghi)
            ~ luoghiMentoreIncontrato = ()
        {debug: la lista dei luoghi era vuota, ma ora contiene di nuovo tutto (check) {luoghiMentorePrimoTier}}
            -> runDomPrimoTier
    }


    = runDomPrimoTier
    ~ mentore_location = LIST_RANDOM(luoghiMentorePrimoTier)
    {mentore_location:
        - Giardino:
            ~ move_entity(Mentore, Giardino)
            ~ luoghiMentorePrimoTier -= Giardino
            ~ luoghiMentoreIncontrato += Giardino
        - Mausoleo:
            ~ move_entity(Mentore, Mausoleo)
            ~ luoghiMentorePrimoTier -= Mausoleo
            ~ luoghiMentoreIncontrato += Mausoleo
        - Funghi:
            ~ move_entity(Mentore, Funghi)
            ~ luoghiMentorePrimoTier -= Funghi
            ~ luoghiMentoreIncontrato += Funghi
     
    }
    {debug: il mentore si trova in {mentore_location}, la lista aggiornata dei luoghi che deve ancora visitare è: {luoghiMentorePrimoTier}, quella dei luoghi visitati è: {luoghiMentoreIncontrato}}
    
    ->->

=== random_luogo_mentore_secondo_tier
    {
        - luoghiMentoreSecondoTier != ():
            -> runDomSecondoTier
        - else:
            ~ luoghiMentoreSecondoTier = (Giardino, Mausoleo, Funghi, Falene)
            ~ luoghiMentoreIncontrato = ()
        {debug: la lista dei luoghi era vuota, ma ora contiene di nuovo tutto (check) {luoghiMentoreSecondoTier}}
            -> runDomSecondoTier
    }
    
    
    ->->

    = runDomSecondoTier
    ~ mentore_location = LIST_RANDOM(luoghiMentoreSecondoTier)
    {mentore_location:
        - Giardino:
            ~ move_entity(Mentore, Giardino)
            ~ luoghiMentoreSecondoTier -= Giardino
            ~ luoghiMentoreIncontrato += Giardino
        - Mausoleo:
            ~ move_entity(Mentore, Mausoleo)
            ~ luoghiMentoreSecondoTier -= Mausoleo
            ~ luoghiMentoreIncontrato += Mausoleo
        - Falene:
            ~ move_entity(Mentore, Falene)
            ~ luoghiMentoreSecondoTier -= Falene
            ~ luoghiMentoreIncontrato += Falene
        - Funghi:
            ~ move_entity(Mentore, Funghi)
            ~ luoghiMentoreSecondoTier -= Funghi
            ~ luoghiMentoreIncontrato += Funghi
    
    }
    {debug: il mentore si trova in {mentore_location}, la lista aggiornata dei luoghi che deve ancora visitare è: {luoghiMentoreTerzoTier}, quella dei luoghi visitati è: {luoghiMentoreIncontrato}}
    ->->

=== random_luogo_mentore_terzo_tier
    {
        - luoghiMentoreTerzoTier != ():
            -> runDomTerzoTier
        - else:
            ~ luoghiMentoreTerzoTier = (Giardino, Mausoleo, Biblioteca, Falene, Funghi, Tisane, Sirene)
            ~ luoghiMentoreIncontrato = ()
        {debug: la lista dei luoghi era vuota, ma ora contiene di nuovo tutto (check) {luoghiMentoreTerzoTier}}
            -> runDomTerzoTier
    }
    
    = runDomTerzoTier
    
    ~ mentore_location = LIST_RANDOM(luoghiMentoreTerzoTier)
    {mentore_location:
        - Giardino:
            ~ move_entity(Mentore, Giardino)
            ~ luoghiMentoreTerzoTier -= Giardino
            ~ luoghiMentoreIncontrato += Giardino
        - Mausoleo:
            ~ move_entity(Mentore, Mausoleo)
            ~ luoghiMentoreTerzoTier -= Mausoleo
            ~ luoghiMentoreIncontrato += Mausoleo
        - Biblioteca:
            ~ move_entity(Mentore, Biblioteca)
            ~ luoghiMentoreTerzoTier -= Biblioteca
            ~ luoghiMentoreIncontrato += Biblioteca
        - Falene:
            ~ move_entity(Mentore, Falene)
            ~ luoghiMentoreTerzoTier -= Falene
            ~ luoghiMentoreIncontrato += Falene
        - Funghi:
            ~ move_entity(Mentore, Funghi)
            ~ luoghiMentoreTerzoTier -= Funghi
            ~ luoghiMentoreIncontrato += Funghi
        - Tisane:
            ~ move_entity(Mentore, Tisane)
            ~ luoghiMentoreTerzoTier -= Tisane
            ~ luoghiMentoreIncontrato += Tisane
        - Sirene:
            ~ move_entity(Mentore, Sirene)
            ~ luoghiMentoreTerzoTier -= Sirene
            ~ luoghiMentoreIncontrato += Sirene
    }
    {debug: il mentore si trova in {mentore_location}, la lista aggiornata dei luoghi che deve ancora visitare è: {luoghiMentoreTerzoTier}, quella dei luoghi visitati è: {luoghiMentoreIncontrato}}
    
    
    ->->