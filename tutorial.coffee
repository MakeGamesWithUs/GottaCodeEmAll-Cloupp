exports             = exports ? @
exports.DefaultFile = "GottaCodeEmAll.spritebuilder/Source/MyMonster.swift"
exports.Files       = [ "GottaCodeEmAll.spritebuilder/Source/Battle.swift" ]

changeStep = (files, to) ->
  path        = "GottaCodeEmAll.spritebuilder/Source/Battle.swift"
  files[path] = files[path].replace /var\scurrentStep:\sCodeStep\s=\sCodeStep.(InitMonster)/, "$1#{to}"

exports.Tutorial = () ->
  step "Welcome", (files) -> changeStep files, "TeachTackle"
