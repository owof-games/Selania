//Tutorial sul game play principale

=== tutorial_choicesRelationshipStorylet ===
// - Cosa indica: ci spiega che il dialogo crea un rapporto.
//     - Ci fa simulare un paio di scambi con lei, molto forzati: 4 scelte sbagliate e 1 giusta.
//     - L’indicatore del rapporto cambia: cuore intero buono, cuore spezzato, non buono.
//     - Ci dice che il più delle volte avremo una scelta per dialogo.
//     - Che ogni scelta rappesenta delle cose, ma non ci dice cosa.
//         - Ma se non abbiamo il Grimorio, ci invita a parlare con Mentore perché ce lo dia.
//     - Ma ci dice che viene tracciata nel recap delle scelte, che è ad hoc per ogni personaggia.
//     - Se non vediamo indicatori, è perché non siamo lì per quella persona (e il suo indicatore si disattiva).
//     - Che ogni persona ha il suo sistema di valori, per cui non è così lineare come con lei, ma che lei è qui per spiegare come si fanno le cose, il perché non è roba sua.

    
Tutorial scelte spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
    }


->->




=== tutorial_rereadingStorylet ===
Tutorial rilettura spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
// - Inchiostro dalla relazione, rapporto tra indicatore e inchiostro generato.
// - Ogni inchiostro è una scelta che puoi fare in più.
// - Ogni scelta è un modo di rileggere un pezzo della storia della persona in modo diverso.
// - Dopo la riscrittura, la persona sceglierà un nuovo nome.
// - Le scelte della riscrittura sono importanti, per cui gli effetti dei sigilli vengono triplicati.


->->


//Tutorial sulle interfacce

=== tutorial_interfaceStorylets ===

    Ma quando mi finisce il turno?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    {
        - tutorial_interfaceStorylets > 1: Ripeterò le cose esattamente come la prima volta, voglio brucare in santa pace.
    }
    Sono Carla, e prima di entrare in Selanìa devo dirle cinque cose.
    Prenda appunti perché odio ripetermi.
    Uno: può utilizzare mouse, tastiera e controller, e passare da uno strumento all'altro.
    Col mouse basta passare sopra le cose che deve toccare, e cliccare.
    Idem con il controller.
    Con la tastiera può anche usare i numeri per le scelte.
    Quali scelte?
    Per risponderle serve il documento 13/12 in doppia coppia e la marca da bollo.
    Seconda informazione: quello che può toccare ha un bordo nero.
    Se sa parlare, si ferma quando lo sfiora.
    Se non sa parlare, si muove quando lo sfiora.
    E il cursore cambia.
    Cos'è un cursore?
    Forse lo sanno all'ufficio accanto.
    Terza informazione: in camera troverà un citofono.
    Lo può usare per modificare le impostazioni.
    Più avanti le daranno un libro.
    Potrà trovare il citofono anche nel libro.
    Perché un citofono nel libro?
    Direttive dalla sede centrale.
    Quarta informazione: quello che fa viene salvato in automatico.
    Se vede questa icona, non deve fare niente.
    Non è difficile.
    Quinta informazione: se qualcosa va storto <>
            {
                - settings_gamerMode:
                    può tornare indietro nel tempo cliccando questa icona.
                    Appena le daranno il libro.

                - else:
                    trova questa icona nelle impostazioni.
                    La farà viaggiare nel tempo.
                    Come?
                    Non siamo autorizzate a dare spiegazioni.
            }
    Infine devo spiegarle il sistema di relazioni.
    Ma è finito il mio turno.
    {
        - entity_location(Carla) != Forest:
            Lo sportello chiude.
    }
    

->->

=== tutorial_GrimoireStorylet ===
// - Cosa ci indica:
//     - Funzionamento delle etichette.
//     - Funzionamento dei tasti e delle pagine.
//     - Spazio achievements.
//     - Spazio informazioni (ora vuoto perché non hai ancora conosciuto nessuno).
//     - Notifiche (sul libro e nelle sezioni).
->->


//Tutorial attivati da luoghi
=== tutorial_greenhouseGiftsInkStorylet ===
{
    - tutorial_greenhouseGiftsInkStorylet == 1:
        ~ move_entity(Carla, Greenhouse)
}

