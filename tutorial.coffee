exports             = exports ? @
exports.DefaultFile = "MyCritter.txt"
exports.Files       = [ "GottaCodeEmAll.spritebuilder/Source/Battle.swift" , "GottaCodeEmAll.spritebuilder/Source/MyCritter.swift"]

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
  pathTxt = "MyCritter.txt"
  files[pathTxt] = files[pathTxt].replace /func(\s+\w+ButtonPressed[\s\S]+?{)/igm, "override func$1"
  files[pathTxt] = files[pathTxt].replace /(func initialize)/igm, "override $1"
  files[pathTxt] = files[pathTxt].replace /([\s\S]+)/igm, "class MyCritter: Critter {\n$1\n}"
  path        = "GottaCodeEmAll.spritebuilder/Source/MyCritter.swift"
  files[path] = files[pathTxt]
