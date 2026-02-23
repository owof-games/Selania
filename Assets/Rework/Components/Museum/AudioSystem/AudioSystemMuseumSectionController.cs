using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.AudioSystem
{
    public class AudioSystemMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal IAudioSystem AudioSystem = null!;

        public void PlaySoundtrackNormal()
        {
            AudioSystem.CrossFadeToSoundtrack("normal");
        }

        public void PlaySoundtrackKitchen()
        {
            AudioSystem.CrossFadeToSoundtrack("kitchen");
        }

        public void PlayAmbientSoundsPond()
        {
            AudioSystem.CrossFadeToAmbientSounds("pondSounds");
        }

        public void PlayAmbientSoundsKitchen()
        {
            AudioSystem.CrossFadeToAmbientSounds("kitchenSounds");
        }
    }
}