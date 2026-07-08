using System;
using System.Collections.Generic;
using System.Linq;
using R3;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelAppendixGrimoire : MonoBehaviour
    {
        [Tooltip("All the buttons that this level presents")] [SerializeField]
        private ButtonInfo[] buttonInfo = null!;

        /// <summary>
        ///     Subject where the click observable will be sent at Start() time.
        /// </summary>
        private readonly ReplaySubject<Observable<string>> _clickObservables = new(1);

        /// <summary>
        ///     An observable that produces a string with the name of the button each time a button is clicked. The names
        ///     of the buttons are described in <see cref="buttonInfo" />.
        /// </summary>
        public Observable<string> clickObservable => _clickObservables.Switch();

        private void Start()
        {
            // map each button info to an observable of strings with their name, then merge them all together
            var observable = buttonInfo
                .Select(info => info.button.OnClickAsObservable().Select(_ => info.clickName))
                .Aggregate<Observable<string>, Observable<string>?>(null,
                    (current, newObservable) => current == null ? newObservable : current.Merge(newObservable));

            // send the created observable, or the empty observable if we have no buttons (this should not happen)
            _clickObservables.OnNext(observable ?? Observable.Empty<string>());
        }

        public void SetUp(IEnumerable<(string, bool)> choices)
        {
            var choiceMapping = choices.ToDictionary(entry => entry.Item1, entry => entry.Item2);
            foreach (var button in buttonInfo)
            {
                var notification = button.button.GetComponentInChildren<GrimoireNotification>();
                if (choiceMapping.TryGetValue(button.clickName, out var isChanged))
                {
                    button.button.interactable = true;
                    notification.ShowNotification(isChanged);
                }
                else
                {
                    button.button.interactable = false;
                    notification.ShowNotification(false);
                }
            }
        }

        /// <summary>
        ///     Information about a single button.
        /// </summary>
        [Serializable]
        public class ButtonInfo
        {
            /// <summary>
            ///     The button component itself.
            /// </summary>
            public Button button = null!;

            /// <summary>
            ///     The name produced when the button is clicked (see <see cref="SecondLevelCharactersGrimoire.clickObservable" />).
            /// </summary>
            public string clickName = null!;
        }
    }
}