SOURCE_PATH   = "GottaCodeEmAll.spritebuilder/Source/MyCritter.swift"
BATTLE_PATH   = "GottaCodeEmAll.spritebuilder/Source/Battle.swift"
TEMPLATE_PATH = "MyCritter.txt"

exports             = exports ? @
exports.DefaultFile = SOURCE_PATH
exports.Files       = [ BATTLE_PATH, SOURCE_PATH, TEMPLATE_PATH ]

CURRENT_STEP = ""

changeStep = (to) ->
  (files) ->
    CURRENT_STEP = to
    files[BATTLE_PATH] = files[BATTLE_PATH].replace /(var\scurrentStep:\sCodeStep\s=\sCodeStep.)([\S]*)/igm, "$1#{to}"

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
  files[SOURCE_PATH] = files[SOURCE_PATH].replace /func(\s+\w+ButtonPressed[\s\S]+?{)/igm, "public override func$1"
  files[SOURCE_PATH] = files[SOURCE_PATH].replace /(func initialize)/igm, "public override $1"
  files[SOURCE_PATH] = files[SOURCE_PATH].replace /([\s\S]+)/igm, "import Foundation; import GottaCodeEmAll; @objc(MyCritter) public class MyCritter : Critter { public func getCurrentStep() -> CodeStep { return CodeStep.#{CURRENT_STEP} };\n$1\n}"

exports.PreprocessFiles = (files) ->
  files[SOURCE_PATH] = files[TEMPLATE_PATH]

exports.PreprocessErrors = (results) ->
  error.line   -= 1 for error   in results.errors
  warning.line -= 1 for warning in results.warnings
