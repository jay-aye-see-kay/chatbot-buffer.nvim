local M = require("chatbot-buffer")

local files = {
  "/2023-01-02_0001.ai-chat.md",
  "/2023-01-01_0002.ai-chat.md",
  "/2023-01-01_0001.ai-chat.md",
}
local tmpdir = ""

describe("filesystem functions", function()
  before_each(function()
    -- SETUP: create a temp chats_dir and fill it with `files`
    tmpdir = vim.loop.fs_mkdtemp("/tmp/chatbot-buffer-tests-XXXXXX")
    for _, file in ipairs(files) do
      io.open(tmpdir .. "/" .. file, "w"):close()
    end
    M.setup({ chats_dir = tmpdir })
  end)

  after_each(function()
    -- TEARDOWN: remove temp files and folders
    for _, file in ipairs(files) do
      os.remove(tmpdir .. file)
    end
    os.execute("rmdir " .. tmpdir)
  end)

  it("get_chats_filenames returns files from chats_dir newest to oldest", function()
    assert.same({
      tmpdir .. files[1],
      tmpdir .. files[2],
      tmpdir .. files[3],
    }, M.get_chats_filenames())
  end)
end)
