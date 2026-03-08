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
    INCLUDE Code\TextFunctions.ink
    INCLUDE Code\Notifications.ink
  
    INCLUDE GamerModeMaterial\Settings.ink
    INCLUDE GamerModeMaterial\Carla\TutorialManagement.ink
    INCLUDE GamerModeMaterial\Carla\TutorialStorylets.ink
    INCLUDE GamerModeMaterial\Carla\Carla.ink

//File dedicati alla gestione delle personagge
    INCLUDE CommonPNGElements\ScheduleFunctions.ink
    INCLUDE CommonPNGElements\InkManagement.ink
    INCLUDE CommonPNGElements\CommonStoryletsManager.ink
    INCLUDE CommonPNGElements\CommonStorylets.ink
    INCLUDE CommonPNGElements\SpecialStorylets.ink
    INCLUDE CommonPNGElements\OnMovementsEvents.ink
    INCLUDE CommonPNGElements\GiftsAndIngredientFunctions.ink
    INCLUDE CommonPNGElements\NamingFunctions.ink
    INCLUDE CommonPNGElements\SpeakerTagManagers.ink
    INCLUDE CommonPNGElements\ChoicesManagement\SigilsTranslator.ink
    INCLUDE CommonPNGElements\ChoicesManagement\GlyphsVarAndLists.ink
    INCLUDE CommonPNGElements\ChoicesManagement\SigilsActivation.ink
    INCLUDE CommonPNGElements\ChoicesManagement\ChoicesManager.ink
    INCLUDE CommonPNGElements\ChoicesManagement\Glyph&SigilsFunctions.ink



                    /* ---------------------------------
                    
                                CONTENUTI
                    
                     ----------------------------------*/

//Personagge
    INCLUDE Characters\Mentor\Mentor.ink
    INCLUDE Characters\Mentor\MentorManagement.ink
    INCLUDE Characters\Mentor\StoryletsManagement.ink
    INCLUDE Characters\Mentor\MentorStorylets.ink
    INCLUDE Characters\Mentor\HelpfulMentor.ink
    INCLUDE Characters\Mentor\MentorTutorial.ink
    INCLUDE Characters\Mentor\CharsFeedbacks.ink
    INCLUDE Characters\Mentor\MentorSpecialStorylets.ink
    
    
    INCLUDE Characters\Witch\Witch.ink
    INCLUDE Characters\Witch\WitchManagement.ink
    INCLUDE Characters\Witch\WitchStoryletsManagement.ink
    INCLUDE Characters\Witch\WitchStorylets.ink
    
    
    INCLUDE Characters\FirstChar\FirstCharDialogueManager.ink
    INCLUDE Characters\FirstChar\FirstChar.ink
    INCLUDE Characters\FirstChar\FirstCharManagement.ink
    INCLUDE Characters\FirstChar\FirstCharStoryletsManagement.ink
    INCLUDE Characters\FirstChar\FirstCharStorylets.ink
    INCLUDE Characters\FirstChar\FirstCharSpecialStorylets.ink
    INCLUDE Characters\FirstChar\FirstCharRewriting.ink
    INCLUDE Characters\FirstChar\FirstCharArchive.ink
    


    INCLUDE Characters\SecondChar\SecondCharDialogueManager.ink
    INCLUDE Characters\SecondChar\SecondChar.ink
    INCLUDE Characters\SecondChar\SecondCharManagement.ink
    INCLUDE Characters\SecondChar\SecondCharStoryletsManagement.ink
    INCLUDE Characters\SecondChar\SecondCharStorylets.ink
    INCLUDE Characters\SecondChar\SecondCharSpecialStorylets.ink
    INCLUDE Characters\SecondChar\SecondCharRewriting.ink
    
    
    INCLUDE Characters\ThirdChar\ThirdChar.ink
    INCLUDE Characters\ThirdChar\ThirdCharacterManagement.ink
    INCLUDE Characters\ThirdChar\ThirdCharStorylets.ink
    INCLUDE Characters\ThirdChar\ThirdCharSpecialStorylets.ink
    INCLUDE Characters\ThirdChar\ThirdCharDialogueManager.ink
    INCLUDE Characters\ThirdChar\ThirdCharStoryletsManagement.ink
    INCLUDE Characters\ThirdChar\ThirdCharRewriting.ink
 
    INCLUDE Characters\FourthChar\FourthCharacter.ink
    INCLUDE Characters\FourthChar\FourthCharStorylets.ink
    INCLUDE Characters\FourthChar\FourthCharacterManagement.ink
    

    INCLUDE Characters\FifthChar\FifthCharacter.ink
    INCLUDE Characters\FifthChar\FifthCharStorylets.ink
    INCLUDE Characters\FifthChar\FifthCharacterManagement.ink
    

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

//Kitchen
    INCLUDE Kitchen\Kitchen.ink
    INCLUDE Kitchen\KitchenCode.ink
    
    INCLUDE Kitchen\CookingAlone.ink
    INCLUDE Kitchen\FirstCharFoodChat.ink
    INCLUDE Kitchen\SecondCharFoodChat.ink
    INCLUDE Kitchen\ThirdCharFoodChat.ink

//Library
    INCLUDE Library\Library.ink
    INCLUDE Library\FirstStory.ink
    INCLUDE Library\SecondStory.ink
    INCLUDE Library\ThirdStory.ink
    INCLUDE Library\FourthStory.ink
    INCLUDE Library\LibraryManagement.ink

//Dump
    INCLUDE Dump\Dump.ink
    INCLUDE Dump\Var&Functions.ink

//Starting point
    -> main











