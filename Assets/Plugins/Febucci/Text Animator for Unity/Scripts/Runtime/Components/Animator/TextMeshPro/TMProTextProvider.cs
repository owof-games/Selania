// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using Febucci.TextAnimatorCore.Text;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Color = UnityEngine.Color;

namespace Febucci.TextAnimatorForUnity.TextMeshPro
{
    internal class TMProTextProvider : ITextGenerator
    {
        private readonly TMP_InputField attachedInputField;
        private readonly TMP_Text tmpComponent;

        //----- Values cache -----
        private bool autoSize;

        private int lastFirstChar;
        private int lastMinChar;
        private Color sourceColor;
        private Rect sourceRect;
        private TMP_TextInfo textInfo;
        private int tmpFirstVisibleCharacter;
        private int tmpMaxVisibleCharacters;

        public TMProTextProvider(TMP_Text tmpComponent, TMP_InputField attachedInputField)
        {
            this.tmpComponent = tmpComponent;
            this.attachedInputField = attachedInputField;
            textInfo = tmpComponent.textInfo;

            //prevents the text from being rendered at startup
            //e.g. in case user has stuff on the inspector
            tmpComponent.renderMode = TextRenderFlags.DontRender;
        }
        //-----

        public string GetFullText()
        {
            return tmpComponent.text;
        }

        public string GetStrippedTextWithoutAnyTags(string textWithoutTAnimTags)
        {
            return tmpComponent.GetParsedText();
        }

        /// <summary>
        ///     Equivalent to setting the text to the TMP component, without parsing it.
        ///     Please use <see cref="TextAnimatorComponentBase.SetText(string)" /> or
        ///     <see cref="TextAnimatorComponentBase.SetText(string, bool)" /> instead.
        /// </summary>
        /// <param name="text"></param>
        public void SetTextToSource(string text)
        {
            //Avoids rendering the text for half a frame
            tmpComponent.renderMode = TextRenderFlags.DontRender;

            //--generates mesh and text info--
            if (attachedInputField) attachedInputField.text = text; //renders input field
            else tmpComponent.text = text; //<-- sets the text


            // forces rebuilding the layout for text that is truncated etc., otherwise it keeps the
            // old textInfo
            switch (tmpComponent.overflowMode)
            {
                case TextOverflowModes.Overflow:
                case TextOverflowModes.ScrollRect:
                case TextOverflowModes.Masking:
                    break;
                default:
                    LayoutRebuilder.ForceRebuildLayoutImmediate(tmpComponent.rectTransform);
                    break;
            }

            ForceMeshUpdate();

            textInfo = tmpComponent.GetTextInfo(tmpComponent.text);
            tmpComponent.renderMode = TextRenderFlags.DontRender;
        }

        public int GetCharactersCount()
        {
            return textInfo.characterCount;
        }

        public bool HasChangedMeshRenderingSettings()
        {
            return tmpComponent.havePropertiesChanged
                   //changing the properties below doesn't seem to trigger 'havePropertiesChanged', so we're checking them manually
                   || tmpComponent.enableAutoSizing != autoSize
                   || tmpComponent.rectTransform.rect != sourceRect
                   || tmpComponent.color != sourceColor
                   || tmpComponent.firstVisibleCharacter != tmpFirstVisibleCharacter
                   || tmpComponent.maxVisibleCharacters != tmpMaxVisibleCharacters;
        }


        public void CopyMeshFromSource(ref CharacterData[] characters, int charactersCount)
        {
            autoSize = tmpComponent.enableAutoSizing;
            sourceRect = tmpComponent.rectTransform.rect;
            sourceColor = tmpComponent.color;
            tmpFirstVisibleCharacter = tmpComponent.firstVisibleCharacter;
            tmpMaxVisibleCharacters = tmpComponent.maxVisibleCharacters;

            TMP_CharacterInfo currentCharInfo;

            //Updates the characters sources
            for (var i = 0; i < textInfo.characterCount && i < characters.Length; i++)
            {
                currentCharInfo = textInfo.characterInfo[i];

                ref var temp = ref characters[i];
                temp.info.isRendered = currentCharInfo.isVisible;
                temp.info.character = currentCharInfo.character;
                //Updates TMP char info
                //characters[i].current.tmp_CharInfo = textInfo.characterInfo[i];

                //Copies source data from the mesh info only if the character is valid, otherwise its vertices array will be null and tAnim will start throw errors
                if (!currentCharInfo.isVisible)
                    continue;

                var currentMeshInfo = textInfo.meshInfo[currentCharInfo.materialReferenceIndex];
                temp.info.pointSize = currentCharInfo.pointSize;

                //Updates vertices
                // Use Color32 alias (UnityEngine.Color32) to avoid implicit conversion
                var color = currentMeshInfo.colors32[currentCharInfo.vertexIndex];
                for (var j = 0; j < CharacterData.VERTICES_PER_CHAR; j++)
                {
                    temp.source.positions[j] = currentMeshInfo.vertices[currentCharInfo.vertexIndex + j];
                    temp.source.colors[j] = color;
                }
            }
        }

        public int GetRenderedCharactersCountInsidePage(int charactersCount)
        {
            return tmpComponent.overflowMode != TextOverflowModes.Overflow
                ? tmpComponent.firstOverflowCharacterIndex
                : charactersCount;
        }

        public int GetFirstCharacterIndexInsidePage()
        {
            if (tmpComponent.pageToDisplay <= 1)
                return 0;

            return tmpComponent.textInfo.pageInfo[tmpComponent.pageToDisplay - 1].firstCharacterIndex;
        }

        public void PasteMeshToSource(CharacterData[] characters, int charactersCount)
        {
            //Updates the mesh
            for (var i = 0; i < textInfo.characterCount && i < charactersCount; i++)
            {
                var currentCharInfo = textInfo.characterInfo[i];
                //Avoids updating if we're on an invisible character, like a spacebar
                //Do not switch this with "i<visibleCharacters", since the plugin has to update not yet visible characters
                if (!currentCharInfo.isVisible) continue;

                //Updates TMP char info
                //textInfo.characterInfo[i] = characters[i].data.tmp_CharInfo;

                var animChar = characters[i];

                // OPTIMIZATION: Cache mesh reference and vertex index to avoid 8 array accesses
                ref var meshInfo = ref textInfo.meshInfo[currentCharInfo.materialReferenceIndex];

                var vertexIdx = currentCharInfo.vertexIndex;
                for (var j = 0; j < CharacterData.VERTICES_PER_CHAR; j++)
                {
                    // Optimization, prevents implicit casting by assinging directly instead
                    ref var vertex = ref meshInfo.vertices[vertexIdx + j];
                    vertex.x = animChar.current.positions[j].X;
                    vertex.y = animChar.current.positions[j].Y;
                    vertex.z = animChar.current.positions[j].Z;

                    ref var color = ref meshInfo.colors32[vertexIdx + j];
                    color.r = animChar.current.colors[j].R;
                    color.g = animChar.current.colors[j].G;
                    color.b = animChar.current.colors[j].B;
                    color.a = animChar.current.colors[j].A;
                }
            }

            tmpComponent.UpdateVertexData();
        }

        public void ForceMeshUpdate()
        {
            tmpComponent.ForceMeshUpdate(true);
        }
    }
}