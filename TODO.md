# TODO

* [ ] make it easier to distinguish core from other orbs
  * this is difficult if background is colorful
  * gray square that occludes light? What with canvas modulate?

* [ ] make repository public
  * protect master branch
  * [ ] add license to repository
  * later
  * if project is successful enough, make devlog about this

## Blockers

* [x] add readme with credits to itch?
* [x] devlog
  * on lowrezjam community
  * [ ] publish
* [ ] release announcement
  * Itch
  * Telegram
    * Es ist fertig. Man kann es auch direkt im Browser spielen.
  * [ ] Godot Discord
    * `Orb placing survival game I made with Godot 4 for a game jam`
  * Reddit

## Devlog

This is our first game jam. We used Godot Game Engine (version 4.1.1) for this project.
For our game, we decided to use the theme "Invasion". Our initial idea was to make a classical tower defense game. But because of the small resolution, we came up with something different. So we made a game where one places luminous orbs to delay a mysterious void.

We had ideas for all different kinds of orbs. The issue was: How can we communicate this to the player?
With the low resolution, we couldn't easily add descriptions. At least, we thought so. Therefore, we decided to have only one type of orb you can place. This makes the game much easier to come into. You just have to click to add an orb.

In the end, the game turned out to be some high-score game with several difficulties. How long can you stay in the game?

Lowrezjam was a great motivation to try out something new and we learned a lot in the process.



### 

Hi,
I decided to participate in LOWREZJAM TODO link with some help of a friend to try out something entirely different this time.

The game jam restricted us to work with a resolution of 64x64 or lower. This had some significant impacts on the game process. Our initial idea was to make a classical tower defense game. But because of the small resolution, we came up with something different. In the end, we made a game where one places luminous orbs to delay a mysterious void.

### Gameplay

We had ideas for all different kinds of orbs. The issue was: How can we communicate this to the player?
With the low resolution, we couldn't easily add descriptions. Also, we would need some resource system to "buy" orbs, and balancing the game would be more difficult.
In the end, we decided to have only one type of orb you can place. Further, you can have only 15 orbs at the same time. This makes the game much easier to come into. You just have to click to add an orb.
The game turned out to be a high-score game where you try to survive as long as possible. It is already quite a challenge to resist the void for more than 3 minutes. You can also try to place as many orbs as possible.

For further variety, we added several difficulties. Here, we just varied initial positions for core orbs and darkness. There are even difficulties where you have more than 1 core to protect.
The design space for this game turned out to be much larger than I thought. While writing this, I got an idea that I needed to try out and add to the game...

### Visuals

Although I have experience with pixel art (see my other project TODO), I decided to not do any for this project. Instead, I used light effects and gradients directly in Godot and I'm quite satisfied with the result.
I am especially proud with how the orbs turned out. This might now be a bit technical. For orbs, I just used a white square and added a point light. By increasing and decreasing the energy of the light, I could give the orb this pulsating effect. But this was not exciting enough for me. So I tried something out. I added a constant rotation to the orbs. If this game had a high resolution, there wouldn't be any difference. But with how snapping to pixels in Godot works, the orbs received this cool "mechanical" animation I got basically for free. It is so satisfying to look at the orbs now.

### Sound

Another design part was the sound of the game. To enhance the feeling of the approaching void, I added a constant background noise that intensifies over time. I gave the orbs some pulsating sound effect and added a sound for placing orbs. But the most important sound effect is this glass breaking effect that can be heard when an orb breaks. This gives the game such a stressful moment and works very well with the theme. Especially, when several orbs break in a short time frame. I really like how all the sound effects work together and I love the tension you get in this game. Check out the credits section in the readme file TODO to see where I got those sound effect from.

### Conclusion

I'm very proud of how the game turned out and I loved working on it.

LOWREZJAM was definitely a great motivation to try something new and we learned a lot about Godot, especially lights, gradients and tilemaps. I'm looking forward to my next game jam.





## Release announcement

TODO

## Optional

* [ ] score board

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
