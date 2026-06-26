# Builds the Flutter web release bundle and copies web/cv.pdf into build/web/
# so the Download CV button at /cv.pdf works on any host that serves build/web.
# Run from the project root: powershell -File scripts/build-web.ps1

$ErrorActionPreference = 'Stop'

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
Set-Location $projectRoot

Write-Host ''
Write-Host '== Step 1/2: flutter build web --release ==' -ForegroundColor Cyan
flutter build web --release
if ($LASTEXITCODE -ne 0) {
    Write-Host 'FAILED: flutter build web exited with code ' $LASTEXITCODE -ForegroundColor Red
    exit $LASTEXITCODE
}
Write-Host 'OK: build/web produced' -ForegroundColor Green

Write-Host ''
Write-Host '== Step 2/2: copy web/cv.pdf -> build/web/cv.pdf ==' -ForegroundColor Cyan
$src = Join-Path $projectRoot 'web\cv.pdf'
$dst = Join-Path $projectRoot 'build\web\cv.pdf'
if (-not (Test-Path $src)) {
    Write-Host "FAILED: source not found at $src" -ForegroundColor Red
    Write-Host '       Drop your CV at web/cv.pdf and re-run.' -ForegroundColor Red
    exit 1
}
Copy-Item -Path $src -Destination $dst -Force
$bytes = (Get-Item $dst).Length
Write-Host "OK: copied cv.pdf ($bytes bytes)" -ForegroundColor Green

Write-Host ''
Write-Host 'Build ready. Deploy with: firebase deploy --only hosting' -ForegroundColor Green
