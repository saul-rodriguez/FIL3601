;;-----------------------------------------------------------------------------
;; Bindkeys for 'Schematics'
;; Inherited by:
;;             * PcellIDE Schematic
;;             * Power Manager
;;             * Schematics XL
;;             * adegxl-schematic
;;             * adexl-schematic
;;             * assembler-schematic
;;             * explorer-schematic
;;-----------------------------------------------------------------------------
hiSetBindKeys( "Schematics" list(
list("<DrawThru1>"	"schDirectEdit(1)"	"geSingleSelectBox()")
list("<DrawThru2>"	"hiDynamicPanGrabbing()"	"hiDynamicPanGrabbing()")
list("<DrawThru3>"	"hiZoomIn()"	"hiZoomIn()")
list("<Key>#"	"hiToggleAnchorMagnifier()")
list("<Key>'"	"hiUpdateMagOptions()")
list("<Key>."	"hiToggleMagnifier()")
list("<Key>4"	""	"schSnapToConn()")
list("<Key>5"	"schHiRouteFlightLine()")
list("<Key>8"	"schHiHiliteLabel(\"instance\" \"on\")")
list("<Key>9"	"geEnterAddNetProbe()")
list("<Key>="	"schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())")
list("<Key>A"	"geSingleSelectPoint()")
list("<Key>B"	"schHiCreateBlockInst()")
list("<Key>BackSpace"	"schHiDelete()"	"deletePoint()")
list("<Key>C"	"schHiCopy()")
list("<Key>D"	"geSubSelectPoint()")
list("<Key>Delete"	"schHiDelete()")
list("<Key>Down"	"geScroll(nil \"s\"     nil)")
list("<Key>E"	"schHiDescendRead()")
list("<Key>Escape"	""	"cancelEnterFun()")
list("<Key>F"	"hiZoomAbsoluteScale(getCurrentWindow() 0.9)")
list("<Key>F1"	"hiHelp('window deGetAppInfo(deGetEditViewType(hiGetCurrentWindow()))->appName)")
list("<Key>F10"	"schSetSelectOptions()")
list("<Key>F11"	"deToggleAssistants()")
list("<Key>F2"	"_schHiSave()")
list("<Key>F3"	"_schHiSaveAs()"	"hiToggleEnterForm()")
list("<Key>F4"	"schSetSelectOptions()")
list("<Key>F6"	"hiRedraw()")
list("<Key>F7"	"schHiCheck(\"run\")")
list("<Key>F9"	"schHiCreateNoteShape()")
list("<Key>G"	"geHiCommonFindMarker()")
list("<Key>H"	"schHiHiliteLabel(\"wire\" \"on\")")
list("<Key>I"	"schHiCreateInst()")
list("<Key>J"	"schHiRotate()"	"schSetEnv(\"rotate\" t)")
list("<Key>L"	"schHiCreateWireLabel()")
list("<Key>Left"	"geScroll(nil \"w\"     nil)")
list("<Key>M"	"schHiMove()")
list("<Key>N"	"_mspsWholeNetCB()")
list("<Key>O"	"_mspsOpenOptionsFormCB()")
list("<Key>P"	"schHiCreatePin()")
list("<Key>Q"	"schHiObjectProperty()"	"schHiObjectProperty()")
list("<Key>R"	"schHiRotate(t)"	"schSetEnv(\"rotate\" t)")
list("<Key>Right"	"geScroll(nil \"e\"     nil)")
list("<Key>S"	"schHiStretch()"	"schSnapToConn()")
list("<Key>T"	"schHiEditText()")
list("<Key>Tab"	"hiPan()")
list("<Key>U"	"hiUndo()")
list("<Key>Up"	"geScroll(nil \"n\"     nil)")
list("<Key>V"	"hiVectorPan()")
list("<Key>W"	"schHiCreateWire(0.0)")
list("<Key>X"	"schHiEditInPlace()")
list("<Key>Z"	"hiZoomIn()")
list("<Key>["	"hiZoomRelativeScale(getCurrentWindow() 0.8)")
list("<Key>]"	"hiZoomRelativeScale(getCurrentWindow() 1.25)")
list("<Key>space"	"schHiCreateWireStubs()")
list("Ctrl Shift <Key>L"	"xfabSchemWirePin(t)")
list("Ctrl Shift<Btn1Down>"	"hiZoomInMagnifier(hiGetCurrentWindow())")
list("Ctrl Shift<Btn2Down>"	"hiZoomOutMagnifier(hiGetCurrentWindow())")
list("Ctrl Shift<Btn4Down>"	"_schScaleMagnifier(1.25)")
list("Ctrl Shift<Btn5Down>"	"_schScaleMagnifier(0.80)")
list("Ctrl Shift<Key>A"	"geSelectByLine()")
list("Ctrl Shift<Key>Down"	"hiScaleMagnifier(0.80)")
list("Ctrl Shift<Key>Up"	"hiScaleMagnifier(1.25)")
list("Ctrl Shift<Key>Z"	"hiNextWinView(hiGetCurrentWindow())")
list("Ctrl<Btn1Down>"	"mouseSubSelectPt()"	"mouseSubSelectPt()")
list("Ctrl<Btn4Down>"	"geScroll(nil \"n\" nil)")
list("Ctrl<Btn5Down>"	"geScroll(nil \"s\" nil)")
list("Ctrl<DrawThru1>"	"schDirectEdit(3)"	"geSubSelectBox()")
list("Ctrl<Key>A"	"geSelectAllFig()")
list("Ctrl<Key>B"	"annToggleInfoBalloonVisibilityStatus()")
list("Ctrl<Key>D"	"geDeselectAllFig()")
list("Ctrl<Key>E"	"schHiReturn()")
list("Ctrl<Key>F"	"schSetSelectOptions()")
list("Ctrl<Key>F11"	"deToggleToolbars()")
list("Ctrl<Key>G"	"geHiDeleteMarker()")
list("Ctrl<Key>J"	""	"schSetEnv(\"upsideDown\" t)")
list("Ctrl<Key>L"	"xfabSchemWirePin(nil)")
list("Ctrl<Key>R"	""	"schSetEnv(\"upsideDown\" t)")
list("Ctrl<Key>S"	"_schHiSaveAs()")
list("Ctrl<Key>T"	"schHiZoomToSelSet()")
list("Ctrl<Key>Tab"	"hiLowerWindow(hiGetCurrentWindow())")
list("Ctrl<Key>V"	"hiFocusToCIW(hiGetCurrentWindow())")
list("Ctrl<Key>Z"	"hiZoomRelativeScale(getCurrentWindow() 1.25)")
list("None<Btn1Down>"	"schSingleSelectPt()"	"mouseAddPt(t)")
list("None<Btn1Down>(2)"	""	"schMouseApplyOrFinish()")
list("None<Btn2Down>"	"hiRepeat()"	"schCmdOption()")
list("None<Btn3Down>"	"schHiMousePopUp()"	"schHiMousePopUp()")
list("None<Btn3Down>(2)"	""	"hiToggleEnterForm()")
list("None<Btn4Down>"	"hiZoomInAtMouse()")
list("None<Btn5Down>"	"hiZoomOutAtMouse()")
list("Return"	""	"schMouseApplyOrFinish()")
list("Shift<Btn1Down>"	"schAddSelectPt()"	"mouseAddSelectPt()")
list("Shift<Btn1Down>(2)"	"schExtendSelectPt()")
list("Shift<Btn2Down>"	""	"schShiftCmdOption()")
list("Shift<Btn4Down>"	"geScroll(nil \"w\" nil)")
list("Shift<Btn5Down>"	"geScroll(nil \"e\" nil)")
list("Shift<DrawThru1>"	"schDirectEdit(2)"	"geAddSelectBox()")
list("Shift<DrawThru3>"	"hiZoomOut()"	"hiZoomOut()")
list("Shift<Key>8"	"schHiHiliteLabel(\"instance\" \"off\")")
list("Shift<Key>A"	"geSingleSelectBox()")
list("Shift<Key>D"	"geSubSelectBox()")
list("Shift<Key>Delete"	"schHiIgnore()")
list("Shift<Key>E"	"when(schSingleSelectPt() schHiDescend())"	"schMouseApplyOrFinish()")
list("Shift<Key>F"	"hiZoomAbsoluteScale(getCurrentWindow() 0.9)")
list("Shift<Key>F11"	"deToggleAssistants() deToggleToolbars()")
list("Shift<Key>F4"	"geToggleAreaSelectOption()")
list("Shift<Key>G"	"geHiExplainMarker()")
list("Shift<Key>H"	"schHiHiliteLabel(\"wire\" \"off\")")
list("Shift<Key>I"	"schHiCreateBlockInst()")
list("Shift<Key>J"	""	"schSetEnv(\"sideways\" t)")
list("Shift<Key>L"	"schHiCreateNoteLabel()")
list("Shift<Key>M"	"schHiMove()")
list("Shift<Key>N"	"_mspsNetToNetCB()")
list("Shift<Key>O"	"schHiEditorOptions()")
list("Shift<Key>Q"	"schHiCellViewProperty()"	"schHiCellViewProperty()")
list("Shift<Key>R"	"_mspsReportAllNetsCB()"	"schSetEnv(\"sideways\" t)")
list("Shift<Key>S"	"schHiFind()")
list("Shift<Key>T"	"schHiTree()")
list("Shift<Key>U"	"hiRedo()")
list("Shift<Key>V"	"_deToggleAssistant(\"World View\")")
list("Shift<Key>W"	"hiNextWinView(hiGetCurrentWindow())")
list("Shift<Key>X"	"schHiCheckAndSave()")
list("Shift<Key>Z"	"hiZoomRelativeScale(getCurrentWindow() 0.8)")
list("ShiftCtrl<Key>E"	"schHiEditorOptions()")
list("ShiftCtrl<Key>W"	"hiPrevWinView(hiGetCurrentWindow())")

;; Empty bindkeys (typically inserted when a bindkey is redefined or deleted)
list("<Key>F8"	"")
list("Ctrl<Key>P"	"")
list("Ctrl<Key>W"	"")
list("Ctrl<Key>X"	"")
list("Shift<Key>B"	"")
)) ;; hiSetBindKeys
;;-----------------------------------------------------------------------------

