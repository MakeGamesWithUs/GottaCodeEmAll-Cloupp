exports             = exports ? @
exports.DefaultFile = "GottaCodeEmAll.spritebuilder/Source/MyMonster.swift"
exports.Files       = [ "GottaCodeEmAll.spritebuilder/Source/Battle.swift" ]

changeStep = (to) ->
  (files) ->
    path        = "GottaCodeEmAll.spritebuilder/Source/Battle.swift"
    files[path] = files[path].replace /(var\scurrentStep:\sCodeStep\s=\sCodeStep.)([\S]*)/igm, "$1#{to}"

exports.Tutorial = () ->
  step "Welcome",                   changeStep "InitMonster"
  step "Creating your monster",     changeStep "InitMonster"
  step "Customizing your monster",  changeStep "Customize"
  step "Your monster's first move", changeStep "TeachTackle"
  step "It's super effective!",     changeStep "TeachElemental"
  step "Swipe over and over",       changeStep "TeachSwipes"
  step "Wrapping up",               changeStep "TeachSwipes"
