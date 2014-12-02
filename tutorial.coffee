exports             = exports ? @
exports.DefaultFile = "GottaCodeEmAll.spritebuilder/Source/MyCritter.swift"
exports.Files       = [ "GottaCodeEmAll.spritebuilder/Source/Battle.swift" ]

changeStep = (to) ->
  (files) ->
    path        = "GottaCodeEmAll.spritebuilder/Source/Battle.swift"
    files[path] = files[path].replace /(var\scurrentStep:\sCodeStep\s=\sCodeStep.)([\S]*)/igm, "$1#{to}"

exports.Tutorial = () ->
  step "Welcome",                   changeStep "InitCritter"
  step "Creating your critter",     changeStep "InitCritter"
  step "Setting up your critter",   changeStep "InitCritter"
  step "Customizing your critter",  changeStep "Customize"
  step "Your critter's first move", changeStep "TeachTackle"
  step "It's super effective!",     changeStep "TeachElemental"
  step "Swipe over and over",       changeStep "TeachSwipes"
  step "Quick recap",               changeStep "TeachSwipes"
  step "Sing Move",                 changeStep "TeachSing"
  step "Final Recap",               changeStep "TeachSing"


exports.Preprocess = (files) ->
  path        = "GottaCodeEmAll.spritebuilder/Source/MyCritter.swift"
  files[path] = files[path].replace /func(\s+\w+ButtonPressed[\s\S]+?{)/igm, "override func$1"
  files[path] = files[path].replace /([\s\S]+)/igm, "class MyCritter: Critter {$1}"
