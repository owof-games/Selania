=== dump ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsForest}.}

{
    - dump == 1:
        {charTag(TheWitch, witch_state())}:   <i>Un vecchio pozzo attende {player_name}.</i>
}

-> main








