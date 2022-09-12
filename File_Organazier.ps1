#Detect the current path location & create a global varible
#$path = Get-Location

#Prameters
#=========
param([string]$sourceFiles = "c:\temp\") 

#Functions
#=========
function Greate_Folders_Fun($global:path) {
    #Generate PDF folder
    New-Item -Path "$path\PDFs" -ItemType Directory -Force

    #Generate TXT folder
    New-Item -Path "$path\TXTs" -ItemType Directory -Force

    #Generate CSV folder
    New-Item -Path "$path\CSVs" -ItemType Directory -Force

    #Generate Images folder
    New-Item -Path "$path\Images" -ItemType Directory -Force

    #Generate PS Scripts folder
    New-Item -Path "$path\PS-Scripts" -ItemType Directory -Force

    #Generate Others folder
    New-Item -Path "$path\Others" -ItemType Directory -Force
}

function File_Mover_Func ($path) {
    Move-Item -Path $path\*.txt -Destination "$path\TXTs" -Force
    Move-Item -Path $path\*.pdf -Destination "$path\PDFs" -Force
    Move-Item -Path $path\*.JPG -Destination "$path\Images" -Force
    Move-Item -Path $path\*.ps1 -Destination "$path\PS-Scripts" -Force
    Start-Sleep -Seconds 3
    Move-Item -path "$path\*.csv" -Destination "$path\CSVs" -force
    Move-Item -path "$path\*.xls" -Destination "$path\CSVs" -force
    Move-Item -path "$path\*.xlsx" -Destination "$path\CSVs" -force
}

function Remove_Empty_Folder_Func {
    <# Action to perform if the condition is true #>
}

#Processing
Greate_Folders_Fun($path) 
File_Mover_Func "c:\temp"
