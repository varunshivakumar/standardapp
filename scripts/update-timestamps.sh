#!/bin/bash

# Script to update "Last updated" timestamps in markdown files
# This script is designed to be run as a pre-commit hook
# Only updates timestamps for files that are being committed

# Get the current date in a readable format
CURRENT_DATE=$(date "+%B %d, %Y")

# Function to update timestamp in a markdown file
update_timestamp() {
    local file="$1"
    
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "File $file does not exist, skipping..."
        return
    fi
    
    # First, remove any existing "Last updated" lines to avoid duplicates
    sed -i '' '/^\*\*Last updated:\*\*/d' "$file"
    
    # Create a temporary file
    local temp_file=$(mktemp)
    
    # Process the file line by line
    local in_header=false
    local timestamp_added=false
    
    while IFS= read -r line; do
        # Check if we're in the header section (between first # and first ##)
        if [[ "$line" =~ ^#\ [^#] ]]; then
            in_header=true
            echo "$line" >> "$temp_file"
            continue
        fi
        
        # If we hit a ## heading, we're out of the header section
        if [[ "$line" =~ ^##\ [^#] ]]; then
            in_header=false
        fi
        
        # If we're at the end of the header and no timestamp was added yet, add one
        if [ "$in_header" = false ] && [ "$timestamp_added" = false ] && [[ "$line" =~ ^$ ]]; then
            echo "**Last updated:** $CURRENT_DATE" >> "$temp_file"
            echo "" >> "$temp_file"
            timestamp_added=true
        fi
        
        echo "$line" >> "$temp_file"
    done < "$file"
    
    # If no timestamp was added, add it at the beginning of the file
    if [ "$timestamp_added" = false ]; then
        # Add timestamp at the very beginning
        echo "**Last updated:** $CURRENT_DATE" > "$temp_file"
        echo "" >> "$temp_file"
        cat "$file" >> "$temp_file"
    fi
    
    # Replace the original file with the updated one
    mv "$temp_file" "$file"
    echo "Updated timestamp in $file"
}

# Get list of staged markdown files in the documentation directory
STAGED_MARKDOWN_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep "^documentation/.*\.md$")

# Check if any markdown files are staged
if [ -z "$STAGED_MARKDOWN_FILES" ]; then
    echo "No markdown files in documentation directory are being committed."
    exit 0
fi

# Update timestamps for each staged markdown file
echo "Updating timestamps for staged markdown files:"
for file in $STAGED_MARKDOWN_FILES; do
    update_timestamp "$file"
done

echo "Timestamp updates completed!"
