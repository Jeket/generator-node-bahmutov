echo "Linking current generator package"
npm link

echo "Creating test folder"
folder=/tmp/test-node-generator
rm -rf $folder
mkdir $folder
cd $folder
echo "Created test folder $folder"

echo "Creating local git repo"
git init
git remote add origin git@github.com:bahmutov/test-node-generator.git

echo "Running yeoman"
yo node-bahmutov --force <<EOF
test-project
this is my project
key word1, another one
EOF

echo "Generator is done, adding a few empty files"
touch index.js
mkdir src
cd src
touch foo.js
cd ..
git add index.js
echo "Files before the commit"
ls -lR
git commit -m "chore(test): this is a test commit"

ls -la
git log --oneline
git show
echo "All done testing generator"
