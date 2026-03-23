# GeminiDB CLI Quick Reference

## Installation
```bash
pip install -e .
# or
./install.sh
```

## Setup
```bash
export GEMINI_API_KEY="your-key-here"
# or create .env file
```

## Commands

### Create Database
```bash
geminidb create "employee database with departments" --name company.db
geminidb create "inventory system" --csv products.csv --name shop.db
```

### Connect & Query
```bash
geminidb connect company.db
geminidb query "SELECT * FROM employees"
geminidb ask "show me all managers"
```

### Data Management
```bash
geminidb add-data employees new_hires.csv
geminidb export --output backup.sql
```

### Utilities
```bash
geminidb list          # List all databases
geminidb --help        # Show help
```

## Shortcuts
- `geminidb` = full command
- `gdb` = short alias
