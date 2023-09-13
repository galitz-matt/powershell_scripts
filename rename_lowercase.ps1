
#folderPath : relative path of working directory
$files = Get-ChildItem $folderPath
foreach ($file in $files) {
    $currentName = $file.Name
    $newName = $currentName.ToLower()
    $tempName = "_temp_" + $curretName
    $tempPath = Join-Path -Path $folderPath -ChildPath $tempName
    Rename-Item -Path $file.FullName -NewName $tempName
    Rename-Item -Path $tempPath -NewName $newName
}