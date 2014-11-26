# test that case is ignored
test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

# test of incomplete input, inputs without specified date
test_that("should fail", {
	expect_false(gday("seattle"))
})

# test of a valid input, expect_true
test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

# test that expect_false
test_that("Test using expect_false, plus I wish this is a team Thomas", {
	expect_false(gday(team = "canucks",   date = "2014-11-03"))
	expect_false(gday(team = "thomas", date = "2014-11-02"))
})

# test for check_date helper function
test_that("Testing check_date function ", {
	expect_true(check_date(date = "2014-11-02"))
	expect_false(check_date(date = "2014-nov-02"))
	expect_false(check_date(date = "this is not a date"))
})

# test check_date for error
# Checking check_date for error
test_that("Test with invalid date input", {
	expect_error(gday(team = "canucks",   date = "14-nov-14"))
	expect_error(gday(team = "canucks",   date = "2014-111-2"))
})

