=== third_char_main_storylets

= one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

                //Commento diverso a seconda che sia il primo storylet con noi, o se invece ha assistito ad altri storylets.
                {
                - thirdChar_recordedPlayerPronoun != ():
                {charTag(PG, "neutral")}:                       Immagina: arrivo qui e la prima cosa che penso qual è?
                {charTag(ThirdCharacter, "jester")}:            <i>No, questo non è proprio il frigo.</i>

                - else:  
                {charTag(ThirdCharacter, "jester")}:            No, questo non è il frigo.   
                }
                                                                Volevo prendermi una Kilkenny, giusto per rilassarmi.
                                                                E invece eccomi qui.
                {charTag(ThirdCharacter, "jester")}:            Gesù licantropo, che colpo che mi sono preso!                                                
                {charTag(ThirdCharacter, "neutral")}:           Però per lo meno non si sente il miagolio del gatto dello Stracciamaroni.
                {charTag(ThirdCharacter, "bored")}:             O il puzzo dello Stracciamaroni.

                {
                - thirdChar_recordedPlayerPronoun == ():
                {charTag(ThirdCharacter, "jester")}:            Ma partiamo con le presentazioni!
                                -> name_choice.top2 ->
                                -> gender ->
                                ~ thirdChar_recordedPlayerPronoun += player_pronoun

                - else:
                {
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazzo!

                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "neutral")}:           Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazza!

                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "neutral")}:           Prima ti hanno chiamato {player_name}, e ho sentito che sei una persona non binaria.
                }
                }   
        {
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:                   Te la posso dire una cosa?
        {charTag(ThirdCharacter, "jester")}:                    Meno male.
                                                                ME NO MA LE!
                                                                Dieci su dieci.
        {charTag(ThirdCharacter, "neutral")}:                   Perché tra {charNameOne} e {charNameFive} mi serviva qualcuno con cui parlare di calcio e non solo di "cose emotive".

                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Partiamo bene.
                }

        - thirdChar_recordedPlayerPronoun == her:
        {charTag(ThirdCharacter, "jester")}:                    Io sono sicuro che con {charNameOne} e {charNameFive} sei felice che ci sia qualcuno con cui non devi parlare della posta del cuore.
                                                                Non che ci sia qualcosa di male se ti piace!
        {charTag(ThirdCharacter, "neutral")}:                   Ma non è la mia roba.
        {charTag(ThirdCharacter, "bored")}:                     Zero proprio!
        {charTag(ThirdCharacter, "neutral")}:                   Però posso spaccarti un po' di legna se serve!
        {charTag(ThirdCharacter, "jester")}:                    O difenderti dagli orsi!

        - thirdChar_recordedPlayerPronoun == they:
        {charTag(ThirdCharacter, "neutral")}:                   Te lo dico già ora: supporto tantissimo tutto e tutti.
                                                                Ma mi confondo coi nomi, figurati coi pronomi.
                                                                Però ci provo, guarda: <b>amicə</b>.
        {charTag(ThirdCharacter, "jester")}:                    È come cercare di dire una <i>a</i> e venire bloccati da un colpo di tosse.
        }


        {charTag(ThirdCharacter, "neutral")}:                   Io sono {charNameThree}.
        {charTag(ThirdCharacter, "jester")}:                    Cioè, non sono davvero un {charNameThree}.
        {charTag(ThirdCharacter, "neutral")}:                   Ma prima {charNameTwo} mi ha detto: "Ehi, ma tu sembri un boccale di birra!"
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:           Anche se non la conoscevo la parola <i>boccale</i> e l'ho chiamato bicchiere!
                                                                Ora conosco una parola nuova!
                }
                                                                Ho cercato il mio riflesso.
        {charTag(ThirdCharacter, "bored")}:                     Un po' ci sono rimasto male: tutte quelle ore spese in palestra e nessuno le vedrà!
        {charTag(ThirdCharacter, "jester")}:                    Detto tra noi, le ore sono state due.
                                                                Tre se contiamo il tempo dell'iscrizione.
                                                                Però la mia pancetta da birra alle tipe piace, almeno un otto me lo piglio.
        {charTag(ThirdCharacter, "neutral")}:                   E ora sono una birra.
                                                                Ma birra o non birra, che si combina da queste parti?
                                                                
   
        + \ {charTag(PG, "neutral")}:                           Sto provando ad aiutarvi a stare meglio con voi stess3.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Zio, che cosa triste!
                }     
        {charTag(ThirdCharacter, "bored")}:                     Ma quindi sei una specie di prete?
        {charTag(ThirdCharacter, "jester")}:                    Perché caschi male in quel caso!
        {charTag(ThirdCharacter, "neutral")}:                   O una roba tipo psicologo?
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "hurry")}:                     No, qualcosa di speciale!
                }
        {charTag(ThirdCharacter, "bored")}:                     Non me ne avere, ma non mi piace molto il discorso della terapia.
        {charTag(ThirdCharacter, "jester")}:                    Ne ho aiutati di più io al bar ubriachi che qualsiasi strizzacervelli, poco ma sicuro.
            
        + \ {charTag(PG, "neutral")}:                           Ci conosciamo meglio, e ci godiamo le stranezze di questo posto.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Woah vecio, che cosa da froci!  
                } 
        {charTag(ThirdCharacter, "jester")}:                    Ma quindi è tipo una comune hippie?
                                                                Droghe e sesso?
        {charTag(ThirdCharacter, "bored")}:                     Non sono a favore delle droghe, sappilo.
        {charTag(ThirdCharacter, "jester")}:                    Ma per la seconda parte posso farci un pensierino.
        {charTag(ThirdCharacter, "neutral")}:                   Anche se qui avete tutti un aspetto strano.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "neutral")}:                   {charNameThree}, il nostro aspetto qui rispecchia le persone che siamo.
                {charTag(Mentor, "hurry")}:                     Come un fiore che è una stella, una guida.
                                                                O un boccale di birra dissetante.
                }

        + \ {charTag(PG, "neutral")}:                           {charNameOne} sta cercando nuove fondamenta per la sua vita. E del vino.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "jester")}:                    Ci sto per il vino, anche se per me la birra batte tutto.
        {charTag(ThirdCharacter, "neutral")}:                   Ti fa ragionare meglio, mentre il vino boh, ti fa sentire troppe cose.
                                                                Però se ho capito bene {charNameOne} queste fondamenta le sta costruendo insieme a te.
        {charTag(ThirdCharacter, "jester")}:                    E mi sa che ti smazzi tu anche le pareti, le scale e il tetto.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:           Accurato.
                }
        
        + \ {charTag(PG, "neutral")}:                           {charNameTwo} cerca di capire ogni cosa.
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "jester")}:                    Il fratellino è una sagoma proprio.
        {charTag(ThirdCharacter, "neutral")}:                   C'ha una fissa per gli animali che fa quasi paura.
                                                                Ma se ho capito bene mentre lui impara le cose tu lo aiuti con i suoi casini.
                                                                Che non è roba da poco.
        {charTag(ThirdCharacter, "bored")}:                     In birreria vedi tanta di quella gente che non doveva proprio diventare genitore.
        {charTag(ThirdCharacter, "angry")}:                     E invece chi vorrebbe, zero.
        
        + \ {charTag(PG, "neutral")}:                           {charNameFive} sistema le cose rotte.
                -> glyph_choice_manager(false, fireC)-> 
        {charTag(ThirdCharacter, "jester")}:                    Quella c'ha una carica che manco un chihuahua sotto coca.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "sad")}:               I chihuahua sono sempre sottovalutati.
                }
        {charTag(ThirdCharacter, "neutral")}:                   Mi ricorda un po' la mia mamma, che anche lei non la frenavi mai.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "hurry")}:             Uh, ma che cosa tenera {charNameThree}.
                                                                Adorabile.
                }
        {charTag(ThirdCharacter, "neutral")}:                   Mentre papà distruggeva tutto, lei ha tenuto in piedi la famiglia da sola.
        {charTag(ThirdCharacter, "jester")}:                    Ma se ho ben capito alla fine {charNameFive} sistema le cose pratiche, mentre te ti fai il culo a sistemare noi.
        {charTag(ThirdCharacter, "neutral")}:                   Che è peggio.
        -    

        {charTag(ThirdCharacter, "jester")}:                    Quindi gira che ti rigira, sei solo te a sgobbare qui mentre noi ce la prendiamo comoda?
                                                                Che sfiga.

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Alla fine tocca sempre a noi uomini tirare avanti la baracca, vero?
                                                        

                - else:
                {charTag(ThirdCharacter, "jester")}:            Questo sì che è un cambiamento!
                {charTag(ThirdCharacter, "neutral")}:           Non averne a male, ma alla fine siamo sempre noi uomini a tirare avanti la baracca.
                                                                E invece vedi un po'.
                                                                Hai la mia approvazione {player_name}!
                }                
        {charTag(ThirdCharacter, "neutral")}:                   Anche se Dona è, era una che sgobbava tantissimo, per dire.

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:             Quella grande stronza della mia ex.
                                                                //Check parolacce da parte di Mentore
                                                                ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "energy")}:   Questa la conoscevo già!
                                                                Ma fa ridere, perché è come la cacca.
                                                                Stronza.
                                {
                                - are_two_entities_together(FifthCharacter, PG):
                                {charTag(Mentor, "sad")}:       Per l'appunto.        
                                }                                                        
                        }                           
                - else:
                {charTag(ThirdCharacter, "bored")}:             La mia ex.
                }       
        {charTag(ThirdCharacter, "neutral")}:                   Ma non sono qui per parlare di lei.
                                                                Non so proprio perché sono qui: non c'ho di sicuro le ansie di {charNameOne}.
        {charTag(ThirdCharacter, "jester")}:                    E l'età delle elementari è passata da, boh, trent'anni?
                                                                Anche se ti giuro che non si vede quando non sempre un pezzo di vetro.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Ma tra l'altro come piscio?
                                                                E vuol dire che sono nudo ora?
                                                                Dove mi è finito il?
                {charTag(ThirdCharacter, "neutral")}:           Oh.
                {charTag(ThirdCharacter, "bored")}:             Oh.
                                                                        
                - else:
                {charTag(ThirdCharacter, "jester")}:            Ma come mangio poi?
                                                                E se mangio dove finisce quello che mangio?
                {charTag(ThirdCharacter, "neutral")}:           Ma soprattutto, dove esce?!?
                }                                                    
        {charTag(ThirdCharacter, "neutral")}:                   Comunque butta bene che mi avete rapito nel giorno libero.
                {
                - are_two_entities_together(Mentor, PG):        
                {charTag(FifthCharacter, "sad")}:               Nessuno ti ha rapito, {charNameThree}!
                                                                Le persone arrivano qui perché ne hanno bisogno.
                {charTag(ThirdCharacter, "jester")}:            Si fa per dire, zia!
                {charTag(FifthCharacter, "sorry")}:             Scusa, è che non voglio che pensi male di noi.     
                }
                                                                Anche se avrei preferito passare la giornata a sistemare la formazione del fantacalcio.
                                                                Che Calhanoglu si è infortunato.
        {charTag(ThirdCharacter, "bored")}:                     Di nuovo.
                                                                    
        {charTag(ThirdCharacter, "neutral")}:                   Sono uno che si fa il culo a lavoro io, {player_name}.
                                                                //Check parolacce da parte di Mentore
                                                                ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "energy")}:   Cuuuloooooooooo!
                                                                Chissà perché agli adulti piace dirlo?                                                      
                        }                                                
        {charTag(ThirdCharacter, "neutral")}:                   In teoria dovrei farmi dalle cinque all'una, ma finisce sempre che mi chiamano anche durante il giorno.
                                                                Colleghi, fornitori, i tizi della spazzatura.
        {charTag(ThirdCharacter, "bored")}:                     Perché il mio capo è un idiota.
        {charTag(ThirdCharacter, "neutral")}:                   Ma c'ha i soldi, per cui: rispetto.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            E la sua tipa, oh amico mio.
                                                                Non hai idea di quanto sia bona.
                {charTag(ThirdCharacter, "neutral")}:           Incapace, ma bona!
                                                                Un nove se lo prende tutto.
                {
                - are_two_entities_together(FirstCharacter, PG):        
                {charTag(FirstCharacter, "annoyed")}:           Le pagelle alle ragazze.
                                                                Mannaggia al gatto le pagelle alle ragazze!
                {charTag(ThirdCharacter, "jester")}:            No, qui ti sbagli!
                                                                Le do anche ai ragazzi.
                                                                E ai calciatori dell'Inter!
                }                                                
                }                                                      
        {charTag(ThirdCharacter, "neutral")}:                   Ma visto che invece tu c'hai i superpoteri e porti la gente in posti incasinati con la sola forza del pensiero, indovina.
        {charTag(ThirdCharacter, "jester")}:                    Che lavoro faccio?



        + \ {charTag(PG, "neutral")}:                           Spero di non ferirti, ma cos'è questa cosa della ex?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:       
                {charTag(ThirdCharacter, "bored")}:             <i>Spero di non ferirti.</i>
                                                                Ma che modo è di parlare vecio?       
                }
        {charTag(ThirdCharacter, "neutral")}:                   La solita storia: le ragazze alla fine preferiscono sempre quello più stronzo.
                                                                Punto.

        + (aether2) \ {charTag(PG, "neutral")}:                 In verità sono più incuriosit{player_pronoun has him:o|{player_pronoun has her:a|ə}} dalla persona che sei che da quello che fai.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:       
                {charTag(ThirdCharacter, "jester")}:            Giusto per chiarirci, come dicono i giovani: no omo, giusto?     
                }                                               
        {charTag(ThirdCharacter, "bored")}:                     Che devo dirti {player_name}?
        {charTag(ThirdCharacter, "neutral")}:                   Lavoro quasi tutte le sere.
                                                                Torno che sono distrutto.
                                                                C'ho le cose da fare in casa.
                                                                O riposare un attimo.
        {charTag(ThirdCharacter, "bored")}:                     Non è che c'ho tutto 'sto tempo per farmi altre seghe mentali.
                {
                - are_two_entities_together(Mentor, PG):        
                {charTag(FifthCharacter, "sad")}:               Povera stella.   
                }
        
        + \ {charTag(PG, "neutral")}:                           Ti ci vedo a occuparti di cibo e tenere compagnia alle persone.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "jester")}:                    Perché non hai visto come cucino, a quel punto sarebbe reato!
        {charTag(ThirdCharacter, "neutral")}:                   Però non ci sei andat{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} molto lontan{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.
        {charTag(ThirdCharacter, "jester")}:                    Non è che c'hai davvero i poteri vero?
        
        + \ {charTag(PG, "neutral")}:                           Se ho inteso la logica di questo luogo, dall'aspetto direi che sei un barista?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "jester")}:                    <i>Dall'aspetto?!?</i>.
                                                                Così si giudicano le persone nel terzo millennio?
        {charTag(ThirdCharacter, "neutral")}:                   Dov'è {charNameOne} con le sue cose femministe a difendermi?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           {charNameOne} più ti ascolta più sta rivalutando positivamente Valerie Solanas.
                }

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Sei un coglione, vecio!
                                                                //Check parolacce da parte di Mentore
                                                                ~ fifthChar_slurDetectorFunction()
                                                                Io sono un idiota, per cui siamo una grande squadra!
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "energy")}:   Coglione e Idiota!
                                                                Tipo dei supereroi ma suuuuuper incapaci!                                                 
                        }          
                - else:
                {charTag(ThirdCharacter, "jester")}:            Ovviamente ti prendo in giro, non ti preoccupare.
                                                                A volte mi viene da fare il deficiente senza proprio pensarci.
                }  
            
        + \ {charTag(PG, "neutral")}:                           Sicuro qualcosa che richiede polso e azione, un lavoro di responsabilità.
                -> glyph_choice_manager(false, fireC)-> 
        {charTag(ThirdCharacter, "jester")}:                    Vedi che ce li hai davvero i superpoteri?
        {charTag(ThirdCharacter, "bored")}:                     Anche se questa roba il gruppo del calcetto non lo capisce mica, coi lavori "grossi".
        {charTag(ThirdCharacter, "neutral")}:                   Secondo me è più facile fare una fattura da trentamila che sedare una rissa tra due idioti ubriachi.
        -


        {charTag(ThirdCharacter, "jester")}:                    Comunque lavoro in una birreria.
                                                                Che si chiama <i>Il baretto</i>, che è il nome che aveva quando era un bar.
        {charTag(ThirdCharacter, "bored")}:                     Ed era di mio padre.
        {charTag(ThirdCharacter, "jester")}:                    Comunque è la migliore birreria della zona.
        {charTag(ThirdCharacter, "jester")}:                    Perché l'unica nella frazione sfigatissima in cui vivo.
                                                                Puro nulla al confine con la città.
        {charTag(ThirdCharacter, "jester")}:                    Però non è così male, se ignori la distesa infinita di appartamenti.
                                                                I vecchi che dicono "Qui un tempo era tutta pianura!".
                                                                E i turisti che prendono un buco in affitto convinti di essere in centro.
                                                                E invece c'hanno a dividere la fermata del bus la sera con il Pino.
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "party")}:                     Pino il girino?
                {charTag(ThirdCharacter, "jester")}:            Se Pino il girino è alto quasi due metri e ha un paio di pantaloncini che stanno su solo grazie allo sporco sì, allora è Pino il girino.
                {charTag(Franco, "question")}:                  Allora forse è Pino l'airone, il finto critico gastronomico!
                }                                                    
        {charTag(ThirdCharacter, "jester")}:                    Ogni tanto qualcuno gli fa le foto, al Pino.
                                                                I turisti sono idioti.
        {charTag(ThirdCharacter, "jester")}:                    Ma vai ad aiutare qualcuno di questi poveracci, mentre io mi rilasso un attimo.
        -> third_char_closing_storylet ->
        -> options_third_character
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "bored")}:                     Certo che quando mi hai rapito potevi portare qui il mio cellulare.
                                                                E le mie sigaretteeeeee.
                {
                - are_two_entities_together(Mentor, PG):        
                {charTag(FifthCharacter, "sad")}:               Non fa bene fumare, {charNameThree}.
                {charTag(ThirdCharacter, "jester")}:            Non fa bene nemmeno vivere zia, ma dobbiamo pur sfangarcela in qualche modo no?
                }                                                
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Cioè, avrai anche tu una tipa a cui scrivere, no?
                {charTag(ThirdCharacter, "jester")}:            O sei uno di quelli che usa il lavoro per scappare dalla fidanzata?

                - else:
                {charTag(ThirdCharacter, "neutral")}:           Immagino che anche tu hai qualcuno a cui scrivere.
                {charTag(ThirdCharacter, "jester")}:            O sei un{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} gattar{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}?        
                                                                        
                }  
        {charTag(ThirdCharacter, "bored")}:                     Non mi piace che non posso scrivere ad Ava.
                                                                La mia ragazza.
                                                                Ci scriviamo tutto il giorno, sia cose stupide che cose serie.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            E cose zozze, ovviamente.

                - else:
                {charTag(ThirdCharacter, "jester")}:            Ma non prendermi per un romanticone.
                }                                                      
        {charTag(ThirdCharacter, "neutral")}:                   Mi capisce sempre.
        {charTag(ThirdCharacter, "bored")}:                     Quando quell'altra mi ha smollato dopo tredici anni...
                                                                Cazzo.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()                                                        
        {charTag(ThirdCharacter, "melanchonic")}:               Tredici fottutissimi anni, di cui cinque di convivenza.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction() 
        {charTag(ThirdCharacter, "neutral")}:                   Non pensavo mi sarei innamorato di nuovo.
                                                                Ne ho avute di {thirdChar_recordedPlayerPronoun == him: fighe|tipe}, eh!
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Lo sai anche tu vecio che dobbiamo scopare ogni tanto, giusto per starcene tranquilli.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "neutral")}:  Io odio quando la mamma mi chiede di pulire camera!
                        }                                                                                               
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Anche tentativi seri, giuro.
                                                                Non sono sempre un buffone.
                                                                So anche essere tenero, se una se lo merita.
                }                                                      
        {charTag(ThirdCharacter, "neutral")}:                   Ho aspettato un po' dopo Dona, perché speravo che alla fine avrebbe cambiato idea.
        {charTag(ThirdCharacter, "bored")}:                     Invece se ne è andata in Spagna dopo che mi ha umiliato urlandomi contro davanti ai suoi.
        {charTag(ThirdCharacter, "melanchonic")}:               Ero a pezzi.
                {
                - are_two_entities_together(Mentor, PG):        
                {charTag(FifthCharacter, "sad")}:               Quanto mi spiace, povero tesoro.
                }  
        {charTag(ThirdCharacter, "neutral")}:                   Però dopo tre mesi avevo iniziato a vedere qualche ragazza.
        {charTag(ThirdCharacter, "jester")}:                    Tre mesi: sono o non sono un bravo ragazzo?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Un martire proprio.
                {charTag(ThirdCharacter, "jester")}:            Sapevo mi avresti capito!
                } 
        {charTag(ThirdCharacter, "neutral")}:                   Ma è un incubo alla mia età uscire con le ragazze, {player_name}.
                                                                Ho provato con le app da imbrocco.
                                                                Mi sono fatto aiutare da Petra, la mia collega sveglia, e mi ha fatto mettere foto idiote e una col suo cane "Perché alle ragazze piacciono i cani", ha detto.
                                                                Lei è lesbica quindi pensavo le piacessero i gatti.
        {charTag(ThirdCharacter, "bored")}:                     Però abbiamo litigato perché ha detto che sono "sessista" perché ho scritto che non voglio una tipa che colleziona uomini come fossero figurine.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Io sono pro tutto per carità, ma a volte 'ste donne sono di un pesante, vero?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Perché questa conversazione invece è leggera.
                                                                E soprattutto profonda.
                                                                Guarda, quasi annego!
                } 

                - else:
                {charTag(ThirdCharacter, "neutral")}:           A me sembra una cosa buona però, una cosa rispettosa, non volere che una donna sia per forza una che va con tutti di questi tempi.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Voglio morire.
                } 
                }                                                      
        {charTag(ThirdCharacter, "bored")}:                     Ma le app fanno schifo.
                                                                Mi scrivono solo quelle della mia età, e boh, sarà che la birreria mi tiene giovane, ma io ho bisogno di tipe più fresche e piene di interessi.
        {charTag(ThirdCharacter, "neutral")}:                   Ma quelle più giovani non lo vogliono un bravo ragazzo come me.
                {
                - are_two_entities_together(FirstCharacter, PG):
                                                                Vero, {charNameOne}?
                {charTag(FirstCharacter, "annoyed")}:           Mi si è appena suicidata la vagina.             
                }
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(ThirdCharacter, "jester")}:            Ma un'eccezione per la zia la faccio pure.       
                {charTag(FifthCharacter, "hurry")}:             Sei un vero ruffiano, {charNameThree}.
                                                                Terribile.
                {charTag(ThirdCharacter, "jester")}:            Volevi dire <i>adorabile</i>.                                                
                }                                                    
        {charTag(ThirdCharacter, "bored")}:                     Su quelle app è pieno di ragazzi più giovani, che magari ne sanno meno del mondo, ma non è più quello che si vuole da una relazione vero?
        {charTag(ThirdCharacter, "neutral")}:                   Però con le clienti ogni tanto si riesce a scopare.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()                                                      
                                                                Unica regola: solo le turiste.
        {charTag(ThirdCharacter, "bored")}:                     Perché se me ne faccio una della frazione poi so come va a finire.
                                                                Quando nasci e cresci nello stesso posto tutta la tua vita di merda è sulla bocca di tutti.
        {charTag(ThirdCharacter, "neutral")}:                   Un po' come tutte le cattive voci che hanno messo in giro quando Dona mi ha mollato.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:             Qualunque cosa succede, è sempre colpa del fidanzato alla fine.
                                                                Che balle.

                - else:
                {charTag(ThirdCharacter, "melanchonic")}:       Uno può fare il deficiente e comunque stare male no?
                {charTag(ThirdCharacter, "bored")}:             Non è che si deve far vedere proprio tutto quando si è con gli altri.
                }                                                      
                                                                Le persone non si fanno mai i cazzi propri.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()                                                        
        {charTag(ThirdCharacter, "neutral")}:                   Con le turiste non c'è tutta 'sta fatica poi, alla fine arrivano qui e vogliono solo sfasciarsi di birra, e a quel punto non gli importa di nulla.
                                                                Però con Ava è diverso.
                                                                Lei mi fa stare bene davvero, non mi giudica.

        
        + \ {charTag(PG, "neutral")}:                           Mi sembra che ci tieni molto a questa cosa dell'essere un bravo ragazzo.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "angry")}:             Non dovrei, scusa?                    
                }     
        {charTag(ThirdCharacter, "angry")}:                     Non è che <i>ci tengo molto</i>.
        {charTag(ThirdCharacter, "bored")}:                     È che mi faccio il culo per esserlo.
        {charTag(ThirdCharacter, "neutral")}:                   Sono gentile.
                                                                Ascolto.
                                                                Cerco sempre di mettere al centro la mia donna, anche quando sono stanco.
                                                                E poi quella se ne va.
        {charTag(ThirdCharacter, "bored")}:                     Che cazzo dovrei dire, che sono un mostro?
                                                                Uno sfigato?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Un molestatore che si porta a letto delle sconosciute ubriache.
                {charTag(ThirdCharacter, "angry")}:             Ringrazia Dio che sono un signore, {charNameOne} e non ti dico cosa penso di te, Gesù licantropo.
                }                                                         

        + (aether)\ {charTag(PG, "neutral")}:                   Mi stai dicendo che ti porti a letto delle sconosciute ubriache?
                -> glyph_choice_manager(false, aetherC)->
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:           Grazie grazie grazie per averglielo detto.
                                                                Grazie!
                } 
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Dai, non dirmi che non fai anche tu vecio.
                - else:
                {charTag(ThirdCharacter, "jester")}:            Quando lavori in una birreria non è che ci trovi le sconosciute sobrie, {player_name}!
                }
        {charTag(ThirdCharacter, "angry")}:                     Mi stai facendo sentire una merda, dai!
        {charTag(ThirdCharacter, "neutral")}:                   Non è che ci do una botta in testa con la clava e le trascino nella mia macchina.
        {charTag(ThirdCharacter, "jester")}:                    Anche perché la macchina non c'è l'ho.
        {charTag(ThirdCharacter, "neutral")}:                   Però quando stacchi all'una è difficile che quelle che sono rimaste siano proprio sane.
        {charTag(ThirdCharacter, "bored")}:                     Con questa logica dovrei appendere il cazzo al chiodo, non trovi?   
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:           Lo si può staccare?
                {charTag(ThirdCharacter, "jester")}:            Ci cacceremmo in meno casini fratellino!                                                        
                }                                                  

        + \ {charTag(PG, "neutral")}:                           Se vuoi essere felice non dovrebbe importarti così tanto il giudizio degli altri.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "bored")}:                     È arrivata Pollyanna.
        {charTag(ThirdCharacter, "neutral")}:                   Non è che ci tengo o non ci tengo.
                                                                È che quando stai in un posto con boh, cinquemila persone ad andare bene, il giudizio di quelle persone decide un sacco di cose.
        {charTag(ThirdCharacter, "bored")}:                     Chi ti saluta e chi no.
                                                                Come ti trattano quando vai a comprare qualcosa al negozio.
                                                                Se ti guardano di merda o meno se ti fai un birrino alla festa del patrono.

        
        + \ {charTag(PG, "neutral")}:                           Vorrei capire un po' meglio: quindi tu e Ava avete una relazione aperta?
                -> glyph_choice_manager(false, airC)->
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Ti sembra questa la cosa più importante {player_name}?!?
                                                                Non che si porta a letto delle sconosciute ubriache?
                }          
        {charTag(ThirdCharacter, "bored")}:                     Che parole grosse.
                                                                Relazione aperta.
        {charTag(ThirdCharacter, "neutral")}:                   Io e Ava.
                                                                Io ho lei, lei ha me.
                                                                Ma lei non mi può dare certe cose.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            E uno non può andare avanti a seghe tutta la vita, vecio.
                }
        {charTag(ThirdCharacter, "neutral")}:                   A lei sta bene come cosa comunque.

        + \ {charTag(PG, "neutral")}:                           Pensavo che anche tu come Donatella avessi fame d'altro: nuove città, nuovi rischi, nuove possibilità.
                -> glyph_choice_manager(false, fireC)->
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Ti sembra questa la cosa più importante {player_name}?!?
                                                                Non che si porta a letto delle sconosciute ubriache?
                } 
        {charTag(ThirdCharacter, "bored")}:                     Io non scappo come <i>lei</i> dalle situazioni, {player_name}.
        {charTag(ThirdCharacter, "jester")}:                    Ma poi dove me ne vado secondo te?
        {charTag(ThirdCharacter, "melanchonic")}:               A quarantaquattro anni, con il diploma di una vita fa e con un curriculum di merda?
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction() 
        {charTag(ThirdCharacter, "neutral")}:                   E poi mi piacciono i miei giri, le mie cose.
                                                                Vorrei solo che si facessero un po' tutti i cazzi propri.

        -

        {charTag(ThirdCharacter, "jester")}:                    Comunque basta parlare di Ava che poi mi diventi gelos{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.

                {//Blocco per reazioni e commenti legati al genere.
                
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "angry")}:             Ma se ci provi con lei vecio, allora vedi che divento una bestia.
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Mo mi è venuto voglia di fumare.
                {charTag(ThirdCharacter, "jester")}:            Sono un po' marpione, ma perché mi piace scherzare.
                {charTag(ThirdCharacter, "neutral")}:           Ma so che sei qui per lavorare, non ci proverei mai.
                }                                                    
                                                              
            -> third_char_closing_storylet ->
            -> options_third_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                   La zia insiste perché ti parli di me, dice che se sono qui c'è un motivo, qualcosa che mi tormenta.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "hurry")}:                     È carina questa cosa della zia, ma non sono così vecchia {charNameThree}.
                {charTag(ThirdCharacter, "jester")}:            Ma "zia" per me è un segno di rispetto.
                {charTag(ThirdCharacter, "neutral")}:           Una zia è una che ha avuto una sua vita e che per questo è saggia.
                {charTag(ThirdCharacter, "jester")}:            E quando sei più giovane ti fa fare le cose che i tuoi genitori non ti farebbero fare.    
                }
        {charTag(ThirdCharacter, "bored")}:                     Forse la cosa che mi tormenta di più è che io sono una schiappa a calcetto.
        {charTag(ThirdCharacter, "jester")}:                    Scherzo, circa.
        {charTag(ThirdCharacter, "bored")}:                     Becco gli altri ogni lunedì sera, quando la birreria è chiusa.
        {charTag(ThirdCharacter, "neutral")}:                   È un'idea che ha avuto il Poggi, il mio amico storico, dopo il Covid.
        {charTag(ThirdCharacter, "bored")}:                     C'ho avuto proprio un periodo di merda {player_name}, ma davvero di merda, manco un uno a quell'anno darei, solo le fiamme.
        {charTag(ThirdCharacter, "neutral")}:                   Ho perso il mio lavoro figo da un giorno all'altro, un lavoro con soldi e viaggi e {thirdChar_recordedPlayerPronoun == him: fighe|tipe}.
        {charTag(ThirdCharacter, "jester")}:                    Ma sono sempre stato fedele a Dona, giuro!
        {charTag(ThirdCharacter, "melanchonic")}:               Ero un boss, e poi boom, a terra.
                {
                - are_two_entities_together(Mentor, PG):     
                {charTag(FifthCharacter, "sad")}:               Quanto mi spiace, {charNameThree}.                                           
                }
        {charTag(ThirdCharacter, "neutral")}:                   Una sera il Poggi mi ha detto "Dai, ti tiro su una squadretta con gente a posto così ti distrai!"
                                                                Ora il Poggi non si vede da due anni, da quando è nata l'Olivia.
                {//Blocco per reazioni e commenti legati al genere.
                
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Dicono che se ci nasce una figlia perdiamo la testa a noi uomini, vero?
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Ci sta, alla fine la famiglia è la cosa più importante, no?
                }                                                          
        {charTag(ThirdCharacter, "neutral")}:                   Nella squadra c'è il Merlo, che è uno pieno di soldi e che se la sente un po', ma quando giochiamo per lo meno chiude quella boccaccia.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           C'ha una moglie che se la butti in acqua galleggia senza sforzo, non so se ci siamo capiti.
                                                                Finta dai piedi ai capelli.
                                                                Se la guardi bene da vicino non supera un sei, sei e mezzo se hai bevuto.
                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Anche perché sennò parla della sua azienda edile e della fatica con le tasse e io vorrei solo menarlo.
                                                                C'ha una casa più grande della mia, di quella di mia sorella e di quella di mio padre messe assieme, il maledetto.
                }  
        {charTag(ThirdCharacter, "jester")}:                    Poi il Giova, che si è sposato da poco ma è sempre fuori casa e la moglie è disperata.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                                                                Ma quella è così pesante che anche io sarei sempre fuori casa.
                {charTag(ThirdCharacter, "neutral")}:           Vai a sapere perché l'ha sposata poi.
                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Le relazioni sono strane, vero?
                {charTag(ThirdCharacter, "jester")}:            E soprattutto <b>voi</b> siet{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} stran{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.
                }                                                     
                                                                Il Giova va avanti a start up o robe del genere.
        {charTag(ThirdCharacter, "jester")}:                    Io non credo che nessuno abbia capito che diavolo faccia di lavoro, manco lui.
                                                                Il Poggi diceva sempre che Giova gareggia in uno sport tutto suo e comunque arriva sempre secondo.
        {charTag(ThirdCharacter, "neutral")}:                   Ma c'ha la famiglia ricca quindi beato lui.
                                                                Poi c'è Dario, che è entrato da poco nel gruppo e solo perché esce con Katia, la cugina del Giova.
                                                                Uno a posto, che è uscito da poco da un divorzio pesantissimo, quella gli ha portato via tutto, inclusi i figli.
        {charTag(ThirdCharacter, "bored")}:                     L'unico peccato è che è juventino.
        {charTag(ThirdCharacter, "jester")}:                    E quindi è lo scemo del gruppo.
        {charTag(ThirdCharacter, "neutral")}:                   E infine c'è il Rocco. 
                                                                Che in realtà si chiama Adil <>
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                                                                ma è dalle scuole che lo chiamavamo Marocco e alla fine è finita che ora lo chiamiamo tutti Rocco.
                                                
                - else:
                                                                ma lo sai anche tu come si è stupidi alle scuole vero?
                                                                E alla fine gli è rimasto addosso questo nome.
                }                                                      
        {charTag(ThirdCharacter, "jester")}:                    Che poi è pure egiziano.
        {charTag(ThirdCharacter, "neutral")}:                   Rocco è l'unico che becco anche fuori a volte.
                                                                Fa l'operaio nella stessa fabbrica dello Stracciamaroni, che poi è vero per metà della gente di qui.
                                                                C'ha due figli con la testa sulle spalle, studiano tutti e due anche se non ricordo mai cosa, il maschio roba per le AI.
                                                                Quell'uomo merita tutto il nostro rispetto.
                                                                Anche se c'abbiamo due vite diverse ci capiamo, non so come mai.
                                                                Insomma, nessuno di noi è esattamente questo grande intellettuale.
                                                                Siamo più gente con le mani sporche.
                                                                A parte il Giova.
        {charTag(ThirdCharacter, "jester")}:                    Che è stupido <i>e</i> ha le mani pulite.
        {charTag(ThirdCharacter, "neutral")}:                   Però ce la caviamo bene.
                                                                Si aggiunge sempre qualche collega di Rocco o gente del bar che viene a fare due tiri.
        {charTag(ThirdCharacter, "jester")}:                    E la serata così passa bene.

        
        + \ {charTag(PG, "neutral")}:                           Mi chiedevo: come mai parli sempre degli altri e quasi mai di te?
                -> glyph_choice_manager(false, waterC)->

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:       
                {charTag(ThirdCharacter, "bored")}:             Potresti anche non chiedertelo e risolvere il problema, {player_name}.     
                }
        {charTag(ThirdCharacter, "neutral")}:                   Ti ho parlato della mia ragazza, del lavoro, dei miei amici.
                                                                Vuoi conoscere il mio numero di scarpe?
                                                                Porto il quarantaquattro.
                                                                La mia taglia?
                                                                Una quarantaquattro.
        {charTag(ThirdCharacter, "jester")}:                    Più due.
        {charTag(ThirdCharacter, "neutral")}:                   L'altra taglia?
        {charTag(ThirdCharacter, "jester")}:                    Sempre quarantaquattro, ma diviso due.                                                         
            
        + \ {charTag(PG, "neutral")}:                           Notavo che hai descritto tutti i tuoi amici in base al lavoro che fanno.
                -> glyph_choice_manager(false, aetherC)->

        {charTag(ThirdCharacter, "neutral")}:                   Di quello si parla quando siamo assieme, {player_name}.

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:               
                {charTag(ThirdCharacter, "neutral")}:           Ho paura a sapere di cosa parli tu coi tuoi amici.
                } 
        {charTag(ThirdCharacter, "neutral")}:                   La vita è già incasinata di suo senza altre para.
        {charTag(ThirdCharacter, "neutral")}:                   A parte il Giova.
        {charTag(ThirdCharacter, "jester")}:                    Ma Giova non c'ha abbastanza neuroni per pensare, quindi anche lui non ha molto da dire.

        + \ {charTag(PG, "neutral")}:                           Cosa significa "essere un boss"? È un discorso di soldi?
                -> glyph_choice_manager(false, earthC)->

        {charTag(ThirdCharacter, "neutral")}:                   Un po', ma non solo.
                                                                È una impostazione mentale.
                                                                È sapere che puoi chiedere tutto perché tutti ti rispettano.
                                                                È quando entri in una stanza e tutti ti vedono.
                                                                E sanno che sei quello figo.
        
        + \ {charTag(PG, "neutral")}:                           Ma invece cosa fai quando sei libero e non passi il tempo coi tuoi amici?
                -> glyph_choice_manager(false, airC)->

        {charTag(ThirdCharacter, "neutral")}:                   Un po' le solite cose.
                                                                Cazzeggio sui social.
                                                                Commento qualche notizia.
        {charTag(ThirdCharacter, "jester")}:                    Vado a dare fastidio agli juventini.
        {charTag(ThirdCharacter, "neutral")}:                   Mi guardo qualche video, tipo quelli del Mastrangelo.
                                                                Con Rocco siamo andati alla sua festa per lo scudetto.
                                                                Lui davvero un bomber proprio.
        
        + \ {charTag(PG, "neutral")}:                           Però non mi hai ancora detto se vincete.
                -> glyph_choice_manager(false, fireC)-> 
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "jester")}:            Ah ah anche se non sei un ragazzo, sai le cose che contano, grande!       
                }
        {charTag(ThirdCharacter, "neutral")}:                   Però non lo si fa tanto per la vittoria, è per stare assieme.
                                                                Anche perché la squadra non è mai proprio la stessa.
                                                                Però nel gruppo sono quello con più gol all'attivo.
        {charTag(ThirdCharacter, "jester")}:                    Appena usciamo da qui ti faccio vedere che gambone che ancora mi ritrovo!
        - 
        {charTag(ThirdCharacter, "jester")}:                    Come vedi comunque la zia c'ha torto.
        {charTag(ThirdCharacter, "neutral")}:                   Non ho problemi col lavoro.
                                                                Nessun tormento con le tipe.
                                                                I miei amici sono a posto.
        {charTag(ThirdCharacter, "jester")}:                    Questo {charNameThree} sta da dio!
                                                  
            -> third_char_closing_storylet ->
            -> options_third_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(ThirdCharacter, "bored")}:                     Sembra che non me ne posso andare fino a quando non ho risolto il mio blocco, dice la zia.
        {charTag(ThirdCharacter, "neutral")}:                   Quindi affrontiamo il grande blocco.
                                                                Donatella.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:             La grandissima stronza.
                                                                //Check parolacce da parte di Mentore
                                                                ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:   Più ti ascolto più sarei curiosa di sentire la sua di versione della faccenda.
                        {charTag(ThirdCharacter, "bored")}:     Certo, perché per quelle come te è sempre colpa del compagno, sempre.
                        } 
                                                
                - else:
                {charTag(ThirdCharacter, "bored")}:             La mia ex.
                }

        {charTag(ThirdCharacter, "neutral")}:                   Mettiti sedut{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} comod{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}.
                                                                E immagina.
                                                                Lui: un tipo a posto, che lavora tanto.
                                                                Che non urla mai contro la sua tipa.
                                                                Che non l'ha mai tradita anche se fa un lavoro dove è facile incontrare ragazze.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            E tu lo sai quanto è dura resistere quando il tuo amico lassotto si prende bene!
                                                                
                - else:
                {charTag(ThirdCharacter, "jester")}:            E ti giuro che per noi uomini questa cosa è un vero atto d'amore!
                }                                                          
        {charTag(ThirdCharacter, "neutral")}:                   Lei: una che è cresciuta poveraccia e vuole scappare da quella situazione a tutti i costi.
                                                                Che si è fatta il culo alla scuola di estetista e a venticinque anni si apre lo studio insieme a una sua amica.
        {charTag(ThirdCharacter, "jester")}:                    E che è una gran bona, non da dieci ma otto e mezzo tutto.
        {charTag(ThirdCharacter, "neutral")}:                   Due vite normali e una convivenza che va avanti da cinque anni e una cosa in arrivo che lui sogna da quando la conosce: il matrimonio.
                                                                Il periodo attorno al matrimonio è perfetto: i genitori di lei che aiutano con le cose pratiche, la sorella di lui con l'organizzazione, col trovare il posto giusto.
        {charTag(ThirdCharacter, "bored")}:                     Unica nota dolente: quello sfigato del padre di lui che è contrario, perché dice "quella ha in testa sogni più grandi di questo buco di periferia, se ne andrà"!
        {charTag(ThirdCharacter, "neutral")}:                   Si parla anche di figli, lui ha già comprato in segreto un completino dell'Inter per quando arriverà il primo.
                                                                Però lei si fa sempre più silenziosa.
                                                                Lavora sempre di più.
                                                                Una sera lui le fa trovare una cenetta romantica, una cosa semplice perché fa cagare a cucinare ma c'ha provato, e che cazzo.
                                                                E quando le chiede se va tutto bene, lei risponde di no.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "angry")}:             No.
                                                
                - else:
                {charTag(ThirdCharacter, "melanchonic")}:       No.
                }                                                                                  
        {charTag(ThirdCharacter, "neutral")}:                   E lei lo riempie di cazzate.                                                     
                                                                Dice che da quando vivono assieme è lei che deve fare tutto in casa e lui non muove un dito.
                                                                E che lei non può sapere cosa vuole perché non c'ha mai avuto una vita sua perché è stato lui a crescerla, dice.
                                                                Perché conosce il mondo solo attraverso di lui.
                                                                Ma lei non vuole arrivare ai trent'anni senza sapere cosa vuole davvero, chi è davvero.
                                                                Lui le risponde che può occuparsi di più della casa, che può sistemare quelle cose che dice sempre che sistemerà ma poi non lo fa.
                                                                Lei gli prende le mani e gli dice "Ti voglio bene, davvero. Ma non posso sposarti soltanto perché sei l'unica cosa che conosco".
                                                                Lei se ne va da quella casa tre giorni dopo, e lui la aspetta.
                                                                La aspetta per un anno.
                                                                Prova a fare palestra.
                                                                Prende più ore in birreria per avere più soldi.
                                                                Le regala dei biglietti per New York, perché sa che è vero che hanno fatto tanti sacrifici, e che è giovane e vuole vedere il mondo.
                                                                Dentro, una dedica e una frase: "Ti aspetterò all'aeroporto quando tornerai, per chiederti di nuovo di sposarmi".
                                                                E lei gli rimanda indietro i biglietti scrivendogli un messaggio per dirgli che non deve aspettarla, né all'aeroporto né a casa.
        {charTag(ThirdCharacter, "melanchonic")}:               Mai più.
        {charTag(ThirdCharacter, "neutral")}:                   E lui capisce che lei non se ne è andata perché deve scoprire sé stessa o robe del genere.
        {charTag(ThirdCharacter, "bored")}:                     Ma perché lui sta invecchiando, non ha chissà quale giro di amici fighi, e non guadagna abbastanza.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "angry")}:             Alla fine lei stava solo cercando un nuovo cazzo, più giovane, più figo, più ricco.
                                                                //Check parolacce da parte di Mentore
                                                                ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "melanchonic")}:Non mi piace questa energia, no.
                                ~ change_entity_place(SecondCharacter)                           
                        }                                           
                                                
                - else:
                {charTag(ThirdCharacter, "melanchonic")}:       Finisce così la storia di uno sfigato.
                        {
                        - are_two_entities_together(Mentor, PG):     
                        {charTag(FifthCharacter, "sad")}:       Povero figliolo.                                         
                        }
                } 
                                                            
        
        + \ {charTag(PG, "neutral")}:                           Forse a volte si può tenere a qualcuno, ma non reggere più la relazione.
                -> glyph_choice_manager(false, waterC)->
        {charTag(ThirdCharacter, "angry")}:                     Cazzate.
                                                                Se ami qualcuno ti fai il culo e ti adatti.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()
        {charTag(ThirdCharacter, "bored")}:                     Perché sennò così finisce sempre che quando qualcosa non piace più si tira fuori una scusa tipo "Mi spiace ma non riesco a comunicare con te."
                                                                O "Prendi tutto come se ti fosse dovuto, non ce la faccio più!"
                                                                O "Devo trovare me stessa."
        {charTag(ThirdCharacter, "neutral")}:                   E a quel punto la storia finisce e tu sei fregato.
                
        + \ {charTag(PG, "neutral")}:                           Hai raccontato tutta questa storia come se ci fosse un buono e una cattiva.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(ThirdCharacter, "bored")}:                     Vuoi dirmi che non è così, scusa?
        {charTag(ThirdCharacter, "neutral")}:                   Magari lui non è perfetto.
                                                                Ma se l'è presa sotto la sua ala quando ancora sapeva di latte e l'ha aiutata a diventare una donna.
                                                                Gli è stato vicino quando non era felice, quando litigava coi suoi genitori.
        {charTag(ThirdCharacter, "angry")}:                     Le ha dato tutto.
        {charTag(ThirdCharacter, "neutral")}:                   E lei l'ha abbandonato.
            
        + \ {charTag(PG, "neutral")}:                           Sembra che a questo tizio importi tanto dei suoi soldi, dell'età, del tipo di amici che ha, vero?
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:           No, è che quando hai amici maschi di quello si parla, tu non puoi capire.        
                }
        {charTag(ThirdCharacter, "neutral")}:                   Sono cose importanti alla fine, perché le persone quello guardano.
        {charTag(ThirdCharacter, "bored")}:                     Non è che gliene frega a nessuno se sei un tipo sensibile o se ti piacciono, cazzo ne so, i tramonti.
        {charTag(ThirdCharacter, "neutral")}:                   No, alla fine uno ti giudica per quello che possiedi, per la tipa che c'hai e i tipi con cui esci.
                                                                Io non esco con degli sfigati, non è roba da poco.

            
        + \ {charTag(PG, "neutral")}:                           E se fosse davvero una storiella, quale sarebbe la lezione che dovrei imparare?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "melanchonic")}:               Che i bravi ragazzi alla fine la pigliano sempre nel culo.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "angry")}:    Sembrano le cose che dice papà, non mi piacciono.
                                ~ change_entity_place(SecondCharacter)                           
                        }                                                         
            
        + \ {charTag(PG, "neutral")}:                           Ma alla fine il tipo si è dato una mossa per cambiare le cose?
                -> glyph_choice_manager(false, fireC)-> 
        {charTag(ThirdCharacter, "bored")}:                     E che doveva fare {player_name}?
                                                                Rapirla?
        {charTag(ThirdCharacter, "neutral")}:                   Ha continuato a lavorare.
                                                                A marcire nel letto guardando la TV.
                                                                Sapendo che prima o poi lei se ne pentirà di questa cosa.
            -
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "annoyed")}:                   So che non sono cazzi miei, ma questa ragazza aveva tutto il diritto di andarsene.
        {charTag(ThirdCharacter, "bored")}:                     Chi ti ha chiesto qualcosa a te, Gesù licantropo?
        {charTag(FirstCharacter, "neutral")}:                   Sei qui a raccontare la tua storia da vittima di 'sto cazzo davanti a tutti, per cui un po' diventano anche cazzi miei.
        {charTag(ThirdCharacter, "bored")}:                     Quindi quando parlerai delle tue paranoie sul lavoro o il moroso o Sborotalco posso venire a romperti i coglioni a mia volta?
        {charTag(FirstCharacter, "annoyed")}:                   Come se tu avessi qualcosa di più importante da portare di "Oh povero me ho groomato questa tipa per un decennio e poi mi ha lasciato, sob."
        {charTag(ThirdCharacter, "bored")}:                     Cazzo vuol dire?
        {charTag(FirstCharacter, "annoyed")}:                   Vuol dire che so fare i conti, {charNameThree}.
                                                                E spero li sappia fare anche {player_name}.
                                                                E ora vado a fare due passi o finisco per strozzare qualcuno.
                ~ change_entity_place(FirstCharacter)                                                
        {charTag(ThirdCharacter, "angry")}:                     Ma questa è pazza!
                                                                Ma hai visto come mi ha attaccato?
                                                                Io.
                                                                C'ho bisogno di scaricarmi un attimo.
                ~ change_entity_place(ThirdCharacter)
                //Tracciamo questo sbrocco perché non è roba da poco.
                ~ thirdChar_firstCharRage = true

                {
                - are_two_entities_together(Mentor, PG):     
                {charTag(FifthCharacter, "sad")}:               Forse {charNameOne} ha esagerato.
                {charTag(FifthCharacter, "hurry")}:             Corro a vedere cosa posso fare.                                        
                }

        - else:
        {charTag(ThirdCharacter, "bored")}:                     C'è qualcosa in questo posto, un po' ti fa venire da piangere
        {charTag(ThirdCharacter, "jester")}:                    Alla fine comunque lui ha trovato qualcuno che la ama.
                                                                A volte le cose vanno in vacca solo per poter migliorare.
        {charTag(ThirdCharacter, "neutral")}:                   Ora che hai sentito qual è la cosa che ancora mi fa incazzare, immagino saprai anche come farmi uscire di qui.
        }

            -> third_char_closing_storylet ->
            -> options_third_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:             Da uomo a uomo: inizio a perdere la pazienza.
                                                
                - else:
                {charTag(ThirdCharacter, "bored")}:             Sto iniziando a perdere la pazienza {player_name}.
                {charTag(ThirdCharacter, "neutral")}:           Ma per te continuerò a comportarmi da signore.
                } 

        {charTag(ThirdCharacter, "neutral")}:                   {charNameFive} dice che io posso andarmene solo se mi riscrivi.
                                                                Che sono io a dirti che mi devi riscrivere.
                                                                Ma non riesco a chiedertelo, e secondo lei è perché non ho preso un punto importante.
                {
                - are_two_entities_together(FifthCharacter, PG):
                {charTag(FifthCharacter, "neutral")}:           Esattamente.  
                }                                                        
        {charTag(ThirdCharacter, "bored")}:                     Secondo me è colpa di qualcosa qui.
        {charTag(ThirdCharacter, "neutral")}:                   Mi avete drogato?
                {
                - are_two_entities_together(FifthCharacter, PG):
                {charTag(FifthCharacter, "sad")}:               No no no cosa dici?  
                }  
                                                                Vabbè, per ora reggiamo il gioco.
                                                                {charNameFive} dice che spesso i problemi sono in famiglia.
                                                                E magari c'ha pure ragione.
        {charTag(ThirdCharacter, "jester")}:                    Ora non ci crederai vedendo questo popo' di figo.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            E non farti idee da frocio per favore!
                                                                                                                        
                - else:
                {charTag(ThirdCharacter, "jester")}:            Che ho visto che mi lanci le occhiatine quando pensi che non ti vedo, furbett{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}!
                }                                                    
        {charTag(ThirdCharacter, "neutral")}:                   Ma la mia famiglia è abbastanza sfigata.
                                                                Mia mamma era un dieci in realtà. ma è morta qualche anno fa.
                                                                Era lei a tenerci tutti assieme, e ora tocca a mia sorella Marta.
                                                                Che però è una con una testa da otto ma un cuore da tre.
                                                                Praticamente un trattore.
        {charTag(ThirdCharacter, "jester")}:                    Quando Dona mi ha lasciato mi ha aiutato a modo suo: passando le serate a insultarla.
                                                                Ammetto che quando si è sposata mi ha sorpreso perché ero sicuro fosse lesbica.
        {charTag(ThirdCharacter, "neutral")}:                   Anche se sta con uno che è abbastanza fragilino.
                                                                Forse è davvero lesbica.
                                                                Lavora nel teatro il maritino.
        {charTag(ThirdCharacter, "jester")}:                    Chi ci va ancora a teatro?
        {charTag(ThirdCharacter, "neutral")}:                   Però forse è per questo che stanno bene assieme.
                                                                Le ho sempre voluto bene, e quando è nato l'Armandino poche settimane fa ho sentito addosso tutta la voglia che c'ho di diventare papà.
                                                                Anche se non dice niente e piange metà del tempo, a volte ti caccia dei sorrisoni che ti svoltano la giornata.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Sarà un latin lover come lo zio, si-cu-ro!
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           È una cosa così bella che a volte mi viene da piangere.
                }                                                         
        {charTag(ThirdCharacter, "bored")}:                     Ora tutta la famiglia gira attorno a mia sorella.
        {charTag(ThirdCharacter, "neutral")}:                   Anche la tipa di mio padre, che ha sempre un po' detestato Marta, sembra un'altra persona.
        {charTag(ThirdCharacter, "bored")}:                     Gira che ti rigira alla fine alle donne basta avere un figlio e zac, vita risolta.
                {
                - are_two_entities_together(FifthCharacter, PG):
                {charTag(FifthCharacter, "neutral")}:           Posso assicurarti che le cose sono molto più complicate di così.
                                                                E si risolvono gran poche cose con un figlio.
                }  
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Più ti sento più invidio chi non ti ha mai conosciuto.
                }   
        {charTag(ThirdCharacter, "bored")}:                     Papà la adorava già anche prima, ma papà è uno sfigato.
        {charTag(ThirdCharacter, "angry")}:                     Uno che si è fatto sempre portare via tutto: la casa, il bar, la mamma.
        {charTag(ThirdCharacter, "neutral")}:                   Con lui non ci parlo da due anni.
                                                                Da quando mi ha detto di non sposare Dona.
        {charTag(ThirdCharacter, "bored")}:                     Immagino che stia gongolando ora che le cose gli hanno dato ragione.
        {charTag(ThirdCharacter, "neutral")}:                   A volte viene in birreria, ma lo faccio sempre servire da qualcun altro.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:             Non ho voglia di essere associato a un tipo del genere, zero proprio.
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Il rispetto è una cosa che va guadagnata, anche dal proprio figlio.
                }                                                                  
                                                            
        
        + \ {charTag(PG, "neutral")}:                           Cosa ti manca di più di tua madre?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:       
                {charTag(ThirdCharacter, "neutral")}:           Zio, tu mi vuoi fare male così però!        
                } 
        {charTag(ThirdCharacter, "neutral")}:                   Lei non mi ha mai protetto dalle cose merdose della vita.
                                                                Ma mi ha sempre promesso di esserci se avevo bisogno di sfogarmi o di conforto.
        {charTag(ThirdCharacter, "melanchonic")}:               Questa è la cosa che mi manca di più {player_name}.
                                                                Abbassare la guardia una volta ogni tanto.
        {charTag(ThirdCharacter, "neutral")}:                   So che la vita fa cagare, non sono così coglione.
                                                                Ma vorrei poter tornare da lei, mettermi sul divano al suo fianco, e ascoltarla raccontare qualche pettegolezzo stupido sui vicini, fino a quando non passa tutto.
                
        + \ {charTag(PG, "neutral")}:                           Tra la parte con Donatella e questa, mi sembra che hai bisogno di una famiglia, ma non sai come starci dentro.
                    -> glyph_choice_manager(false, aetherC)->
        {charTag(ThirdCharacter, "angry")}:                     Sei qui per farmi un processo?
                                                                Perché sennò puoi anche andartene a fanculo.
        {charTag(ThirdCharacter, "neutral")}:                   Io <i>ci sto dentro</i>, son gli altri che non sanno come starmi vicino.
        {charTag(ThirdCharacter, "bored")}:                     Non mi far sentire una merda a gratis, {player_name}.
                                                                Uno che c'ha gli amici che c'ha da tutti questi anni ti sembra uno che non ci sa stare dentro?
                                                                E che cazzo.
                                                                        //Check parolacce da parte di Mentore
                                                                        ~ fifthChar_slurDetectorFunction()
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:           Ci sono momenti in cui quasi mi dispiace per te.
                {charTag(FirstCharacter, "annoyed")}:           Ma poi riesci a dire qualcosa che ti rende totalmente incagabile.
                                                                Una roba da Nobel proprio.                                                       
                }                                                         

        + \ {charTag(PG, "neutral")}:                           I trattori fanno un lavoro enorme per farci vivere e mangiare.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "neutral")}:                   Esatto.
                                                                Mia sorella è proprio quel tipo di persona.
                                                                Non è una capace di dirti "Vieni qui, ti do un abbraccio".
                                                                Non l'ho mai vista affettuosa manco con suo marito.
                                                                Però stai certo che se hai un casino te l'ha risolto prima ancora che tu possa dire "Pio".
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "question")}:                  E se invece dico "Cra"?
                {charTag(ThirdCharacter, "jester")}:            Sono le stesse lettere, Franco.
                {charTag(Franco, "question")}:                  La <i>c</i> di Cra è uguale alla <i>p</i> di Pio?
                {charTag(ThirdCharacter, "neutral")}:           Lo stesso numero, non proprio proprio le stesse lettere.
                {charTag(Franco, "neutral")}:                   Devo dirlo a Euforbo, subito.
                {charTag(Franco, "question")}:                  Chissà se la <i>v</i> è uguale alla <i>f</i>.
                                                                Allora mi posso anche chiamare Vranco?                                                                                                                                           
                }                                                        
            
        + \ {charTag(PG, "neutral")}:                           C'è questa cosa curiosa, mi sembra che stai molto attento a chi è debole e chi no, vero?
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "bored")}:                     Giusto perché non voglio diventare come loro.
                                                                Chi è che vuole essere un perdente?
        {charTag(ThirdCharacter, "neutral")}:                   La vita è crudele coi perdenti.
                                                                Ti prende a calci sui denti e ti lascia lì, a terra.
                                                                Solo.
                {
                - are_two_entities_together(FifthCharacter, PG):
                {charTag(FifthCharacter, "sad")}:               Povera stellina.                  
                }                                                 
            
        + \ {charTag(PG, "neutral")}:                           Non capisco perché eviti tuo padre invece di affrontarlo.
                -> glyph_choice_manager(false, fireC)-> 
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:       
                {charTag(ThirdCharacter, "neutral")}:           Uh, non c'avevo pensato.
                                                                Magari gli scrivo anche una lettera, che dici?
                                                                "Caro papà, faccio questa cosa emotiva così {player_name} è content{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}..."        
                } 
                {charTag(ThirdCharacter, "bored")}:             Quando non hai tanti soldi una delle poche cose su cui hai ancora potere sono le parole.
                                                                A chi le dici.
                                                                Se le dici.
                                                                Quando le dici.
                {charTag(ThirdCharacter, "neutral")}:           Questo posso fare.
                                                                Non parlargli è un modo per affrontarlo.
                {charTag(ThirdCharacter, "angry")}:             E non lo sto evitando.
            - 
        {charTag(ThirdCharacter, "neutral")}:                   Comunque la famiglia è una cosa strana, {player_name}.
                                                                Io non ci credo che ci può essere tutto questo amore con qualcuno con cui cresci.
                                                                Vedi troppe brutte cose.
                {
                - are_two_entities_together(Mentor, PG):     
                {charTag(FifthCharacter, "sad")}:               Ma si vedono anche quelle belle, {charNameThree}.
                                                                E le piccole cose quotidiane che alimentano l'amore.                                   
                }                                                

            -> third_char_closing_storylet ->
            -> options_third_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:                   Forse col Poggi qui saprei cosa dire per andarmene.
        {charTag(ThirdCharacter, "jester")}:                    O per lo meno ci faremmo quattro risate in più.
                                                                Lui è quel tipo di amico che...
        {charTag(ThirdCharacter, "neutral")}:                   Uh.

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Quello con cui puoi parlare delle fighe ma anche fare un discorso serio, quel tipo di amico, hai presente?
                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Noi non siamo come voi che passate le ore a parlare di cose <i>intime</i> e a condividervi i segreti mentre vi fate i bigodini.
                                                                Però si può stare assieme e fare qualcosa tipo il calcio e magari nel mentre la dici anche la cosa seria.
                                                                E lui è quello a cui puoi dire la cosa seria.
                {charTag(ThirdCharacter, "jester")}:            E poi cazzeggiare.
                } 
        {charTag(ThirdCharacter, "neutral")}:                   L'ho conosciuto alle medie, e all'inizio lo odiavo.
                                                                Tutto pulitino e ordinato, una vera fighetta.
                                                                Sua mamma era una che pensava di vivere a Parigi, quando c'aveva la casa attaccata alla tangenziale.
        {charTag(ThirdCharacter, "jester")}:                    Un sei che si guarda così storta da convincersi di essere un nove.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Anche se da piccoli andavamo tutti a casa loro d'estate a guardarcela mentre se ne stava stesa nel giardino in costume.
                                                                C'è un'età in cui ti arrapi anche con un frigorifero, cazzo.
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Suo padre invece era uno che lavorava tantissimo all'estero.
                                                                Ma in paese si diceva che in realtà aveva un'altra famiglia a Milano, e per quello lo si vedeva in giro quasi solo i fine settimana.
                }                                                          
        {charTag(ThirdCharacter, "neutral")}:                   Con gli altri l'abbiamo menato un paio di volte, ma c'era qualcosa di orgoglioso in lui, e alla fine dopo il primo anno mi sono ritrovato a fare le pause con lui invece che con gli altri idioti con cui uscivo.
                                                                Abbiamo fatto anche le altre scuole assieme, persino i primi due anni di Ingegneria.
                                                                Anche se io volevo solo fare festa.
        {charTag(ThirdCharacter, "jester")}:                    Diciamocelo: non posso essere <b>così</b> bono e pure intelligente, sennò chi le ferma più le {thirdChar_recordedPlayerPronoun == him: fighe|tipe}?
        {charTag(ThirdCharacter, "neutral")}:                   E lì la gente era troppo seria, non sai la rottura di balle.
                                                                Amanda l'ha conosciuta lì, e lei è tipo l'opposto dell'ingegnere, divertente come poche, ed è una che ci dà le paste a tutti.
                                                                È lei l'uomo di casa, e quando è nata Olivia il Poggi è stato felice di smollare il lavoro e fare il mammo.
                                                                Quelli del calcetto lo prendono in giro ancora, tranne Rocco, ma per me è una cosa proprio da Poggi.
                                                                Lui se ne frega delle cose che pensano gli altri.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "melanchonic")}:       E di cattiverie gliene abbiamo dette tante negli anni, ma davvero tante.
                                                                
                - else:
                {charTag(ThirdCharacter, "bored")}:             A me non è una cosa che viene così bene.
                }                                                          
        {charTag(ThirdCharacter, "neutral")}:                   A lui potevo dirgli tutte le mie merde.
                                                                Quando ho perso il lavoro, il lavoro buono, mi ha ascoltato per ore e questa cosa secondo me mi ha salvato.
        {charTag(ThirdCharacter, "jester")}:                    Salvato da brutti pensieri.
        {charTag(ThirdCharacter, "neutral")}:                   Però ora che c'è Olivia, qualcosa si è raffreddato.
                                                                Non so dire cosa, all'inizio mi ha anche fatto fare da padrino al battesimo.
                                                                Forse gli pesa non avere un lavoro, raccontare solo della bambina.
        {charTag(ThirdCharacter, "bored")}:                     O forse un po' gli faccio pena.
        {charTag(ThirdCharacter, "neutral")}:                   A volte me lo chiedo.
                                                                A calcetto a volte me le fanno le battute, sul fatto che Dona mi ha lasciato perché non mi tira più o perché faccio un lavoro da ragazzino.
                                                                So che il Poggi non è uno che ragiona così.
                                                                Però ha sempre trovato il tempo per fare cose assieme anche quando si è messo con Amanda, anche dopo il matrimonio.
                                                                Anche i primi due anni di Olivia.
                                                                Ma ora.
        {charTag(ThirdCharacter, "melanchonic")}:               Nulla.
        {charTag(ThirdCharacter, "neutral")}:                   Anche quando è finita con Dona, giusto un paio di bevute assieme e basta.
        {charTag(ThirdCharacter, "bored")}:                     E gli auguri per le feste e per il compleanno.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:            Ma alla fine noi uomini facciamo amicizia così, no?
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:           Ma va bene così, no?
                }
                {
                - are_two_entities_together(Mentor, PG):     
                {charTag(FifthCharacter, "sad")}:               Povero ragazzo.
                                                                Povero povero ragazzo.                                      
                }                                                          

        
        + \ {charTag(PG, "neutral")}:                           Hai provato a dirgli che ti manca?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:       
                {charTag(ThirdCharacter, "jester")}:            E magari gli dico anche "Ti amo".
                                                                Che amici c'hai tu?                
                } 
        {charTag(ThirdCharacter, "neutral")}:                   No, ma perché non serve.
                                                                Lo sa che sono contento quando ci sentiamo.
                                                                Non è che gli scrivo perché non so cosa fare.
        {charTag(ThirdCharacter, "jester")}:                    Gli mando anche qualche meme.
        {charTag(ThirdCharacter, "neutral")}:                   Non serve dirglielo, lo sa.

        + \ {charTag(PG, "neutral")}:                           Non è che devi continuare a scavarti questo tunnel della solitudine, {charNameThree}.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:        
                {charTag(ThirdCharacter, "bored")}:             Gesù.
                                                                Licantropo.
                                                                Che.
                                                                Pesantezza.
                {charTag(ThirdCharacter, "jester")}:            Sicuro tu e {charNameOne} migliori amiche proprio.         
                } 
        {charTag(ThirdCharacter, "neutral")}:                   Non mi scavo nessun tunnel.
                                                                Ho i raga del calcetto, ricordi?
                                                                E a lavoro passo le ore a scherzare con Petra.
                                                                E ci sono i clienti.
                                                                Quale solitudine e solitudine proprio, io boh.


        + (earth) \ {charTag(PG, "neutral")}:                   Quindi questa è un po' la vita che ti aspettavi con Donatella.
                -> glyph_choice_manager(false, earthC)->
        {charTag(ThirdCharacter, "melanchonic")}:               Già.
        {charTag(ThirdCharacter, "neutral")}:                   Il Poggi è così felice con Amanda e la piccoletta.
                                                                Se non fossi stato con una stronza, a quest'ora ci beccheremmo il sabato pomeriggio per portarle al campetto.
        {charTag(ThirdCharacter, "jester")}:                    Perché anche se mi nasce una femmina deve imparare ad amare l'Inter, punto.
        
        + \ {charTag(PG, "neutral")}:                           <i>Resto in silenzio: nessuna domanda mi farebbe capire meglio la situazione.</i>
                -> glyph_choice_manager(false, airC)->
        {charTag(ThirdCharacter, "neutral")}:                   Non sapevo che potevi stare zitt{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}!
        {charTag(ThirdCharacter, "jester")}:                    Qualcuno lo dica a {charNameOne}!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Guardatemi, sono {charNameThree}.
                                                                Parlo diciotto ore al giorno di fantacalcio, ma guai se una ragazza ha un'opinione.
                {charTag(ThirdCharacter, "bored")}:             Magari una sola opinione, magari!                                                      
                }        
        {charTag(ThirdCharacter, "jester")}:                    Mi devo preoccupare del tuo silenzio {player_name}?
        {charTag(ThirdCharacter, "bored")}:                     Ora finisco per chiedermi se ho detto delle cazzate.
        {charTag(ThirdCharacter, "neutral")}:                   Non è morto nessuno comunque, non ti preoccupare.
                                                                Ogni amicizia va a modo suo, no?
        
        + \ {charTag(PG, "neutral")}:                           Fate qualcosa assieme, tipo giocare a calcetto di nuovo! O un'uscita a quattro con Ava!
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "jester")}:            Sicur{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} di non essere un uomo?
                }
        {charTag(ThirdCharacter, "neutral")}:                   Per un po' gli ho scritto del calcetto.
                                                                All'inizio si inventava delle scuse, poi ha proprio smesso di rispondere.
        {charTag(ThirdCharacter, "bored")}:                     Si è anche tolto dalla chat.
        {charTag(ThirdCharacter, "neutral")}:                   Anche quella del fantacalcio.
                                                                E no, niente Ava per ora.
        {charTag(ThirdCharacter, "melanchonic")}:               Non credo che nemmeno lui approverebbe. 
                
            -
        {charTag(ThirdCharacter, "neutral")}:                   Comunque {player_name} io non c'ho altro da dirti.
                                                                Ho una vita semplice, magari non perfetta ma felice.
        {charTag(ThirdCharacter, "jester")}:                    Per cui fai quella roba della riscrittura quando puoi così posso tornare alla mia birra in frigo.
        {charTag(ThirdCharacter, "bored")}:                     Sempre che non se la sia rubata di nuovo lo Stracciamaroni.
 
            -> third_char_closing_storylet ->
            -> options_third_character
    


    ///Scelte legate alle lettere
    === third_char_letters_choices



    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(TheWitch, witch_state())}:                     <i>{charNameThree} ha bisogno dell'aiuto di {player_name}.</i>
                                                                <i>La cagnolina consegnerà le risposte di {player_name} a {charNameThree}.</i>
                                                                <i>La prima cosa che ha chiesto {charNameThree} sono i pronomi di {player_name}.</i>
                                                                        -> gender.top ->
                                                                <i>E poi {charNameThree} chiede: <b>Come faccio capire a mia sorella che sono pronto a cambiare?</b></i>
                                                                <i>Cosa vorrebbe rispondere {player_name}?</i>
        

        + (air)\ {charTag(PG, "neutral")}:                      Perché non cercare online persone con la tua esperienza? Potresti scoprire soluzioni che altr3 hanno già trovato.

        + (earth)\ {charTag(PG, "neutral")}:                    Migliora la tua situazione economica, così vedrà che sei più solido di quello che pensa.
                
        + (fire)\ {charTag(PG, "neutral")}:                     Hai i tuoi motivi per essere incazzato. Se lei non lo capisce è un problema solo suo.
                
        + (water)\ {charTag(PG, "neutral")}:                    Raccontale a cuore aperto quello che stai provando in questo periodo.
                
        + (aether)\ {charTag(PG, "neutral")}:                   Ti conosce da una vita: chiedile un consiglio.
                
        -

        ->->

    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(TheWitch, witch_state())}:                     <i>{charNameThree} chiede a {player_name} come può farsi degli amici alla sua età.
                                                                <i>E dice che non comprende le persone.
                                                                <i>Come aiutiamo {charNameThree}?</i>

        + (air)\ {charTag(PG, "neutral")}:                      Non hai pensato che forse è a loro manca la curiosità di conoscerti per davvero?
                
        + (earth)\ {charTag(PG, "neutral")}:                    Prenditi del tempo per te, e curati del tuo corpo: vai in palestra, mettiti in forma, scarica la tensione.
                
        + (fire)\ {charTag(PG, "neutral")}:                     Riprenditi quel calcetto! Poggi l'ha fatto per te, per quando stavi male, non devi far vincere il Merlo!
                
        + (water)\ {charTag(PG, "neutral")}:                    Ti fidi di Rocco: fai il primo passo e invitalo a bere.
                
        + (aether)\ {charTag(PG, "neutral")}:                   Petra ti è già amica, e la sua rabbia ha qualcosa di importante da insegnarti. Chiedile di aiutarti a capire.
                
        -

        ->->

    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

                TODO: Commento diverso da parte della strega su GM a seconda dello stato della storia
                {//Storylet temporaneo, da sistemare poi a personaggia scritta.
                - fourthChar_storyStatus == story_storyNotStarted && grimoire_fourthChar hasnt grimFourthCharThree:
                {charTag(TheWitch, witch_state())}:             <i>G.M.</i>
                                                                <i>Che cose strane fa la magia.</i>
                                                                <i>Non sentivamo quel nome da così tanto.</i>
                                                                <i>E ora è ovunque.</i>
                
                - fourthChar_storyStatus == story_storyNotStarted && grimoire_fourthChar has grimFourthCharThree:
                {charTag(TheWitch, witch_state())}:             <i>G.M.</i>
                                                                <i>Il nome in codice di {charNameFour}</i>
                                                                <i>Chissà se {charNameFour} sarebbe felice di sapere che qualcuno la considera una supereroina</i>
                
                - else:
                {charTag(TheWitch, witch_state())}:             <i>G.M.</i>
                                                                <i>Da quanto non sentivamo quel nome?</i>
                                                                <i>Siamo così felici che il suo ricordo sia vivo.</i>
                                                                <i>Anche se.</i>
                                                                <i>Supereroina.</i>
                }

        {charTag(TheWitch, witch_state())}:                     <i>Chiediamo a {player_name} di non scrivere nulla a Petra per ora.</i>
                                                                <i>Fino a quando non sappiamo quali saranno le conseguenze di questa situazione.</i>
                                                                <i>Ma nel mentre {player_name} può dare un consiglio a {charNameThree}.</i>
                                                                <i>Una prospettiva sulla relazione tra {charNameThree} e l'entità digitale chiamata Ava.</i>

        + (air)\ {charTag(PG, "neutral")}:                      Una AI è fonte di conoscenza infinita: la relazione con lei può insegnarti tantissime cose!

        + (earth)\ {charTag(PG, "neutral")}:                    Il valore di una persona viene dalle sfide reali, non da una gara truccata in partenza.

        + (fire)\ {charTag(PG, "neutral")}:                     Hai già i tuoi casini: chi se ne frega di chi tradisce chi, divertirti per una volta!
                
        + (water)\ {charTag(PG, "neutral")}:                    Ora che Ava ti ha dato più sicurezza, perché non provi a prenderti cura dei rapporti che hai già, come quelli con la tua famiglia?

        + (aether)\ {charTag(PG, "neutral")}:                   Dalle il giusto saluto, e prova a capire cosa hai imparato su di te.
                
        -

        ->->


    = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(TheWitch, witch_state())}:                     <i>{charNameThree} ha bisogno dell'aiuto di {player_name} per chiarire la situazione con Poggi, senza fare un disastro.</i>
                                                                <i>Qual è il consiglio di {player_name}?

        + (air)\ {charTag(PG, "neutral")}:                      Chiedigli cosa è successo, senza scappatoie: ti deve una risposta ragionevole, zero scappatoie.

                
        + (earth)\ {charTag(PG, "neutral")}:                    Accetta che la cosa è cambiata, e continua a costruirti una vita senza di lui.
                

        + (fire)\ {charTag(PG, "neutral")}:                     Dai fuoco a tutto e fagli capire quanto sei incazzato.
                

        + (water)\ {charTag(PG, "neutral")}:                    Fagli capire quanto ti manca, senza che sia la rabbia a parlare al posto tuo.
                

        + (aether)\ {charTag(PG, "neutral")}:                   Offri in modo sincero il tuo aiuto per la raccolta fondi.
                
        -

        ->->


    = five
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        {charTag(TheWitch, witch_state())}:                     <i>C'è qualcosa che {player_name} vuole scrivere a {charNameThree}?</i>

        + (air)\ {charTag(PG, "neutral")}:                      Che siano Poggi o Donatella, i pareri degli altri mostrano solo la loro prospettiva, non la tua realtà.

                
        + (earth)\ {charTag(PG, "neutral")}:                    Non farlo ora, aspetta di sbatterle in faccia l'uomo nuovo che diventerai.
                

        + (fire)\ {charTag(PG, "neutral")}:                     Per ricominciare da capo serve distruggere tutto, bruciare il passato.
                

        + (water)\ {charTag(PG, "neutral")}:                    Le cose dette da Poggi ti hanno ferito, lascia perdere Donatella ora e chiedi aiuto a chi ti vuole bene.
                

        + (aether)\ {charTag(PG, "neutral")}:                   {charNameThree} non hai bisogno di una spirale autodistruttiva ma di un aiuto, che sia psicologico o spirituale.
                
        -

        ->->

    = six
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        {charTag(TheWitch, witch_state())}:                     <i>{charNameThree} vorrebbe invitare il padre a parlare in un posto che renda la conversazione per {charNameThree} meno faticosa.</i>
                                                                <i>Qual è il consiglio di {player_name}?</i>

        + (air)\ {charTag(PG, "neutral")}:                      Fallo per telefono: niente distrazioni fisiche o espressioni facciali, pura lucidità.

                
        + (earth)\ {charTag(PG, "neutral")}:                    Al Baretto, per ricordargli cosa ha perso.
                

        + (fire)\ {charTag(PG, "neutral")}:                     Al campetto di calcio, così gli fai vedere nel mentre quanto sei forte.
                

        + (water)\ {charTag(PG, "neutral")}:                    Un posto legato a tua madre, così che tu possa sentirla vicina.
                

        + (aether)\ {charTag(PG, "neutral")}:                   Invita anche tua sorella, così che possa aiutarvi ad affrontare il discorso.
                
        -

        ->->

    = seven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        //Seconda riscrittura
        -> third_char_second_rewriting ->
        ->->