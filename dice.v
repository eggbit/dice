module dice

import rand

fn sum(a int, b int) int {
	return a + b
}

fn split_op(s string, op string) int {
	a := s.split(op)

	return if a.len < 2 { 0 } else { a[1].int() }
}

// Takes some form of dice notation like "2d20" or "3d6-10" and returns the result.
// Returns 0 on an invalid dice string
pub fn roll(s string) int {
	if !s.contains("d") {
		return 0
	}

	num_to_add    := split_op(s, "+")
	num_to_sub    := split_op(s, "-")
	num_to_mul    := if split_op(s, "*") == 0 { 1 } else { split_op(s, "*") }
	num_to_drop_l := split_op(s, "L")
	num_to_drop_h := split_op(s, "H")

	a := s.split("d")

	die   := a[0].int()
	face  := a[1].int()

	if num_to_drop_h >= die || num_to_drop_l >= die {
		return 0
	}
	
	mut roll := []int{}

	for _ in 0 .. die {
		roll << rand.int_in_range(1, face + 1)
	}

	roll.sort()

	if num_to_drop_l > 0 {
		roll = roll[num_to_drop_l..]
	}
	else if num_to_drop_h > 0 {
		roll = roll[..(roll.len - num_to_drop_h)]
	}

	return roll.reduce(sum, num_to_add) * num_to_mul - num_to_sub
}