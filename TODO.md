# TODO

* [ ] add email
  * [ ] in readme

* [ ] add readme with credits to itch?

* [ ] make repository public
  * protect master branch
  * [ ] add license to repository

## Blockers

* [ ] devlog
  * on lowrezjam community
* [ ] release announcement
  * Itch
  * Telegram
  * Godot Discord
  * Reddit

## Devlog

This is our first game jam. We used Godot Game Engine (version 4.1.1) for this project.
For our game, we decided to take the theme "Invasion". Our initial idea was to make a classical tower defense game. In the end, we made a game where one places orbs to delay a mysterious void.

We had ideas for all different kinds of orbs. The issue was: How can we communicate this to the player?
With the low resolution, making descriptions would 

We also implemented several difficulties for this game to give it some replay value.
and even a random mode TODO

In the end, Lowrezjam was a great motivation to try something new and we learned a lot about Godot, lights and gradients.



###

I'm proud to announce our game Voidvasion which we made for Lowrezjam 2023.
The game jam restricted the game to have a resolution of 64x64 or lower.
This had some significant impacts on the game process. We initially planned to make a classical tower defense game where you place different towers and prevent something from invading. However, at this resolution, the map in the game would either have to be very small or the towers would need to occupy only a few pixels resulting in difficulties when doing graphics for them.
So we came up with a different idea: Placing luminous objects to slow down darkness. I tried to create candles for this resolution but this didn't work out well. So I took even simpler objects which are just white squares emitting light. These are now the orbs that you place in the game.
Next, we needed variations of orbs. We had many ideas. Orbs of different size, orbs that are stronger, and so on. We also planned to add an orb to the cursor of the mouse so that the player can delay darkness just by moving the cursor. But how could we communicate all those features to the player? With the small resolution, it is not trivial to add ingame descriptions. For our game, we chose a pixel font with a height of 5. With some patting around the text, this meant that the timer alone would occupy the top 7 rows of pixels on our screen.
Adding descriptions would mean that we could only use a fraction of the map. Thus, adding ingame descriptions wasn't really an option. Therefore, we discarded those ideas. Of course, this meant that we had less strategic depth for our game in favor of a simpler game you get much easier into. This was the right decision and works well with how short the game length is.

This game jam was definitely a great motivation to try something new and we learned a lot about Godot, light, gradient in the process.


If you played my other game, you will see that this game is completely different.

I also decided to make this game Open Source. You can find the source code here LINK.

I'm looking forward to hearing your feedback.


It was definitely a great experience

## Release announcement

TODO

## Optional

* improve ui theme
  * issues with spacing above and below
    * label
    * button

* improve export script by allowing export for windows, linux and web
  * fix it

* use svg file instead of png for icon

* [ ] random maps

* [ ] mobile support?

### Accessibility

* when orb can be placed
  * highlight/pulsate number for orb

* drag mouse to place orb when possible
  * this had issues and allowed placing orbs too close

### Improvements

* differentiate core from other orbs
  * different sound/animation when core breaks
    * bright light

* define orange color for buttons and message and heading... once

* glitch effects

### Sound effects

* find better ui sounds
  * darker

### UI

* pause game

* find better font
  * e.g. 5 height
  * monospace

## Tasks for Paul `:-)`

* [ ] place approaching tiles automatically
* [ ] improve tilemap system

## Testing

* [ ] how long can one survive
  * 3:00 is possible
    * place orbs close to darkness
    * orbs should break often so that we can place many orbs

* [ ] messages should be adapted
  * depends on expected time when doing nothing
  * depends on difficulties

* without pushing already approaching tiles
  * 1:53
  * 1:38
  * 1:30
  * 1:22, 1:18

## Issues

* [ ] sometimes neighbors of tiles are not found
  * wait until all tiles are set
  * then, connect signals to neighbors
  * then, emit `arrived`

* [ ] is clicking wildly to place orbs a good idea?

## Itch

* (optional) trailer
  * just record game
* [ ] gifs of game
  * show how placing orbs looks like
  * show how darkness spreads
  * show pulsating core
* [ ] mention repository

## Later

* [ ] delete unused files
  * assets
  * scripts
