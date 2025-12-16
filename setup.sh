# Change to the script's directory
cd "$(dirname "$0")" || exit 1
echo "Changed working directory to $(pwd)"

# Install uv if not already installed
if ! command -v uv &> /dev/null
then
    echo "uv could not be found, installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Remove existing virtual environment if it exists
deactivate
rm -rf .venv

# Create and activate a new virtual environment
uv venv
source .venv/bin/activate
uv pip --no-cache install --upgrade pip
uv pip --no-cache install -r requirements.txt
uv cache clean