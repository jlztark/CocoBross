cd "C:\Users\Jorge Luis\Desktop\CocoBross"

git add .

current_date=$(date +"%Y-%m-%d %H:%M:%S")

added_files=$(git diff --cached --name-only)

commit_message="$current_date | $added_files"

git commit -m "$commit_message"

