# TODO

## Game setting

* protect orb
  * holy gem in center of map
  * or candle?
  * orb
* darkness invades world
* deploy protective _things_ to delay darkness
  * [ ] specify _things_
    * small gems?
    * small candles?
    * ghosts?
* how long can you delay the darkness?
* [ ] can you win?

## Implementation

* tilemap for ground and darkness
* objects need to detect what's below them
  * collisions for darkness tilemap
* remember border tiles for creation of new tiles
  * set tile `set_cells_terrain_connect`
  * use 4 `custom_data_layers` to tell which adjacent tiles are allowed for new darkness tiles
    * `north`, `east`, `south`, `west`

* [ ] orb scene
  * inherit
  * script
    * `_on_darkness_entered`
      * `queue_free`
      * tween
  * export vars for
    * [x] color
      * orb and light
      * single modulate for sprite color and light color
    * [ ] size
      * orb and light
    * [ ] strength
      * stronger on closer tiles
      * more range
      * pulsing strength
* orb types
  * `core`
  * `small_orb`

* [ ] single pixel tiles
  * 2 types
    * `approaching`
      * modulate changes
        * alpha from 0 to 1
      * changes to `finished`
      * (optional) animation when finished
    * `arrived`
      * collision shape
      * neighbors can approach

## Later

* [ ] set occlusion shapes for tilemaps appropriately
* [ ] delete images for orbs
  * use gradient2d instead

## UI

* [ ] find nice font
  * e.g. 5 height
  * monospace

## Difficulty

* weaker orbs
* already approaching tiles on map
* size of map
* increase of approaching tiles

## Graphics

* gem
* darkness
  * animated
  * 4 frames
  * only darkness (no ground)
* background
  * with light possible
* glitch effects?
* protective _things_
* light effects
* ground/floor with variation
* darkness with variation

## Sound

* [ ] dark ambient background sound
* [ ] intensifying darkness sound

### Effects

* [ ] placing orb
* [ ] destroying orb
  * glass shatter
* [ ] pulsating orb

## Themes

* Invasion
* Catch ‘Em All
* Opposite Day
* Cooperation
  * tower defense
* Glitch In The Matrix
* Wildfire
* Recursive
* Creation Story
* But Does It Float?
  * platformer
  * stone
    * weak against water
    * is thrown away when hit by other monsters
  * goal
    1. reach end of level
      * gain float ability 
    2. run back
      * timer?
* Hidden In Plain Sight
