# Dialogue Box

## Components

The main component that coordinates all the visual work is `DialogueBox`. It is agnostic of the Ink part of the story,
and just offers methods to handle all the different visual aspects of the dialogue box (show/hide the box itself, add
text, images, scrolling, ecc...)

`DialogueBoxInkBindings` takes care of receiving information from Ink and tell the dialogue box what to do, acting in
fact as a bridge between the Ink logic and the DialogueBox visualization logic.

## Animations

### Show/hide dialogue box and its components

All the animations of the dialogue box appearance/disappearance, and its sub-elements appearance/disappearance (
portrait, ink, sigil) are managed via animations and an animator situated in the root element (DialogueCanvas).

The main animation for the dialogue box are ShowDialogueBox + HideDialogueBox. They slide the dialogue box panel in and
out, and at the end of the animation ask the DialogueBox component to set an animator property (ShowAnimationCompleted)
properly using an Animation Event.

The animator coordinates these animations in a layer (Sliding Layer) using the Visible and VisibleSpeed animator
parameters, which are set by the DialogueBox component.

Each subcomponent (ink, portrait, sigil) has two animations (Show/Hide), and the animator handles them on a specific
layer (Ink Visible Layer, Portrait Visible Layer, Word Visible Layer).

The animator coordination is similar to the one of the Sliding Layer, but also requires the ShowAnimationCompleted
animator property to be performed. This way the subcomponents are shown after the dialogue box has appeared in the
scene.

There's also another set of animations (CrossFadeToPortrait1, CrossFadeToPortrait2) and an animator layer (Portrait
Fades Layer) to handle the fade-in/fade-out between portraits.