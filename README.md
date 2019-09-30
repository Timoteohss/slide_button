# Sliding Button
A sliding Flutter widget, based on the *slide to unlock* function from multiple devices.
Heavily customizable and flexible.

![pls don't be a giant-ass gif](https://raw.githubusercontent.com/Timoteohss/slide_button/master/screenshots/untitled.gif)

## Installing 
Add the following to your `pubspec.yaml`:

```yaml
dependencies:
slide_button: ^0.2.5
```

## Usage
1. Install
2. Use the SlideButton widget anywhere
3. ???
4. Profit

## Properties

Several properties are present and can be customized:

```markdown
| Properties              	| Description                                                                                                                                                            	|
|-------------------------	|------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| height                  	| Height of the Widget, leave blank to get the parent constraints.                                                                                                       	|
| backgroundChild         	| A child to be put on the background bar, NOT centered by default.                                                                                                      	|
| slidingChild            	| A child tobe put on the sliding bar, NOT centered by default.                                                                                                          	|
| backgroundColor         	| The color of the background bar.                                                                                                                                       	|
| slidingBarColor         	| The color of the sliding bar.                                                                                                                                          	|
| confirmPercentage       	| How much of the bar width have to be slided to confirm the action.                                                                                                     	|
| initialSliderPercentage 	| The initial (and resting) percentage of the sliding bar.                                                                                                               	|
| isDraggable             	| Is this widget draggable?                                                                                                                                              	|
| onButtonSlide           	| Callback that returns a `Double` value containing the drag percentage.                                                                                                 	|
| onButtonOpened          	| Callback called when the button is slided all the way.                                                                                                                 	|
| onButtonClosed          	| Callback called when the button is back to the initialSliderPercentage.                                                                                                	|
| slideDirection          	| Either SlideDirection.RIGHT or SlideDirection.LEFT, sets the sliding direction of the sliding bar.                                                                     	|
| shouldCloseBorders      	| This updates the borders when the button reaches 0.9 percent dragged, and set the borderRadius to zero, giving the impression of a "closed" button. Defaults to `true` 	|
``` 

## TODO
- [x] Create the repo
- [x] Make it work
- [ ] Fix text on the sliding bar
- [ ] Find a better activation function capable of activating between x and y percentages
- [ ] More listeners?
- [ ] Parallax effect?
- [ ] Make it pop 

# Inspiration
This widget was partially made possible by inspecting elements from [sliding_up_panel](https://github.com/akshathjain/sliding_up_panel).


