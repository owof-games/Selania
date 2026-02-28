using System;
using System.Collections.Generic;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.SaveSystem
{
    public class SaveSystemMuseumRoomScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] private ISettingsRooms.RoomMap[] rooms = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge);
            builder.RegisterLogger();
            builder.RegisterInstance(new SettingsRoom(rooms)).AsImplementedInterfaces();
            builder.RegisterInstance(settings).As<ISettingsDialogueBox>().As<ISettingsLogger>();
            builder.Register<SettingsSaveSystem>(Lifetime.Singleton).As<ISettingsSaveSystem>();
            builder.Register<EmptyAudioSystem>(Lifetime.Singleton).As<IAudioSystem>();
        }

        // ReSharper disable once ClassNeverInstantiated.Local - used by DI
        private class SettingsSaveSystem : ISettingsSaveSystem
        {
            public string saveDirPrefix => "museum_room_save_dir_";
            public TimeSpan minimumTimeBetweenAutomaticSaves { get; } = TimeSpan.FromSeconds(10);
        }

        // ReSharper disable once ClassNeverInstantiated.Local - used by DI
        private class EmptyAudioSystem : IAudioSystem
        {
            public void CrossFadeToSoundtrack(string soundtrackName)
            {
            }

            public void CrossFadeToAmbientSounds(string ambientSoundsName)
            {
            }

            public void PlaySoundEffect(string soundEffectName)
            {
            }
        }

        private class SettingsRoom : ISettingsRooms
        {
            private readonly ISettingsRooms.RoomMap[] _rooms;

            public SettingsRoom(ISettingsRooms.RoomMap[] allRooms)
            {
                _rooms = allRooms;
            }

            public ICollection<ISettingsRooms.RoomMap> rooms => _rooms;
        }
    }
}