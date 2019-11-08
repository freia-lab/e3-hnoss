importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var macroInput = DataUtil.createMacrosInput(true);
var HnossAIdevNam = PVUtil.getString(pvArray[0]);

macroInput.put("AI2Macro", HnossAIdevNam);
widgetController.setPropertyValue("macros", macroInput);
