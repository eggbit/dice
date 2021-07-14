module dice

import rand

fn test_roll() {
	rand.seed( [ u32(4), u32(2)])

	assert dice("3d6+10") == 23 // Roll 3 d 6 dice and then add ten
	assert dice("3d6/2") == 6 // Roll 3 d 6 dice and then divide by two rounding down
}
