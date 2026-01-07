#!/bin/bash

OUTPUT_FILE="ep3-deep-dive.md"
> "$OUTPUT_FILE"

echo "# EP3 Technical Deep Dive" >> "$OUTPUT_FILE"
echo "Generated on $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find Repos
REPOS=()
while IFS= read -r gitdir; do
    REPOS+=("$(echo "$gitdir" | sed 's#/.git$##')")
done < <(find . -maxdepth 2 -name ".git" -type d -prune)

for repo_path in "${REPOS[@]}"; do
    (
        cd "$repo_path" || exit
        repo_name=$(basename "$repo_path")
        echo "## Repo: $repo_name"
        
        # 1. Prompt vs Logic Ratio
        # Heuristic: Count lines in explicitly named 'prompts' directories or .txt files vs .py/.ts files
        prompt_lines=$(find . -type f \( -path "*prompts*" -o -name "*.txt" -o -name "*.md" \) -not -path "*.git*" | xargs wc -l 2>/dev/null | tail -n1 | awk '{print $1}')
        logic_lines=$(find . -type f \( -name "*.py" -o -name "*.ts" -o -name "*.tsx" -o -name "*.js" \) -not -path "*.git*" -not -path "*node_modules*" -not -path "*venv*" | xargs wc -l 2>/dev/null | tail -n1 | awk '{print $1}')
        
        [ -z "$prompt_lines" ] && prompt_lines=0
        [ -z "$logic_lines" ] && logic_lines=0
        
        echo "### 🧠 Cognitive Architecture (Prompts vs. Logic)"
echo "- **Prompt Volume:** $prompt_lines lines (Instructions, System Prompts)"
echo "- **Logic Volume:** $logic_lines lines (Python/TypeScript glue)"
if [ "$logic_lines" -gt 0 ]; then
     ratio=$(echo "scale=2; $prompt_lines / $logic_lines * 100" | bc 2>/dev/null || echo 0)
     echo "- **Prompt Density:** $ratio% of the codebase is natural language."
fi
echo ""

        # 2. Challenge Implementation Scans (Grepping for specific signatures)
        echo "### 🛠️ Challenge Implementation Signatures"
        
        # Challenge 3: BigQuery
        bq_usage=$(grep -r "bigquery" . --include="*.py" --include="*.ts" | wc -l)
        if [ "$bq_usage" -gt 0 ]; then echo "- ✅ **BigQuery (Challenge 3):** Detected ($bq_usage refs)"; else echo "- ❌ **BigQuery:** Not detected"; fi
        
        # Challenge 4: MCP
        mcp_usage=$(grep -rE "mcp_server|MultiCapability" . --include="*.py" | wc -l)
        if [ "$mcp_usage" -gt 0 ]; then echo "- ✅ **MCP Server (Challenge 4):** Detected ($mcp_usage refs)"; else echo "- ❌ **MCP Server:** Not detected"; fi

        # Challenge 5: A2A
        a2a_usage=$(grep -rE "adk.a2a|ExposingServer" . --include="*.py" | wc -l)
        if [ "$a2a_usage" -gt 0 ]; then echo "- ✅ **A2A Protocol (Challenge 5):** Detected ($a2a_usage refs)"; else echo "- ❌ **A2A Protocol:** Not detected"; fi

        # Challenge 6: Multimodal
        vision_usage=$(grep -rE "Image.open|genai.upload_file|PIL" . --include="*.py" | wc -l)
        if [ "$vision_usage" -gt 0 ]; then echo "- ✅ **Computer Vision (Challenge 6):** Detected ($vision_usage refs)"; else echo "- ❌ **Computer Vision:** Not detected"; fi
        echo ""

        # 3. Key Library Adoption
        echo "### 📚 Tech Stack DNA"
        echo "Top Imports:"
grep -rE "^(import|from)" . --include="*.py" --include="*.ts*" --exclude-dir="node_modules" --exclude-dir="venv" | \
            sed -E 's/^(import|from) ([a-zA-Z0-9_\.]+).*/\2/' | \
            sed -E 's/^import ([a-zA-Z0-9_\.]+).*/\1/' | \
            sort | uniq -c | sort -nr | head -n 5 | sed 's/^ *[0-9]* /  - /'
        echo ""

        # 4. Ops Maturity
        echo "### 🏗️ Ops & Infra"
        if [ -f "Dockerfile" ]; then echo "- **Docker:** ✅ Present"; else echo "- **Docker:** ❌ Missing"; fi
        if [ -f "docker-compose.yml" ]; then echo "- **Compose:** ✅ Present"; else echo "- **Compose:** ❌ Missing"; fi
        if [ -f "cloudbuild.yaml" ] || [ -f ".github/workflows" ]; then echo "- **CI/CD:** ✅ Present"; else echo "- **CI/CD:** ❌ Missing"; fi
        
        echo "---"
        echo ""
    ) >> "$OUTPUT_FILE"
done
