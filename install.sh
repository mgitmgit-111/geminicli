#!/bin/bash
# Installation script for GeminiDB CLI

echo "Installing GeminiDB CLI..."

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is required but not installed."
    exit 1
fi

# Check Python version
python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "Python version: $python_version"

# Install package
pip3 install -e .

# Check if installation succeeded
if command -v geminidb &> /dev/null; then
    echo "✓ GeminiDB CLI installed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Set your API key: export GEMINI_API_KEY='your-key-here'"
    echo "2. Or copy .env.example to .env and add your key"
    echo "3. Test with: geminidb create 'test database'"
    echo ""
    echo "Available commands:"
    geminidb --help
else
    echo "Installation may have failed. Check pip output above."
    exit 1
fi
