#!/usr/bin/env bash
# Checks before every commit. Run from the repo root: bash scripts/check.sh
set -u; fail=0; err(){ echo "✗ $*"; fail=1; }
pages=$(find . -name '*.html' -not -path './.git/*' -not -path './templates/*' -not -path '*/demo/*')
# 1. words that must never appear in public files (private sources). Add to this list when a new private source exists.
banned='Kontext|Klett'
hits=$(grep -rlEi "$banned" --include='*.html' --include='*.css' --include='*.js' --include='*.md' . --exclude-dir=.git --exclude=CLAUDE.md --exclude=check.sh 2>/dev/null)
[ -n "$hits" ] && err "Banned words ($banned) in: $hits"
for f in $pages; do
  grep -q '<html lang=' "$f" || err "$f: missing <html lang>"
  grep -q '<title>' "$f" || err "$f: missing <title>"
  grep -q 'name="viewport"' "$f" || err "$f: missing viewport meta"
  grep -q 'site.css' "$f" || err "$f: not using assets/site.css"
  grep -oE '<img [^>]*>' "$f" | grep -v 'alt=' | sed "s|^|$f: image without alt: |" | while read -r l; do echo "✗ $l"; done | grep -q . && fail=1
  # local links and images must exist
  dir=$(dirname "$f")
  for ref in $(grep -oE '(href|src)="[^"#:]+"' "$f" | sed -E 's/^(href|src)="//; s/"$//'); do
    t="$dir/$ref"; [ -d "$t" ] && t="$t/index.html"
    [ -e "$t" ] || err "$f: broken link $ref"
  done
done
[ -f .nojekyll ] || err ".nojekyll missing"
[ $fail = 0 ] && echo "✓ Checks passed ($(echo "$pages" | wc -w) pages)"; exit $fail
