
-- lua/plugins/surround.lua

return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["s"] = {
            add = function()
              local function_name = vim.fn.input("Function name: ")
              return { { function_name .. "(" }, { ")" } }
            end,
            find = "%b()",
            delete = "^(.-%()().-(%)()$",
            change = {
              target = "^.-%((().-())%)$",
              replacement = function()
                local function_name = vim.fn.input("New function name: ")
                return { { function_name .. "(" }, { ")" } }
              end,
            },
          },
        },
      })
    end
  }
}
