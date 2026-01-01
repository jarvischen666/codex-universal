#!/usr/bin/env bash

set -euo pipefail

echo "Verifying language runtimes ..."

echo "- Python:"
python3 --version
pyenv versions | sed 's/^/  /'

echo "- Node.js:"
for version in "18" "20" "22" "24"; do
    echo "  Node.js ${version}:"
    nvm use "${version}" > /dev/null 2>&1 || true
    node --version | sed 's/^/    /'
    npm --version | sed 's/^/    /'
    pnpm --version | sed 's/^/    /'
    yarn --version | sed 's/^/    /'
done

echo "- Java / Gradle:"
java -version
javac --version
gradle --version | head -n 3
mvn --version | head -n 1

echo "All language runtimes detected successfully."
