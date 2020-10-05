set -e

# install C compiler and other build tools
sudo apk add gcc musl-dev make git py-virtualenv python3-dev libffi-dev cargo

# clone py discv5
repo=pipermerriam/ddht
branch=piper/v51-spec-update
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
pip install -e .[dev]
