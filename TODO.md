# TODO

* [ ] add super nova animation for core when breaking

* [ ] add license to repository

* [ ] improve ui theme
  * [ ] issues with spacing above and below
    * label
    * button
  * [ ] issue when centering text with odd number of pixels in width

## Blockers

* [ ] cover image
  * [ ] for itch
  * [ ] for video
* [ ] weird font issue
* [ ] game name
  * check if it already exists
  * change repository name
  * change name on itch

## Devlog

I'm proud to announce a game I made for Lowrezjam 2023.
This game jam was definitely a great motivation to try something new. 

If you played my other game, you will see that this game is completely different.

I also decided to make this game Open Source. You can find the source code here LINK.

I'm looking forward to hearing your feedback.


It was definitely a great experience

## Release announcement

## Optional

* improve export script by allowing export for windows, linux and web
  * fix it

* use svg file instead of png for icon

* [ ] random maps

### Accessibility

* [ ] when orb can be placed
  * highlight/pulsate number for orb

* drag mouse to place orb when possible
  * this had issues and allowed placing orbs too close

### Improvements

* [ ] different sound/animation when core breaks

* [ ] define orange color for buttons and message and heading... once

* [ ] improve end game screen
  * copy button is ugly

* (optional) glitch effects

### Sound effects

* find better ui sounds
  * darker

### UI

* (optional) pause game

* [ ] find better font
  * e.g. 5 height
  * monospace

## Tasks for Paul `:-)`

* [ ] mobile support?
* [ ] place approaching tiles automatically
* [ ] improve tilemap system
* [ ] help fixing font issues

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

* with push already approaching tiles
  * 1:11
  * 1:02
  * 1:04
  * 1:03

## To discuss

* [ ] name for game
* [ ] readme
* [ ] difficulties
* [ ] make game available on GitHub?
  * protect master branch
* [ ] itch
  * [ ] tags
  * [ ] accessibility `one button`?

## Issues

* [ ] sometimes neighbors of tiles are not found
  * wait until all tiles are set
  * then, connect signals to neighbors
  * then, emit `arrived`

* [ ] is clicking wildly to place orbs a good idea?

## Game name

* orb
* luminous
* luminary
* lumen
* lux
* radiant

* eclipse
* excidium
* darkness
* gloom
* ~~shade~~
* ~~shadow~~
* ~~nocturne~~

* invasion

* luminorb


* Luminous Resilience
* lumisilience
* Resiluminous

## Itch

* [ ] game page
  * [ ] description
    * [ ] add from readme
    * [ ] rules
    * [ ] goal
  * [ ] `Feel free to post your result in the comments section.`
* [ ] short description
  * Short tower defense game where you place orbs to slow down darkness.
* [ ] screenshots (very late)
  * before start
  * mid game
  * late game
  * end game screen
* [ ] trailer
  * just record game
* [ ] gifs of game
  * show how placing orbs looks like
  * show how darkness spreads
* [ ] mention repository

## Later

* [ ] delete unused files
  * assets
  * scripts

## Implementation

### Tilemap

* [ ] place darkness tiles by hand
  * for each difficulty map
* [ ] place approaching tiles automatically

## Difficulty

* [x] more initial black tiles
* [x] different background color
* [x] more cores
* [ ] already placed orbs at bad positions
  * close to center
* [ ] random difficulty
