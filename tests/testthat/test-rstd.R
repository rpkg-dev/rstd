test_that("All RStudio release versions are parsable", {
  skip_if_offline(host = "download1.rstudio.org")
  expect_false(releases(use_cache = FALSE)[["version"]] %>% purrr::some(is.na))
})

test_that("`bundled_cli_path()` basically works", {

  all_bundled_tools |>
    purrr::walk(\(tool) {
      expect_vector(object = rstd::bundled_cli_path(tool = tool),
                    size = 1L,
                    ptype = fs::path())
    })
})

test_that("`bundled_cli_vrsn()` basically works", {

  all_bundled_tools |>
    purrr::walk(\(tool) {
      expect_vector(object = rstd::bundled_cli_vrsn(tool = tool),
                    size = 1L,
                    ptype = numeric_version(NULL))
    })
})
