if 'g:fvim_loaded'->exists()
  " For fvim
  " https://github.com/yatli/fvim
  if g:fvim_os !=# 'windows'
    set guifont=Hack\ Nerd\ Font\ Mono:h14
  endif

  " Font tweaks
  FVimFontAntialias v:true
  FVimFontAutohint v:true
  FVimFontHintLevel 'full'
  FVimFontLigature v:true
  FVimFontSubpixel v:true
  " FVimFontLineHeight '+1.0' " can be 'default', '14.0', '-1.0' etc.
elseif 'g:GtkGuiLoaded'->exists()
  " For neovim-gtk
  " https://github.com/daa84/neovim-gtk
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)

  " Enable transparency
  NGTransparency 1.0

  call rpcnotify(1, 'Gui', 'Font', 'DejaVu Sans Mono 15')
elseif ':GuiFont'->exists()
  GuiFont! Courier\ 10\ Pitch:h14
endif
