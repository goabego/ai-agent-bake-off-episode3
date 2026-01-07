#!/bin/bash

# Script to generate analytics for all git repositories in the current directory.

OUTPUT_FILE="ep3-analytics.md"

# --- Pre-flight Check ---
if ! command -v jq &> /dev/null
then
    echo "Warning: 'jq' is not installed. Frontend dependency analysis will be skipped."
    echo "Please install jq for complete analysis (e.g., 'brew install jq' or 'sudo apt-get install jq')."
fi

# --- Find Repositories ---
# Find all .git directories up to 2 levels deep, then get their parent directory.
REPOS=()
while IFS= read -r gitdir; do
    # Use sed to strip the '/.git' part from the end
    REPOS+=("$(echo "$gitdir" | sed 's#/.git$##')")
done < <(find . -maxdepth 2 -name ".git" -type d -prune)


# --- Line Count Analysis ---
REPO_NAMES=()
REPO_LINES=()
TOTAL_LINES=0
for repo_path in "${REPOS[@]}"; do
    repo_name=$(basename "$repo_path")
    # Switched to a subshell to avoid cd side-effects and handle errors gracefully
    lines=$( (cd "$repo_path" && git ls-files | xargs wc -l | tail -n1 | awk '{print $1}') || echo 0 )
    if [ -z "$lines" ]; then
        lines=0
    fi
    REPO_NAMES+=("$repo_name")
    REPO_LINES+=("$lines")
    TOTAL_LINES=$((TOTAL_LINES + lines))
done

# --- Initialization & Summary ---
# Clear the output file
> "$OUTPUT_FILE"

echo "# EP3 Analytics" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "This report analyzes **${#REPOS[@]}** repositories, containing a grand total of **$TOTAL_LINES** lines of code." >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "## Line Count Summary" >> "$OUTPUT_FILE"
for i in "${!REPO_NAMES[@]}"; do
    echo "- \`${REPO_NAMES[$i]}\`: ${REPO_LINES[$i]} lines" >> "$OUTPUT_FILE"
done
echo "" >> "$OUTPUT_FILE"


# --- Detailed Repository Analysis ---
echo "## Detailed Repository Analysis" >> "$OUTPUT_FILE"

for repo_path in "${REPOS[@]}"; do
    (
        cd "$repo_path" || exit
        repo_name=$(basename "$repo_path")
        contributors=$(git shortlog -s -n | awk '{$1=""; print $0}' | sed 's/^ *//' | paste -sd "," - | sed 's/,/, /g')
        [ -z "$contributors" ] && contributors="Unknown"
        
        echo "### Team: $contributors"
        echo "**Repo:** \`$repo_name\`"
        echo ""
        
        lines=$(git ls-files | xargs wc -l | tail -n1 | awk '{print $1}')
        if [ -z "$lines" ]; then
            lines=0
        fi
        echo "**Total Lines:** $lines"
        echo ""

        # --- Technology Stack ---
        echo "#### Technology Stack"
        echo "- **File Types (Top 5):**"
        git ls-files | awk -F. '{print $NF}' | sort | uniq -c | sort -nr | head -n 5 | sed 's/^ *[0-9]* /  - /'
        
        if [ -f "requirements.txt" ]; then
            echo "- **Python Dependencies (from requirements.txt):**"
            head -n 5 requirements.txt | sed 's/^/  - /'
        fi
        if [ -f "pyproject.toml" ]; then
            echo "- **Python Dependencies (from pyproject.toml):**"
            grep -E '^[a-zA-Z0-9_-]+' pyproject.toml | head -n 5 | sed 's/^/  - /'
        fi
        if [ -f "package.json" ] && command -v jq &> /dev/null; then
            echo "- **Frontend Dependencies (from package.json):**"
            jq -r '.dependencies | keys | .[]' package.json | head -n 5 | sed 's/^/  - /'
        fi
        echo ""

        # --- Git Insights ---
        echo "#### Git Insights"

        echo "- **Recent Commit Activity (last 5 entries):**"
        git log --date=short --pretty=format:%ad | sort | uniq -c | tail -n 5 | sed 's/^/  - /'
        echo ""

        echo "- **Top 5 Code Hotspots:**"
        git log --pretty=format: --name-only | sort | uniq -c | sort -nr | head -n 5 | sed 's/^ *[0-9]* /  - /' | grep -v '^$'
        echo ""
    ) >> "$OUTPUT_FILE"
done

echo "Analytics generation complete. See $OUTPUT_FILE"