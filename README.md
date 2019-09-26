# Sliding Button
A sliding Flutter widget, based on the *slide to unlock* function from multiple devices.
Heavily costumizable and flexible.

## Installing 
Add the following to your `pubspec.yaml`:
```yaml
dependencies:
  slide_button: ^0.2.2
```
## Usage
1. Install
2. Use the SlideButton widget anywhere
3. Costumize however you want

## Properties

Several properties are present and can be costumized:

```markdown
| Properties | Description |
|-------------------------|----------------------------------------------------------------------------------------------------|
| height | Height of the Widget, leave blank to get the parent constraints. |
| backgroundChild | A child to be put on the background bar, NOT centered by default. |
| slidingChild | A child tobe put on the sliding bar, NOT centered by default. |
| backgroundColor | The color of the background bar. |
| slidingBarColor | The color of the sliding bar. |
| confirmPercentage | How much of the bar width have to be slided to confirm the action. |
| initialSliderPercentage | The initial (and resting) percentage of the sliding bar. |
| isDraggable | Is this widget dragabble? |
| onButtonSlide | Callback that returns a `Double` value containing the drag percentage. |
| onButtonOpened | Callback called when the button is slided all the way. |
| onButtonClosed | Callback called when the button is back to the initialSliderPercentage. |
| slideDirection | Either SlideDirection.RIGHT or SlideDirection.LEFT, sets the sliding direction of the sliding bar. |
```