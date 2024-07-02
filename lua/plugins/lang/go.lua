local spec = {}

if vim.fn.executable("go") == 1 then
  spec.import = "lazyvim.plugins.extras.lang.go"
end

return spec
