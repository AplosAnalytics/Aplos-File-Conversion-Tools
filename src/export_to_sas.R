# a usefull little tool to export .csv files to SAS
library(haven)

main <- function() {
  print("Hello R World - Let's export some csv files to SAS!")

  current_dir <- getwd()
  cat("current directory: ", current_dir, "\n")

  if (endsWith(current_dir, "src")) {
    current_dir <- dirname(current_dir)
  }

  files_dir <- file.path(current_dir, "files")

  # Normalize the path to make it absolute
  files_dir <- normalizePath(files_dir, winslash = "/", mustWork = TRUE)
  cat("files directory noralized: ", files_dir, "\n")

  output_dir <- file.path(files_dir, ".output")
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  # Loop through the files input1.csv to input6.csv
  for (i in 1:6) {
    # Construct input and output file paths
    input_file <- file.path(files_dir, paste0("input", i, ".csv"))  
    sas7bdat_file <- file.path(output_dir, paste0("input", i, ".sas7bdat"))
    xpt_file <- file.path(output_dir, paste0("input", i, ".xpt"))

    # Check if the input file exists
    if (!file.exists(input_file)) {
      cat("Skipping missing file:", input_file, "\n")
      next
    }

    # Read the CSV file
    df <- read.csv(input_file)

    # Write to .sas7bdat, overwriting if the file exists
    write_sas(df, sas7bdat_file)

    # Write to .xpt_file, overwriting if the file exists
    write_xpt(df, xpt_file)

    # Print confirmation
    cat("Converted:", input_file)
    cat("\n\t", "-->", sas7bdat_file, "\n\t -->", xpt_file, "\n")
  }

  cat("Processing complete.\n")
}

main()