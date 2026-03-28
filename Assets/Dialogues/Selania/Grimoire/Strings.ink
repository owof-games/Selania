//Per non duplicare il lavoro, trasformo i riassunti del grimorio che sono condivisi (quelli degli storylets comuni) in stringhe che poi chiamo sulle rispettive pagine.
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour= translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

// VAR grimFirstCharMentor_text = "Durante una conversazione con {mentorName} , {charNameOne} si è infastidita perché {mentorName}ha definito la felicità non un luogo da raggiungere, ma qualcosa che si ha dentro, ma {charNameOne} crede sia un privilegio di chi fa il lavoro che ama. E teme che questo significhi che la felicità "te la ritrovi se ti fai andare bene quello che hai."

VAR grimFirstCharMentor_text = ""