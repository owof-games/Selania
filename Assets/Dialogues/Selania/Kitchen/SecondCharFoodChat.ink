/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
 
=== cooking_with_second_char
Cucino con Riccio.


    Ricetta completata:
    @animation:RewriterBook


    ~ move_entity(SecondCharacter, Pond)
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
Riccio cucina da solo.




-> main




=== food_gift_second_char
Riccio attiva il suo storylet dopo aver cucinato.



-> main