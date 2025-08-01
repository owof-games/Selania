using System;
using System.Threading.Tasks;
using UnityEngine;

namespace TaloGameServices
{
    public class PlayersAPI : BaseAPI
    {
        public event Action<Player> OnIdentified;
        public event Action OnIdentificationStarted;
        public event Action OnIdentificationFailed;

        public PlayersAPI() : base("v1/players") { }

        public void InvokeIdentifiedEvent()
        {
            OnIdentified?.Invoke(Talo.CurrentPlayer);
        }

        public async Task<Player> Identify(string service, string identifier)
        {
            OnIdentificationStarted?.Invoke();
            var uri = new Uri($"{baseUrl}/identify?service={service}&identifier={identifier}");

            try
            {
                var json = await Call(uri, "GET");

                var res = JsonUtility.FromJson<PlayersIdentifyResponse>(json);
                await Talo.Socket.ResetConnection();

                Talo.CurrentAlias = res.alias;
                Talo.Socket.SetSocketToken(res.socketToken);
                InvokeIdentifiedEvent();

                return Talo.CurrentPlayer;
            }
            catch
            {
                if (!Talo.IsOffline())
                {
                    await Talo.PlayerAuth.SessionManager.ClearSession();
                }

                OnIdentificationFailed?.Invoke();
                throw;
            }
        }

        public async Task<Player> IdentifySteam(string ticket, string identity = "")
        {
            if (string.IsNullOrEmpty(identity))
            {
                await Identify("steam", ticket);
            }
            else
            {
                await Identify("steam", $"{identity}:{ticket}");
            }

            return Talo.CurrentPlayer;
        }

        public async Task<Player> Update()
        {
            var uri = new Uri($"{baseUrl}/{Talo.CurrentPlayer.id}");
            var content = JsonUtility.ToJson(Talo.CurrentPlayer);
            var json = await Call(uri, "PATCH", Prop.SanitiseJson(content));

            var res = JsonUtility.FromJson<PlayersUpdateResponse>(json);
            Talo.CurrentPlayer = res.player;

            return Talo.CurrentPlayer;
        }

        public async Task<Player> Merge(string playerId1, string playerId2)
        {
            var uri = new Uri($"{baseUrl}/merge");
            string content = JsonUtility.ToJson(new PlayersMergeRequest(playerId1, playerId2));
            var json = await Call(uri, "POST", content);

            var res = JsonUtility.FromJson<PlayersUpdateResponse>(json);
            return res.player;
        }

        public async Task<Player> Find(string playerId)
        {
            var uri = new Uri($"{baseUrl}/{playerId}");
            var json = await Call(uri, "GET");

            var res = JsonUtility.FromJson<PlayersFindResponse>(json);
            return res.player;
        }
    }
}
