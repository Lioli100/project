#!/bin/bash

REPO="AFISCOPR/project"  # Altere para o nome do seu repositório
CSV_FILE="github_issues.csv"

# Ignora o cabeçalho
tail -n +2 "$CSV_FILE" | while IFS=',' read -r title description labels status; do
  echo "Criando issue: $title"
  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --body "$description" \
    --label "$labels"
done
