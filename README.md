# README

## Install
```bash
brew install postgresql@14
brew services start postgresql@14

export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include"

bundle
```

## Run
```bash
bin/dev
```