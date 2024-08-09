# Define the directory to search in
$directory = "."

# Define the file patterns to search for
$filePatterns = @("*.pkg")

# Define the string to find and replacement string
$findString = "4PPC50_156B_10B"
$replaceString = "PLC"

# Loop through each file pattern
foreach ($pattern in $filePatterns) {
    # Get all files matching the current pattern
    $files = Get-ChildItem -Path $directory -Recurse -Filter $pattern

    foreach ($file in $files) {
        # Read the file content
        $content = Get-Content -Path $file.FullName

        # Replace the string
        $updatedContent = $content -replace $findString, $replaceString

        # Check if replacement was made
        if ($updatedContent -ne $content) {
            # Write the updated content back to the file
            Set-Content -Path $file.FullName -Value $updatedContent
            # Print the file name
            Write-Output "Replaced in file: $($file.FullName)"
        }
    }
}

Write-Output "Replacement complete."