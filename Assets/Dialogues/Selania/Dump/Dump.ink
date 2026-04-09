=== dump ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{
    - dump == 1:
        {charTag(witch_tag(), witch_state())}   <i>Un vecchio vaso attende {player_name}.</i>
}

-> main








