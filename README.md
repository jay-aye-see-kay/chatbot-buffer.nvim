# Archive notice

I recently learnt about https://github.com/Robitx/gp.nvim and found it's really close to what I was trying to build with a bunch of great features already implemented. I was using this plugin but not adding the features I wanted, archiving so it's clear I won't add any new features.

# Chatbot-buffer.nvim

This is a plugin for interacting with the openai chat api. It's distinctive feature is that the conversation happens in a regular editable buffer so that it plays nicely with other vim plugins and so the user can revise the conversation history before continuing it.

Requires [plenary.nvim](https://github.com/nvim-lua/plenary.nvim), `curl`, and a [openai api token](https://platform.openai.com/account/api-keys) in the environment variable `OPENAI_API_TOKEN`.

## State of this plugin

This plugin is very work in progress, as in it only just works. There's no docs yet, read the source code (currently <300 lines in one file). Contributions and ideas welcome. Unless you really like exactly what I'm making here I'd recommend one of these two plugins instead:

- https://github.com/jackMort/ChatGPT.nvim
- https://github.com/dpayne/CodeGPT.nvim

### Planned features

- Handle error states better, currently if not online it just says loading forever, not sure what happens if openai's api is down or erroring
- Using virtual text for error and loading state (and maybe expose a function so it could be put in a status line)
- Use the streaming api so tokens can be added to the buffer immediately (1 token per ~100ms instead of the whole lot in 3-10 sec)
  - Is it possible to cancel a streaming response part way through, so we can shut it up when it's waffling? That would be sweet
- Add some formatting and/or concealing to the section markers
- Opt-in debug logging that saves all `curl` requests and responses to file

## Development

### Run tests

`tests/init.lua` will download plenary to `.tests/` on first run.

Assuming you have `just` installed, run tests with: (if you don't have just installed read the justfile for the command to run)

```bash
# run all tests
just test

# run one test
just test tests/files_spec.lua

# run tests on any lua file change (requires entr to to be installed)
ls **/*.lua | entr just test
```
