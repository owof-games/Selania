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
            builder.RegisterSettings(settings,
                settingsRooms: new SettingsRoom(rooms),
                settingsSaveSystem: new SettingsSaveSystem());
            builder.Register<EmptyAudioSystem>(Lifetime.Singleton).As<IAudioSystem>();
        }

        private class SettingsSaveSystem : ISettingsSaveSystem
        {
            public string SaveDirPrefix => "museum_room_save_dir_";
            public TimeSpan MinimumTimeBetweenAutomaticSaves { get; } = TimeSpan.FromSeconds(5);
            public int MinimumNumberOfRetainedSaves => 5;
            public TimeSpan MinimumTimeSpanOfSavesRetained { get; } = TimeSpan.FromSeconds(20);
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