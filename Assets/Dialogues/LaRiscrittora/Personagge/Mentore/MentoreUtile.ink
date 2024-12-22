/* ---------------------------------

   Presentazioni

 ----------------------------------*/

TODO: Inizio: più che scegliere il tuo nome, scegli un nuovo nome per quel luogo, il tuo nuovo inizio. La domanda del mentore è ambigua in questo senso. Lo è già ora, ma potrebbe essere interessante vedere qualcosa di ancora più ambiguo nel caso.


=== presentazioni ===
    Ma dimmi, come vuoi che ti chiami?
        -> il_mio_nome ->
    E quali sono i pronomi in cui ti riconosci?
        -> assegnazione_genere ->
    E allora: piacere di conoscerti, {nome}.
    E {pronomi has maschili: benvenuto|{pronomi has femminili: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
    C'è la possibilità che tu possa incontrare dei temi delicati.
    Puoi avere un warning su alcuni dei principali, vuoi vedere quali?
        + Sì -> trigger_warning
        + Più tardi
    -
    -> hub_giardino

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
Tutorial
    + Lo voglio ascoltare
        -> indicazioni
    + Passo
        ->->
    -
-> DONE


=== indicazioni
//Strutturare come wave sintetica?
Indicazioni tutorial
-(top)
    + Sul mausoleo
        Informazioni
            -> top
    + Sui funghi
        Informazioni
            -> top
    + {storiaUno == Conclusa}Sulle falene
        Informazioni
            -> top
    + {storiaUno == Conclusa}Sul labirinto
        Informazioni
            -> top
    + {storiaDue == Conclusa}Sulle tisane
        Informazioni
            -> top
    + {storiaDue == Conclusa}Sulle sirene
        Informazioni
            -> top
    + {storiaDue == Conclusa}Sulla biblioteca
        Informazioni
            -> top
    + Ho cambiato idea
        -> parlareColMentore
    -

-> parlareColMentore


/* ---------------------------------

   Aiuto con le storie

 ----------------------------------*/
=== consigli_storie ===
{
    - storiaUno == InCorso:
        -> consigli_storia_uno
    - storiaDue == InCorso:
        -> consigli_storia_due
    - storiaTre == InCorso:
        -> consigli_storia_tre
    - storiaQuattro == InCorso:
        -> consigli_storia_quattro
    - storiaCinque == InCorso:
        -> consigli_storia_cinque
    - storiaSei == InCorso:
        -> consigli_storia_sei
    - storiaSette == InCorso:
        -> consigli_storia_sette 
}

=== consigli_storia_uno
{~ Consiglio storia uno|Consiglio storia uno|Consiglio storia uno}
->parlareColMentore

=== consigli_storia_due
Consiglio storia due
->parlareColMentore

=== consigli_storia_tre
Consiglio storia tre
->parlareColMentore

=== consigli_storia_quattro
Consiglio storia quattro
->parlareColMentore


=== consigli_storia_cinque
Consiglio storia cinque
->parlareColMentore


=== consigli_storia_sei
Consiglio storia sei
->parlareColMentore


=== consigli_storia_sette
Consiglio storia sette
->parlareColMentore



/* ---------------------------------

   Trigger Warning
       
//Variabili per tracciare i trigger warning
VAR alcolismo = false
VAR abusi = false
VAR lutto = false

 ----------------------------------*/
 
 === trigger_warning ===
 Qui sono i principali temi delicati che potresti incontrare durante il tuo lavoro.
 Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti, ma in alcune situazioni (vedi spettri) le cose sono un po' complicate.
 E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, come unico mentore, ma sono pronto ad accogliere ogni segnalazione.
 Nel caso, contatta pure la mia controparte umana.
- (top)
    + Preferirei non leggere nulla che riguardi l'abuso di alcool
        ~ alcolismo = false
    + Non voglio leggere storie su relazioni abusanti
        ~ abusi = false
    + Non me la sento di parlare di morte
        ~ lutto = false
    + Sono apposto così. ->parlareColMentore
    -  
-> top

 -> main