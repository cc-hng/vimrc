return {
  -- lang
  { import = "lazyvim.plugins.extras.lang.cmake" },
  -- { import = "lazyvim.plugins.extras.lang.rust" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
}
