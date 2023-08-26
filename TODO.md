# TODO

## Bugs

* [ ] when orb breaks in fast forward mode, sound effect is cut off

* [ ] bug: canvas modulate is too bright when `restart`
  * when map is loaded and map is active, canvas modulate is too bright

* [ ] bug: move mouse fast to place orbs where you shouldn't be allowed to place them.
  * when orb comes into play
    * if it is too close to other orbs or void
      * queue_free
    * if not, show it and connect signals
  * orbs might break immediately

## Optional

* use svg file instead of png for icon

### Features

* [ ] achievements?
  * survive 2 min
  * use only 10 orbs
  * 10 orbs but lose in first 30 seconds

* [ ] different colors for light

* [ ] multiplayer?
  * over server?
  * local
    * 2 mice?

* score board
  * grid container
  * needs too much space
  * display
    * map name
    * time
    * orbs

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

* [ ] hide cursor when out of tilemap
  * light can be seen

* [ ] redesign "normal"
  * there should never be tiles outside of the screen

* [ ] use scene for button connect script?
  * [ ] overwrite virtual method `_enter_tree` to connect `child_entered`
    * we still need to set up audio stream players in ready, `update_buttons` is called too early

* differentiate core from other orbs
  * different sound/animation when core breaks
    * bright light
  * [ ] make it easier to distinguish core from other orbs
    * this is difficult if background is colorful
    * gray square that occludes light? What with canvas modulate?

* define orange color for buttons and message and heading... once

#### User interface

* improve ui theme
  * issues with spacing above and below
    * label
    * button

#### Theme

* [ ] what is the void?
* [ ] make it thematically clearer why we want to hold out for as long as possible

#### Performance

* [ ] waiting and arriving tiles could just be sprites
  * only approaching tiles are scenes

### Sound effects

* find better ui sounds
  * darker

### UI

* find better font
  * e.g. 5 height
  * monospace
