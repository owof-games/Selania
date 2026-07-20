using System;
using System.Collections.Generic;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireNotifications
{
    public class GrimoireNotificationsScope : ScopeWithAutoInjectSupport
    {
        [SerializeField] [Tooltip("Settings of the game.")]
        private SelaniaSettings settings = null!;

        [SerializeField] [Tooltip("The ink bridge used for this section.")]
        private InkBridge inkBridge = null!;

        [SerializeField] private ISettingsRooms.RoomMap[] rooms = null!;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInkBridgeInstance(inkBridge, disableSaves: false);
            builder.RegisterSettings(settings,
                settingsSaveSystem: new SettingsSaveSystem(),
                settingsRooms: new SettingsRoom(rooms));
            builder.RegisterLogger();
            builder.RegisterInstance<IAudioSystem>(new EmptyAudioSystem());
        }

        private class SettingsSaveSystem : ISettingsSaveSystem
        {
            public string SaveDirPrefix => "museum_room_grimoire_notifications_";
            public TimeSpan MinimumTimeBetweenAutomaticSaves => TimeSpan.FromSeconds(1);
            public int MinimumNumberOfRetainedSaves => 5;
            public TimeSpan MinimumTimeSpanOfSavesRetained => TimeSpan.FromSeconds(1);
            public string InkListVariableNameWithCompletedStories => "story_endedStories";

            public string GetRoomNameFromInkValue(string inkValue)
            {
                return inkValue switch
                {
                    "Room1" => "Stanza 1",
                    "Room2" => "Stanza 2",
                    _ => throw new ArgumentException($"Unknown room name: {inkValue}", nameof(inkValue))
                };
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
    }
}