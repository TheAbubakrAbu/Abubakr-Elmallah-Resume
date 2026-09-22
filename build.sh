#!/usr/bin/env bash
# Build a resume .tex into its .pdf.
# Usage: ./build.sh          (build resume.tex)
#        ./build.sh ios      (build resume-ios.tex, the iOS / mobile variant)
#        ./build.sh clean    (remove build artifacts)

set -euo pipefail
cd "$(dirname "$0")"

if [[ "${1:-}" == "clean" ]]; then
  rm -f ./*.aux ./*.log ./*.out ./*.fls ./*.fdb_latexmk
  echo "Cleaned build artifacts."
  exit 0
fi

# No argument builds the base resume; otherwise build resume-<name>.tex.
if [[ -z "${1:-}" ]]; then
  SRC="resume.tex"
else
  SRC="resume-${1}.tex"
  if [[ ! -f "$SRC" ]]; then
    echo "No such resume variant: $SRC" >&2
    exit 1
  fi
fi
OUT="${SRC%.tex}.pdf"

# Pick whatever LaTeX compiler is available.
if command -v latexmk >/dev/null 2>&1; then
  latexmk -pdf -interaction=nonstopmode -halt-on-error "$SRC"
  latexmk -c "$SRC" >/dev/null 2>&1 || true   # tidy aux files, keep the PDF
elif command -v pdflatex >/dev/null 2>&1; then
  pdflatex -interaction=nonstopmode -halt-on-error "$SRC"
  rm -f "${SRC%.tex}.aux" "${SRC%.tex}.log" "${SRC%.tex}.out"
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
