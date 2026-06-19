# Makefile — LaTeX Project Build & Cleanup
# Usage: make build-phan1 | make build-phan2 | make build-all | make clean

SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command

# =========================================================================
# Build targets
# =========================================================================

.PHONY: build-phan1 build-phan2 build-all clean help

build-phan1: ## Compile phan1 (Drone Attack essay)
	@Write-Host "=== Building phan1 ===" -ForegroundColor Cyan
	@Set-Location phan1; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	bibtex main 2>&1 | Out-Null; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	Write-Host "[OK] phan1/main.pdf" -ForegroundColor Green

build-phan2: ## Compile phan2 (5-chapter AI exam)
	@Write-Host "=== Building phan2 ===" -ForegroundColor Cyan
	@Set-Location phan2; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	bibtex main 2>&1 | Out-Null; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; \
	Write-Host "[OK] phan2/main.pdf" -ForegroundColor Green

build-all: build-phan1 build-phan2 ## Compile both parts

# =========================================================================
# Cleanup
# =========================================================================

clean: ## Remove all LaTeX build artifacts
	@powershell -ExecutionPolicy Bypass -File clean.ps1

# =========================================================================
# Help
# =========================================================================

help: ## Show available commands
	@Write-Host "`nAvailable commands:" -ForegroundColor Cyan
	@Write-Host "  make build-phan1  - Compile phan1 (Drone Attack essay)"
	@Write-Host "  make build-phan2  - Compile phan2 (5-chapter AI exam)"
	@Write-Host "  make build-all    - Compile both parts"
	@Write-Host "  make clean        - Remove all LaTeX build artifacts"
	@Write-Host ""
