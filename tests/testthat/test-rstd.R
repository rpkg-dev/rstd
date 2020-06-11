test_that("All RStudio release versions are parsable", {
  skip_if_offline(host = "download1.rstudio.org")
  expect_false(releases()[["version"]] %>% purrr::some(is.na))
})
