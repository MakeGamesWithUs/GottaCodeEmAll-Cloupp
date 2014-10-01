exports             = exports ? @
exports.DefaultFile = "GottaCodeEmAll.spritebuilder/Source/MyMonster.swift"
exports.Files       = [ "GottaCodeEmAll.spritebuilder/Source/Battle.swift" ]

changeStep = (files, to) ->
  path        = "GottaCodeEmAll.spritebuilder/Source/Battle.swift"
  files[path] = files[path].replace /(var\scurrentStep:\sCodeStep\s=\sCodeStep.)(InitMonster)/, "$1#{to}"

exports.Tutorial = () ->
  step "Welcome", (files) -> changeStep files, "InitMonster"
  step "Creating your monster", (files) -> changeStep files, "InitMonster"
  step "Customizing your monster", (files) -> changeStep files, "Customize"
  step "Your monster's first move", (files) -> changeStep files, "TeachTackle"
  step "It's super effective!", (files) -> changeStep files, "TeachElemental"
  step "Swipe over and over", (files) -> changeStep files, "TeachSwipe"
  step "Wrapping up", (files) -> changeStep files, "TeachSwipe"
