# TODO

## Changes

* hold mouse button to keep trying to place orbs
* fast forward button
  * click or press `SPACE`
* pause menu
  * click or press `P`, `X`, `ESC`
* main menu button in game end menu
* cursor light
  * color
  * weak light when collision
* start button clickable area

##

* rename difficulties ingame to `game modes` or `modes`

* [ ] hide cursor when out of tilemap
  * light can be seen

* [ ] bug: canvas modulate is too bright when `restart`
  * when map is loaded and map is active, canvas modulate is too bright

* [ ] redesign "normal"
  * there should never be tiles outside of the screen
  * plain rectangle doesn't change much since this could also just be the border of the map

* [ ] use scene for button connect script?
  * [ ] overwrite virtual method `_enter_tree` to connect `child_entered`
    * we still need to set up audio stream players in ready, `update_buttons` is called too early

* [ ] bug: move mouse fast to place orbs where you shouldn't be allowed to place them.
  * when orb comes into play
    * if it is too close to other orbs or void
      * queue_free
    * if not, show it and connect signals
  * orbs might break immediately

* [ ] make it easier to distinguish core from other orbs
  * this is difficult if background is colorful
  * gray square that occludes light? What with canvas modulate?

* [ ] make repository public
  * protect master branch
  * [ ] add license to repository
  * later
  * if project is successful enough, make devlog about this

## Theme

* [ ] what is the void?
* [ ] make it thematically clearer why we want to hold out for as long as possible

## Performance

* [ ] waiting and arriving tiles could just be sprites
  * only approaching tiles are scenes

## Feature ideas

* [ ] achievements?
  * survive 2 min
  * use only 10 orbs
  * 10 orbs but lose in first 30 seconds

* [ ] different colors for light

* [ ] multiplayer?
  * over server?
  * local
    * 2 mice?

## Ideas for other game

* [ ] different theme
* [ ] upgrades for orbs
* game progress
  1. place/upgrade orbs
  2. watch void progressing for some time
  3. repeat

## Blockers

## Optional

* use svg file instead of png for icon

### Features

* [ ] score board
  * grid container

* [ ] random maps

* glitch effects

* [ ] mobile support?

* highlight positions where orbs can be placed
  * [ ] performance issues?
  * [ ] might break aesthetics
  * hold key for this?
  * togglable
  * gray out orb color when no placement is possible
  * idea
    * place something like cursor everywhere
    * check distance to all orbs
      * update visibility
    * queue_free when void_detector detects void

### Accessibility

* when orb can be placed
  * highlight/pulsate number for orb

### Improvements

* differentiate core from other orbs
  * different sound/animation when core breaks
    * bright light

* define orange color for buttons and message and heading... once

* improve ui theme
  * issues with spacing above and below
    * label
    * button

### Sound effects

* find better ui sounds
  * darker

### UI

* find better font
  * e.g. 5 height
  * monospace

## Testing

* [ ] how long can one survive
  * 3:00 is possible
    * place orbs close to void
    * orbs should break often so that we can place many orbs

* [ ] messages should be adapted
  * depends on expected time when doing nothing
  * depends on difficulties

* without pushing already approaching tiles
  * 1:53
  * 1:38
  * 1:30
  * 1:22, 1:18
