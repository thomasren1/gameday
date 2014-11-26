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


# test the return type of scores function
test_that("Test if the scores function returns a data.frame", {
	expect_is(scores(Sys.Date()), "data.frame")
})

# Check failure when date is invalid
test_that("Test when scores function returns error messages", {
	expect_error(scores("201-111-111"))
	expect_error(scores("2001-01-01"))
})

# test scores function when with a few specific team names and scores
test_that("Test the scores function with a few specific team names and scores", {
	expect_match(as.character(scores("2014-10-31")[1,1]), "COLUMBUS BLUE JACKETS")
	expect_equal(scores("2014-10-31")[2,3], 5)
	expect_match(as.character(scores("2014-10-31")[4,2]), "NASHVILLE PREDATORS")
})
