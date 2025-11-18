                    /* ---------------------------------
                    
                       ELEMENTI DI GESTIONE DEL GIOCO
                    
                     ----------------------------------*/
    
    INCLUDE main.ink

//File con gli appunti di gestione del progetto, la formattazione etc.
    INCLUDE Notes\FileManagement.ink

//File dedicati alla gestione complessiva del progetto
    INCLUDE Code\Debug.ink
    INCLUDE Code\ObjectAndCharList.ink
    INCLUDE Code\PGManagement.ink
    INCLUDE Code\ChangePlaces.ink
    INCLUDE Code\PlacesContentsAndFunctions.ink
    INCLUDE Code\BackgroundsAndSounds.ink
    INCLUDE Code\BigDialogue.ink
    INCLUDE Code\NestDialogue.ink
    INCLUDE Code\SpeakerTagManagers.ink
    INCLUDE Code\TextFunctions.ink

//File dedicati alla gestione delle personagge
    INCLUDE Characters\Functions\CommonFunctions.ink
    INCLUDE Characters\Functions\Ink.ink
    
    INCLUDE Characters\Functions\FirstCharacterManagement.ink
    INCLUDE Characters\Functions\SecondCharacterManagement.ink
    INCLUDE Characters\Functions\ThirdCharacterManagement.ink
    INCLUDE Characters\Functions\FourthCharacterManagement.ink
    INCLUDE Characters\Functions\FifthCharacterManagement.ink
    INCLUDE Characters\Functions\WitchManagement.ink


                    /* ---------------------------------
                    
                                CONTENUTI
                    
                     ----------------------------------*/

//Personagge
    INCLUDE Characters\Mentor\HelpfulMentor.ink
    INCLUDE Characters\Mentor\StoryletsManagement.ink
    INCLUDE Characters\Mentor\StoryletsContent.ink
    
    INCLUDE Characters\Stories\FirstCharacter.ink
    INCLUDE Characters\Stories\SecondCharacter.ink
    INCLUDE Characters\Stories\ThirdCharacter.ink
    INCLUDE Characters\Stories\FourthCharacter.ink
    INCLUDE Characters\Stories\FifthCharacter.ink
    
    INCLUDE Characters\Stories\FirstCharSpecialStorylets.ink
    INCLUDE Characters\Stories\SecondCharSpecialStorylets.ink
    INCLUDE Characters\Stories\ThirdCharSpecialStorylets.ink
    
    INCLUDE Characters\Stories\CommonStoryletsManager.ink
    INCLUDE Characters\Stories\CommonStorylets.ink

//Gestione dell'inventario
    INCLUDE Backpack\Backpack.ink
    INCLUDE Backpack\BackpackManagement.ink

//Gestione del libro
    INCLUDE Book\MainBook.ink
    INCLUDE Book\BookFunctions.ink
    INCLUDE Book\RulesRecap.ink
    //Characters recap
    INCLUDE Book\FirstCharRecap.ink
    INCLUDE Book\SecondCharRecap.ink
    INCLUDE Book\ThirdCharRecap.ink
    INCLUDE Book\FourthCharRecap.ink
    INCLUDE Book\FifthCharRecap.ink
    INCLUDE Book\OtherCharsRecap.ink
    //Minigames informations
    INCLUDE Book\FrogRecap.ink
    INCLUDE Book\GreenhouseRecap.ink
    INCLUDE Book\KitchenRecap.ink
    INCLUDE Book\NestRecap.ink
    
//Bedroom
    INCLUDE Bedroom\Bedroom.ink

//Train Stop
    INCLUDE TrainStop\TrainStop.ink

//Forest
    INCLUDE Forest\Forest.ink
    INCLUDE Forest\Witch.ink
    INCLUDE Forest\WitchStorylets.ink

//Greenhouse
    INCLUDE Greenhouse\Greenhouse.ink
    INCLUDE Greenhouse\Cultivable.ink
    INCLUDE Greenhouse\CultivableManagement.ink
    
//Pond    
    INCLUDE Pond\Pond.ink
    INCLUDE Pond\FrogVarAndLists.ink
    INCLUDE Pond\FrogDialogues.ink
    INCLUDE Pond\FrogQuestManagement.ink
    INCLUDE Pond\FrogMissions.ink
    INCLUDE Pond\FrogGifts.ink
    

//Nest
    INCLUDE Nest\Nest.ink
    INCLUDE Nest\NestVarsAndLists.ink
    INCLUDE Nest\NestCode.ink
    INCLUDE Nest\NestDispatcher.ink
    INCLUDE Nest\NestEWM.ink
    INCLUDE Nest\ColorManager.ink
    INCLUDE Nest\NestTranslator.ink

//Kitchen
    INCLUDE Kitchen\Kitchen.ink
    INCLUDE Kitchen\KitchenCode.ink
    
    INCLUDE Kitchen\CookingAlone.ink
    INCLUDE Kitchen\FirstCharFoodChat.ink
    INCLUDE Kitchen\SecondCharFoodChat.ink

//Library
    INCLUDE Library\Library.ink
    INCLUDE Library\FirstStory.ink
    INCLUDE Library\SecondStory.ink
    INCLUDE Library\ThirdStory.ink
    INCLUDE Library\FourthStory.ink
    INCLUDE Library\LibraryManagement.ink






































//Starting point
    -> main











