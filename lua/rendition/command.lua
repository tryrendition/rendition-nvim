local mod = {}

function mod.auth()
  require('rendition.auth').run()
end

function mod.getTailwind()
  require('rendition.getTailwind').run()
end

function mod.init()
  require('rendition.initRendition').run()
end

return mod
