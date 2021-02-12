# dice
A simple dice rolling library for [V](https://vlang.io) (currently at v0.2.2). Feed a string in [dice notation](https://en.wikipedia.org/wiki/Dice_notation) to the only function this library has - `roll` - and it gives you the result.

## Example

```v
import dice

fn main() {
    result := dice.roll("3d6+10") // Roll three d6 dice, then add 10.
    println(result)
}
```

Yeah, it's really that simple. Some examples of strings the library can handle:

```bash
"2d20" # Roll 2 d20 dice.
"9d6-10" # Roll 9 d6 dice, then subtract 10.
"1d6*2" # Roll a single d6 dice, then multiply by 2.
"5d4L2" # Roll 5 d4 dice, then discard the lowest two rolls.
"3d20H1" # Roll 3 d20 dice, then discard the highest roll.
```

## Errors
To keep things simple, the `roll` function returns `0` whenever an invalid dice string is provided.

## Bugs
Order of operations doesn't work like it should. For example, a dice string like `2d8+2*3` will roll 2 d8, then multiply by 3, then add 2. To get the result you want in this sort of situation, just do the following:

```v
result := dice.roll("2d8+2") * 3
```

## Installation
Via vpm:
```
v install eggbit.dice
```

<!-- Via [vpkg](https://github.com/vpkg-project/vpkg) (either command):
```
vpkg get dice
vpkg get https://github.com/eggbit/dice
``` -->

## Changes in `0.1`
- Nothing! Enjoy this initial release.

## License
Licensed under the 2-clause BSD License.