Tutorial serra spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
// - Cosa ci indica:
//     - Si fanno due scelte.
//     - La pianta evocata inizia a crescere.
//     - Man mano che parliamo in giro la pianta riceve energia, e dopo 4 step è fiorita, e possiamo raccoglierne un pezzo come dono.
//     - Si può raccogliere solo un pezzo e basta, per non ferire le piante.
//     - Possiamo donare la pianta alle persone: il dono giusto può farci ricevere una o addirittura due boccette di inchiostro. A cosa serve? non sta a me dirlo.
//      - Utilizzo il grimorio




    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
            ->->
    }

->->



=== tutorial_kitchenStorylet ===
{
    - tutorial_kitchenStorylet == 1:
        ~ move_entity(Carla, Kitchen)
}

// - Cosa ci indica:
//     - Si può fare solo una cucinata a personaggia.
//     - Durante il dialogo useremo gli ingredienti per esprimere cose personali.
//     - Possiamo aggiungere un ingrediente extra dalla serra: se piace alla PNG, ci aiuterà a capire come ragiona, e quindi che tipi di scelte preferisce nel dialogo.
//         - Esempio sempre inventato con Carla, tipo “preferisco quando non mi parlano2
//     - A fine cucina, feedback sul rapporto sviluppato in quel momento: immaginalo come un reset, per capire se stai andando o meno nella direzione giusta.
//     - Ma il suo valore verrà comunque tenuto in considerazione per la relazione complessiva


Tutorial cucina spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored



    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
                -> main
    }

    
->->


=== tutorial_SigilsActivationStorylet ===
// - Cosa ci indica:
//     - Che i sigilli sono strumenti che influenzano il modo in cui vengono interpretate le tue scelte. Come? Non sta a me dirlo.
//     - Per attivarli basta andare sul Grimorio e cliccare il bottone. puoi avere un solo sigillo attivo alla volta, e si consuma durante tre utilizzi. Poi non è riutilizzabile.
//     - Come capire che hai un sigillo attivo? Spazio recap in prima pagina, più animazione in secondo e terzo livello.
//     - Inoltre sono presenti durante il dialogo con le personagge, con l’indicatore degli utilizzi a disposizione.
//     - Se hai un sigillo attivo ma non lo vedi quando parli con qualcunx, vuol dire che quella persona è immune all’effetto del sigillo, e non verrà consumato.
//     - Man mano che li utilizzerai, compariranno anche delle descrizioni, utili per capirne la logica.
//     - Ma come li scopri? vediamoci nel nido.


    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
            ->->
    }

->->


=== tutorial_nestStorylet ===
{
    - tutorial_nestStorylet == 1:
        ~ move_entity(Carla, Nest)
}

// - Cosa ci indica:
//     - Composizione: i glifi sono disponibili, possono essere usati solo una volta per sigillo, e quando sono consumati si spengono.
//     - Ogni sigillo è composto da tre glifi.
//     - Quando scoprirai un sigillo il grimorio si aggiornerà in automatico.
//     - Non puoi creare due volte lo stesso sigillo.


Tutorial nido spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored


    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
            -> main
    }

    
->->


=== carla_achievements
Achievements Gamer Mode
achievements_oneRewrite: {achievements_oneRewrite}, {achievements_oneRewrite_text}
achievements_threeRewrite: {achievements_threeRewrite}, {achievements_threeRewrite_text}
achievements_fiveRewrite: {achievements_fiveRewrite}, {achievements_fiveRewrite_text}
achievements_fullKitchen: {achievements_fullKitchen}, {achievements_fullKitchen_text}
achievements_onePerfectIngredient: {achievements_onePerfectIngredient}, {achievements_onePerfectIngredient_text}
achievements_fivePerfectIngredients: {achievements_fivePerfectIngredients}, {achievements_fivePerfectIngredients_text}
achievements_onePerfectGift: {achievements_onePerfectGift}, {achievements_onePerfectGift_text}
achievements_fivePerfectGifts: {achievements_fivePerfectGifts}, {achievements_fivePerfectGifts_text}
achievements_fullFranco: {achievements_fullFranco}, {achievements_fullFranco_text}
achievements_allSigils: {achievements_allSigils}, {achievements_allSigils_text}
achievements_allLetters: {achievements_allLetters}, {achievements_allLetters_text}
achievements_fullGreenhouse: {achievements_fullGreenhouse}, {achievements_fullGreenhouse_text}

Achievements Reader Mode
achievements_goodListener: {achievements_goodListener}, {achievements_goodListener_text}
achievements_fullLore: {achievements_fullLore}, {achievements_fullLore_text}
achievements_goodReader: {achievements_goodReader}, {achievements_goodReader_text}


->->
