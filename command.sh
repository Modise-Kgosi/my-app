#!/bin/bash

# Step 1: Create React app
npx create-react-app my-app
cd my-app

# Step 2: Initialize git and commit initial code
git init
git add .
git commit -m "Initial commit"

# Step 3: Create GitHub repo using GitHub CLI
gh repo create my-app --public
git remote add origin https://github.com/Modise-Kgosi/my-app.git
git push -u origin master

# Step 4: Switch to update_logo branch
git checkout -b update_logo

# Step 5: Replace logo and update link
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg
sed -i '' 's|https://reactjs.org|https://www.propelleraero.com/dirtmate/|g' src/App.js

git add .
git commit -m "Update logo and link"

# Step 6: Push update_logo branch
git push -u origin update_logo

# Step 7: Create PR
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replaced React logo with Propeller Aero logo and updated link"

# Step 8: Merge PR
gh pr merge --merge

# REPO_URL https://github.com/Modise-Kgosi/my-app