
$folderPath = Read-Host "Enter relative path of directory"
$files = Get-ChildItem $folderPath
foreach ($file in $files) {
    $workingName = $file.Name
    if ($workingName -like "* *") {
        $nameParts = $workingName -split " "
        $workingName = $nameParts -join "_"
    }
    $newName = $workingName.ToLower()
    $tempName = "_temp_" + $workingName
    $tempPath = Join-Path -Path $folderPath -ChildPath $tempName
    Rename-Item -Path $file.FullName -NewName $tempName
    Rename-Item -Path $tempPath -NewName $newName
}