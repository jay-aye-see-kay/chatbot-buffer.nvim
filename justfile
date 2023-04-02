alias t := test

default:
  just --list

# run tests (pass a file path to only narrow to that file)
test TEST="tests/":
  nvim --headless -u tests/init.lua -c "PlenaryBustedDirectory {{TEST}} {minimal_init = 'tests/init.lua'}"
