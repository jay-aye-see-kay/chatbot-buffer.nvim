# Chatbot-buffer.nvim

This is a plugin for interacting with the openai chat api. It's distinctive feature is that the conversation happens in a regular editable buffer so that it plays nicely with other vim plugins and so the user can revise the conversation history before continuing it.

## Development

### Run tests

Running tests requires plenary.nvim to be checked out in the parent directory of _this_ repository.
You can then run:

```bash
nvim --headless --noplugin -u tests/minimal.vim -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal.vim'}"
```

Or if you want to run a single test file:

```bash
nvim --headless --noplugin -u tests/minimal.vim -c "PlenaryBustedDirectory tests/path_to_file.lua {minimal_init = 'tests/minimal.vim'}"
```
