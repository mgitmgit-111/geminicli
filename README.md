# GeminiDB CLI

AI-powered SQL database generator using Google Gemini API. Create complete SQLite databases from natural language descriptions or CSV files.

## Features

- 🤖 **AI-Powered Schema Generation**: Describe your database in plain English, get complete SQL
- 📊 **CSV Import**: Automatically generate tables and import data from CSV files
- 💬 **Natural Language Queries**: Ask questions about your data in plain English
- 🔧 **Full CLI Interface**: Complete command-line tooling for database management
- 🗄️ **SQLite Backend**: Portable, serverless databases
- 📝 **SQL Export**: Export your database as SQL dump files

## Installation

### From Source (Development)

```bash
git clone <repository-url>
cd geminidb-cli
pip install -e .
```

### Standard Installation

```bash
pip install geminidb-cli
```

## Setup

Set your Google Gemini API key:

```bash
export GEMINI_API_KEY="your-api-key-here"
```

Or create a `.env` file:
```
GEMINI_API_KEY=your-api-key-here
```

Get your API key from [Google AI Studio](https://ai.google.dev/).

## Usage

### Create a Database from Description

```bash
# Basic usage
geminidb create "employee database with departments and salaries"

# With custom name
geminidb create "inventory system with products, categories, and suppliers" --name shop.db

# With CSV data
geminidb create "customer database" --csv customers.csv --name customers.db
```

### Connect to Existing Database

```bash
geminidb connect company.db
```

### Execute SQL Queries

```bash
geminidb query "SELECT * FROM employees WHERE salary > 50000"
```

### Natural Language Queries

```bash
geminidb ask "show me all employees in engineering department"
geminidb ask "what is the average salary by department"
```

### Add Data from CSV

```bash
geminidb add-data employees new_hires.csv
```

### List Databases

```bash
geminidb list
```

### Export Database

```bash
# Export to default filename (database_export.sql)
geminidb export

# Export to specific file
geminidb export --output backup.sql
```

## Examples

### Example 1: Employee Database

```bash
geminidb create "employee database with departments, positions, salaries, and hire dates. Include departments table with budget info" --name company.db
```

This creates:
- `departments` table with id, name, budget, location
- `employees` table with id, name, email, department_id (foreign key), position, salary, hire_date
- Proper indexes and constraints
- Sample data for testing

### Example 2: E-commerce Database

```bash
geminidb create "e-commerce database with products, categories, customers, orders, and order items. Products should have price, stock, and category. Orders track status and total amount" --name store.db
```

### Example 3: CSV Import

Given `sales_data.csv`:
```csv
date,product,quantity,revenue,region
2024-01-15,Laptop,5,4995,North
2024-01-16,Mouse,50,2495,East
```

```bash
geminidb create "sales tracking database" --csv sales_data.csv --name sales.db
```

## CLI Commands

| Command | Description | Arguments |
|---------|-------------|-----------|
| `create` | Create new database | `description` (required), `--name`, `--csv` |
| `connect` | Connect to existing DB | `database` path |
| `query` | Execute SQL | `sql` query string |
| `ask` | Natural language query | `question` |
| `add-data` | Import CSV to table | `table`, `csv` |
| `list` | List all .db files | - |
| `export` | Export as SQL | `--output` (optional) |

## Environment Variables

- `GEMINI_API_KEY`: Your Google Gemini API key (required)

## Shortcuts

The tool installs two command names:
- `geminidb` - Full command name
- `gdb` - Quick shortcut

```bash
gdb create "blog database with posts, authors, comments, and tags"
```

## How It Works

1. **Schema Generation**: Your description is sent to Gemini API which generates appropriate CREATE TABLE statements with proper data types, constraints, and relationships.

2. **CSV Analysis**: When providing a CSV, Gemini analyzes the data types and suggests optimal schema, then data is imported.

3. **Natural Language**: Questions are converted to SQL using the database schema as context.

4. **SQLite Storage**: All databases are standard SQLite files you can use with any SQLite tool.

## Database Files

All `.db` files are created in your current working directory. They are standard SQLite databases compatible with:
- SQLite CLI
- DB Browser for SQLite
- Python sqlite3
- Any SQLite-compatible tool

## Error Handling

The CLI provides clear error messages for:
- Missing API keys
- Invalid SQL syntax
- File not found errors
- Connection issues

## Security Notes

- Never commit `.env` files with API keys
- Database files are local and portable
- No data is sent to Google except schema descriptions for generation

## License

MIT License
