#!/usr/bin/env bash
# Build resume.tex into resume.pdf.
# Usage: ./build.sh        (compile once)
#        ./build.sh clean  (remove build artifacts)

set -euo pipefail
cd "$(dirname "$0")"

SRC="resume.tex"
OUT="resume.pdf"

if [[ "${1:-}" == "clean" ]]; then
  rm -f resume.aux resume.log resume.out resume.fls resume.fdb_latexmk
  echo "Cleaned build artifacts."
  exit 0
fi

# Pick whatever LaTeX compiler is available.
if command -v latexmk >/dev/null 2>&1; then
  latexmk -pdf -interaction=nonstopmode -halt-on-error "$SRC"
  latexmk -c "$SRC" >/dev/null 2>&1 || true   # tidy aux files, keep the PDF
elif command -v pdflatex >/dev/null 2>&1; then
  pdflatex -interaction=nonstopmode -halt-on-error "$SRC"
  rm -f resume.aux resume.log resume.out
elif command -v tectonic >/dev/null 2>&1; then
  tectonic "$SRC"
else
  cat <<'EOF'
No LaTeX compiler found. Install one of:

  # Lightweight, no admin needed (recommended):
  brew install tectonic

  # Full LaTeX toolchain (large, ~4 GB):
  brew install --cask mactex
  # or the smaller BasicTeX:
  brew install --cask basictex

Or skip installing anything and use Overleaf (https://overleaf.com):
upload resume.tex and it compiles in the browser.
EOF
  exit 1
fi

echo "Built $OUT"
