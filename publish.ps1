Clear-Host

#region Powershell config

$ErrorActionPreference = "Stop"
# Checking to see if dependencies are installed
if(-Not(Get-Module -Name PSWriteColor))
{
    Install-Module PSWriteColor -Scope CurrentUser
}

#endregion

Push-Location $PSScriptRoot

# Empty out the \obj folder, will guarantee a new build will be published each time
Remove-Item .\SteamPrefill\obj -Recurse -Force -ErrorAction SilentlyContinue
Get-ChildItem publish -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

# Running dotnet build for each runtime, otherwise the publish step will fail when ran in parallel

Write-Host ""
Write-Host "Building " -NoNewline; Write-Host $runtime -ForegroundColor Cyan

$publishDir = "publish/complexityDemoPlayer"

dotnet publish '.\compLexity Demo Player\compLexity Demo Player.csproj' `
    --nologo `
    -o $publishDir `
    -c Release `
    --runtime win-x64 `
    --self-contained true `
    /p:PublishSingleFile=true

Get-ChildItem .\assets | Copy-item -Destination $publishDir -Recurse
Copy-Item .\assets -Destination $publishDir -Recurse
        
    # Making sure that the compliation is successful before mmoving on to the next runtime
    if($LASTEXITCODE -ne 0)
    {
        Write-Host "\nBuild failed.  Skipping publish step until errors are resolved.." -ForegroundColor Red
        return
    }

    Compress-Archive -path $publishDir "$publishDir.zip" -CompressionLevel Optimal

Pop-Location