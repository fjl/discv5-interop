set -e

# install C compiler and other build tools
sudo apt-get update
sudo apt-get install -y gcc libc-dev make pkg-config git virtualenv python3-dev libffi-dev rustc cargo

# clone py discv5
repo=ethereum/ddht
branch=master
if [ ! -d ddht ]; then
    git clone --branch "$branch" "https://github.com/$repo"
else
    ( cd ddht; git pull )
fi

# build it
cd ddht
virtualenv -p python3 venv
. venv/bin/activate
pip install --upgrade pip
pip install -e '.[dev]'
