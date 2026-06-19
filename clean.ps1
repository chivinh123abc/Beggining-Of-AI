### clean.ps1 — Dọn rác LaTeX build artifacts
### Chạy: powershell -ExecutionPolicy Bypass -File clean.ps1

$root = $PSScriptRoot
if (-not $root) { $root = Get-Location }

Write-Host "=== LaTeX Cleanup: $root ===" -ForegroundColor Cyan

$auxExts = @(
    "*.aux", "*.log", "*.out", "*.toc", "*.lof", "*.lot",
    "*.bbl", "*.blg", "*.bcf", "*.run.xml",
    "*.fls", "*.fdb_latexmk",
    "*.synctex.gz", "*.synctex(busy)",
    "*.nav", "*.snm", "*.vrb"
)

$deleted = 0
foreach ($ext in $auxExts) {
    Get-ChildItem -Path $root -Filter $ext -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
        Remove-Item $_.FullName -Force
        Write-Host "  [-] $($_.FullName -replace [regex]::Escape($root), '.')"
        $deleted++
    }
}

if ($deleted -eq 0) {
    Write-Host "`nKhong co rac. Thu muc da sach!" -ForegroundColor Green
} else {
    Write-Host "`nDa xoa $deleted file rac." -ForegroundColor Green
}
