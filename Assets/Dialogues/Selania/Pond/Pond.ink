=== pond ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
           
{debug: La lista degli oggetti nella stanza è: {contentsPond}.}

{
    - pond == 1 && png_commonPauseTalking == false:
        {charTag(TheWitch, witch_state())}:   <i>Lo stagno è caldo, il cammino ricco dell'odore dei funghi.</i>
}
    
-> main





        

   
   