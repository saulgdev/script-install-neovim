#!/bin/bash

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 23

# Verify the Node.js version:
node -v     # Should print "v23.11.0".
nvm current # Should print "v23.11.0".

# Verify npm version:
npm -v # Should print "10.9.2".

curl -fsSL https://get.pnpm.io/install.sh | sh -
