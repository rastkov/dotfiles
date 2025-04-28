local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- print("")
  s("print", {
    t('print("'), i(1), t('")'),
  }),

  -- def function
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2), t({"):", "    "}), i(3),
  }),

  -- if __name__ == "__main__"
  s("main", {
    t({'if __name__ == "__main__":', "    "}), i(1),
  }),
}

