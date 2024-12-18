# Aplos-File-Conversion-Tools
This project contains code for converting files from one format to another.  

**Currently supports converting from .csv to .sas7bdat and .xpt**
    
    - SAS dataset conversions to .csv files uses the R programing langauage

Our system (Aplos NCA) supports several file formats
including SAS7BDAT and XPT, so it's nice to be able to create test files from .csv files.

## Requirements
Install R from [CRAN R-Project](https://cran.r-project.org/)

Open an R prompt and install the following packages
```R
install.packages("haven")
```

## VS Code (Optional)

SAS Data Viewer: This is a nice visual tool for vscode to view SAS files
[VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=yejianfeng186.sas7bdat-viewer)

Install the R Editor Support
[VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r)

### Set the R Path:

Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P on Mac) and search for Preferences: Open Settings (JSON).
Add the following configuration:
```json

"r.rterm.windows": "C:\\Program Files\\R\\R-x.x.x\\bin\\R.exe",
"r.rterm.mac": "/usr/local/bin/R",
"r.rterm.linux": "/usr/bin/R",
"r.bracketedPaste": true
```

Replace the path to R with the actual installation path for your system.


### Install R LSP Client (Optional):

The R extension supports the Language Server Protocol (LSP). To enable it, install the languageserver package in R:
```R
install.packages("languageserver")
```

## Notes & Warnings

I did get some warnings that the function `write_sas()` was depreciated and to use the `write_xpt()` instead, however I we need the `SAS7BDAT` files for testing as well.  

It's possible this will break in the future if they stop supporting `write_sas()`.

```sh
Warning message:
`write_sas()` was deprecated in haven 2.5.2.
ℹ Please use `write_xpt()` instead. 
```

## Running the code
You can run the code directly from command line or with the VSCode debugger.

### Command Line: 

From the project root
```sh
Rscript ./src/export_to_sas.R  
```
or navigate to the src directory
```sh
cd ./src
Rscript ./export_to_sas.R  
```

### VS Code Debugger

- Select the debugging icon on the left menu
- Click the play button next to "Debug R-Export to SAS"

## Output Location
This code is configured to output the files in the `./files/.output` directory.  The output directory is prefixed with a . (dot) `.output` so it may be hidden on some machines.

The repo includes the original output files in a sample-output directory. 