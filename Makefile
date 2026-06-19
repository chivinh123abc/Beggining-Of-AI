# Makefile — LaTeX Project Build & Cleanup
# Usage: make build-ai70 | make build-ai30 | make build-all | make clean

SHELL := powershell.exe
.SHELLFLAGS := -NoProfile -Command

# =========================================================================
# Build targets
# =========================================================================

.PHONY: build-ai70 build-ai70_2 build-ai30 build-all clean help

build-ai70: ## Compile AI70 (Drone Attack essay)
	@Write-Host "=== Building AI70 ===" -ForegroundColor Cyan; Set-Location AI70; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; bibtex main 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; Write-Host "[OK] AI70/main.pdf" -ForegroundColor Green

build-ai70_2: ## Compile AI70_2 (Drone Attack essay - Exam version)
	@Write-Host "=== Building AI70_2 ===" -ForegroundColor Cyan; Set-Location AI70_2; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; bibtex main 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; Write-Host "[OK] AI70_2/main.pdf" -ForegroundColor Green

build-ai30: ## Compile AI30 (5-chapter AI exam)
	@Write-Host "=== Building AI30 ===" -ForegroundColor Cyan; Set-Location AI30; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; bibtex main 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; pdflatex -interaction=nonstopmode main.tex 2>&1 | Out-Null; Write-Host "[OK] AI30/main.pdf" -ForegroundColor Green

build-all: build-ai70 build-ai70_2 build-ai30 ## Compile all parts

# =========================================================================
# Cleanup
# =========================================================================

clean: ## Remove all LaTeX build artifacts
	@powershell -ExecutionPolicy Bypass -File clean.ps1

# =========================================================================
# Help
# =========================================================================

help: ## Show available commands
	@Write-Host ""; Write-Host "Available commands:" -ForegroundColor Cyan; Write-Host "  make build-ai70   - Compile AI70 (Drone Attack essay)"; Write-Host "  make build-ai70_2 - Compile AI70_2 (Drone Attack essay - Exam version)"; Write-Host "  make build-ai30   - Compile AI30 (5-chapter AI exam)"; Write-Host "  make build-all    - Compile all parts"; Write-Host "  make clean        - Remove all LaTeX build artifacts"; Write-Host ""
