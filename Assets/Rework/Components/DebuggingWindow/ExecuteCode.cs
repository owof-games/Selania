using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.DebuggingWindow
{
    public class ExecuteCode : MonoBehaviour
    {
        [SerializeField] private TMP_InputField codeInputField = null!;
        [SerializeField] private TMP_Text output = null!;
        [Inject] internal IStoryCodeExecutor StoryCodeExecutor = null!;

        public void OnExecuteButton()
        {
            var expression = codeInputField.text;
            var result = StoryCodeExecutor.Execute(expression);
            output.text = result.Error != null ? $"<color=\"#ff0000\">{result.Error}" : result.Output;
        }
    }
}