return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        neocmake = {
          init_options = {
            format = {
              enable = false,
            },
            lint = {
              enable = true,
            },
            scan_cmake_in_package = true, -- default is true
          },
        },
      },
    },
  },
}
