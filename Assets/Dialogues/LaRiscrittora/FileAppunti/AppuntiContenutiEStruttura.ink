/*
ACCESSO AD ELEMENTI RICORRENTI (MENTORE, LISTA OGGETTI, ANIME)
Accade solo negli hub, non nelle scene singole, che sono private (credo)


OGGETTI
    La struttura per assegnare un oggetto random è
    
        ~ temp dono = LIST_RANDOM(doniNonTrovati)
        Hai trovato {dono}
            ~ doniNonTrovati -= dono
            ~ doniTrovati += dono
        
        Per fare un eventuale debug:
        {debug: Doni non trovati: {doniNonTrovati}}
        {debug: Doni trovati:{doniTrovati}}
        {debug: Doni donati:{doniDonati}}
        
        La randomizzazione è solo per i luoghi, e vale solo una volta. Altri oggetti compaiono con interazioni specifiche (certi spiriti, il mentore, tisane, i funghi e via di seguito)
        
        Alcuni oggetti possono essere usati in altre aree? (es: un fungo particolare per una certa tisana, una canzone per far crescere un fungo e via di seguito)
    
AREE DEL GIARDINO
    Non si aprono in modo randomico, ma in modo strutturato, ragionando per tier.
    Es:
        -> Tier uno: tutorial. Si apre il giardino con funghi e fiori. Trovo tre oggetti utili per la prima storia: uno dal mentore, uno nel giardino stesso (se osservo il mondo dalla panchina), l'altro collaborando con un fungo o un fiore o che.
        -> Tier due: si apre lo spazio delle falene e il labirinto
        -> Tier tre: si apre il resto: tisane, biblioteca, canzoni
    
    Nell'ottica di una maggiore economia, i tier non sono variabili, ma sono dettati dallo stato delle storie degli spettri.
        -> Tier uno: quello iniziale
        -> Tier due: si sblocca quando storiaUno == Conclusa
        -> Tier tre: si sblocca quando storiaDue, Tre e Quattro sono Concluse
    Per comodità ora nel prototipo i tier saranno uno per Spettro

TOMBE
    Si aprono in tre blocchi, definendo di conseguenza anche i Tier delle aree del giardino.
    
        -> Tier uno: quello iniziale.
        -> Tier due: si sblocca quando storiaUno == Conclusa
        -> Tier tre: si sblocca quando storiaDue, Tre e Quattro sono Concluse
    
    Le sette tombe saranno sempre e comunque visibili e accessibili. Se non sono sbloccate, ci diranno solo l'epitaffio.    
        
    Una volta che decidi di sbloccare una tomba, segui solo quella storia. Con una logica tipo:
        -> arrivo al mausoleo
        -> scelgo quale storia avviare
        -> ascolto la ministoria
        -> a quel punto le lapidi mi danno tutte una informazione generica, ma rimane presente e interagibile la fantasma della storia che sto seguendo.
        -> risolvo il suo percorso
        -> il nome sulla sua tomba si aggiorna
        -> posso interagire di nuovo con le altre lapidi, e avviare una storia tra quelle disponibili
        
ANIME
    Ci troviamo in uno spazio di rielaborazione e rilettura di ciò che è accaduto nel nostro passato.
    Le anime che incontriamo ci vengono presentate dal mentore come persone che stanno facendo il nostro stesso lavoro, ma mi piacerebbe che fossero un mix di persone della nostra vita attuale, e alcune di quelle che incontriamo nelle nostre elaborazioni.
    Il tempo può creare anche un contrasto, es: madre presentata da uno spettro giovane, e qui incontriamo una donna anziana.
    Con questa logica cercherei di dividerle tra poche (POCHE!!!) ricorrenti (tre, quattro) e comparse.
    Le ricorrenti hanno comunque una storyline lineare: piccoli storylet con scelte che non hanno conseguenze effettive (al massimo dei doni), che compaiono consequenzialmente ogni volta che le incontriamo, plausibilmente con un massimo di incontri previsti.
    
    Strutturalmente (un po' come col mentore) avrò quindi bisogno che ogni volta che entro in un luogo ci sia:
        -> un tiro di dado per decidere se sarà o meno presente una determinata anima
        -> se è prevista, una pescata tra le anime, che faccia in modo che non si ripresentino anime già incontrate, e che rendano la comparsa di quelle ricorrenti più dilazionata.

    */