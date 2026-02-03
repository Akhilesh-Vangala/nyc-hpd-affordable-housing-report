#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
echo "1. Downloading data..."
python3 download_data.py
echo "2. Knitting report..."
if command -v Rscript &>/dev/null; then
  Rscript run_report.R
elif command -v conda &>/dev/null && conda run -n base command -v Rscript &>/dev/null 2>/dev/null; then
  conda run -n base Rscript run_report.R
else
  echo "R not found. Install with: brew install r   OR   conda install -c conda-forge r-base"
  exit 1
fi
echo "Done. Open report.html"
