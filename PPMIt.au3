#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Version=Beta
#AutoIt3Wrapper_Outfile=PPMIt.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=View the metadata of Flipnote Studio animation files.
#AutoIt3Wrapper_Res_Description=PPMIt
#AutoIt3Wrapper_Res_Fileversion=1
#AutoIt3Wrapper_Res_LegalCopyright=JoshuaDoes © 2017
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <FileConstants.au3>
#include <GUIEdit.au3>
#include "assets\libs\BorderLessWinUDF.au3"

AutoItSetOption("GUIOnEventMode", 1) ;Events are better than GUI message loops
DirCreate(@ScriptDir & "\assets")
DirCreate(@ScriptDir & "\assets\icons")
FileInstall(".\assets\icons\OpenFile.ico", @ScriptDir & "\assets\icons\OpenFile.ico")

Global Const $Program_Title = "PPMIt" ;Program title
Global Const $Program_Build = 1 ;Program build number

Global $hFlipnote = Null

$GUI_Main = GUICreate($Program_Title & " - Build " & $Program_Build, 340, 210, ((@DesktopWidth / 2) - 170), ((@DesktopHeight / 2) - 105), BitOR($WS_POPUP, $WS_SIZEBOX, $WS_MINIMIZEBOX, $WS_MAXIMIZEBOX))
_GUI_EnableDragAndResize($GUI_Main, 340, 210, 340, 210, False)
GUISetBkColor(0x1C1C1C, $GUI_Main)
$GUI_Title = GUICtrlCreateLabel($Program_Title & " - Build " & $Program_Build, 3, 3, 334, 16, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetResizing($GUI_Title, $GUI_DOCKTOP + $GUI_DOCKHEIGHT)
GUICtrlSetFont($GUI_Title, 9, 0, 0, "Segoe UI")
GUICtrlSetColor($GUI_Title, 0xFAFAFA)
$GUI_File = GUICtrlCreateLabel("File: Null", 3, 17, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_AnimationDataSize = GUICtrlCreateLabel("Animation Data Size: Null", 3, 31, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_AudioDataSize = GUICtrlCreateLabel("Audio Data Size: Null", 3, 45, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_FrameCount = GUICtrlCreateLabel("Frame Count: Null", 3, 59, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_LockStatus = GUICtrlCreateLabel("Lock Status: Null", 3, 73, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_PreviewFrameNumber = GUICtrlCreateLabel("Preview Frame Number: Null", 3, 87, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_OriginalAuthor = GUICtrlCreateLabel("Original Author: Null", 3, 101, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_LastEditedAuthor = GUICtrlCreateLabel("Last Edited Author: Null", 3, 116, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_Username = GUICtrlCreateLabel("Username: Null", 3, 129, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_OriginalAuthorID = GUICtrlCreateLabel("Original Author ID: Null", 3, 143, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_LastEditedAuthorID = GUICtrlCreateLabel("Last Edited Author ID: Null", 3, 157, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_PreviousEditingAuthorID = GUICtrlCreateLabel("Previous Editing Author ID: Null", 3, 171, 334, 16, $SS_LEFTNOWORDWRAP)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT)
GUICtrlSetFont(-1, 9, 0, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFAFAFA)
$GUI_OpenFile = GUICtrlCreateIcon(@ScriptDir & "\assets\icons\OpenFile.ico", -1, 3, 187, 16, 16)
GUICtrlSetResizing($GUI_OpenFile, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlSetOnEvent($GUI_OpenFile, "FlipnoteOpen")
GUISetState(@SW_SHOW)

If @error Then ConsoleWrite(@error & @CRLF)

While 1
	Sleep(0)
WEnd

; #FUNCTION# ====================================================================================================================
; Name...........: FlipnoteOpen
; Description ...: Opens a flipnote animation file for usage throughout the script
; Syntax.........: FlipnoteOpen ( ByRef $hFlipnote )
; Parameters ....: $hFlipnote   - A handle to a previously opened flipnote file
;									If a handle is not specified, a file open dialog will open requiring *.ppm and
;									ensures that the flipnote is opened in binary mode
; Return values .: Success      - A handle to the flipnote file
;                  Failure      - False
;                                 Error codes:
;                                          1 - File selection failed
;                                          2 - File is empty or does not exist
;                                          3 - (If a handle was passed to the function) file was not opened in binary mode
;                                          4 - Flipnote magic was not found
; Author ........: Joshua "JoshuaDoes" Wickings
; ===============================================================================================================================
Func FlipnoteOpen()
	$hFlipnote = FileOpenDialog("Open a Flipnote Studio (DSi) animation...", @ScriptDir, "Flipnote (*.ppm)", 0x16)
	If @error Then Return SetError(1, 0, False) ;File selection failed

	If Not FileRead($hFlipnote) Then
		FlipnoteClose($hFlipnote)
		$hFlipnote = Null
		FlipnoteOpen()
		Return SetError(2, 0, False) ;File is empty or does not exist
	EndIf

	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		$hFlipnote = Null
		Return SetError(3, 0, False) ;File was not opened in binary mode
	EndIf

	$dMagic = BinaryReadFromOffset($bFlipnote, 0x00, 4, True)
	If Not $dMagic = 0x50415241 Then
		FileClose($hFlipnote)
		$hFlipnote = Null
		Return SetError(4, 0, False) ;Flipnote magic was not found
	EndIf

	GUICtrlSetData($GUI_File, "File: " & $hFlipnote)
	GUICtrlSetData($GUI_AnimationDataSize, "Animation Data Size: " & Flipnote_GetAnimationDataSize($hFlipnote, True))
	GUICtrlSetData($GUI_AudioDataSize, "Audio Data Size: " & Flipnote_GetAudioDataSize($hFlipnote, True))
	GUICtrlSetData($GUI_FrameCount, "Frame Count: " & Flipnote_GetFrameCount($hFlipnote, True))
	GUICtrlSetData($GUI_LastEditedAuthor, "Last Edited Author: " & Flipnote_GetLastEditedAuthor($hFlipnote))
	GUICtrlSetData($GUI_LastEditedAuthorID, "Last Edited Author ID: " & Flipnote_GetLastEditedAuthorID($hFlipnote, True))
	GUICtrlSetData($GUI_LockStatus, "Lock Status: " & Flipnote_GetLockStatus($hFlipnote))
	GUICtrlSetData($GUI_OriginalAuthor, "Original Author: " & Flipnote_GetOriginalAuthor($hFlipnote))
	GUICtrlSetData($GUI_OriginalAuthorID, "Original Author ID: " & Flipnote_GetOriginalAuthorID($hFlipnote, True))
	GUICtrlSetData($GUI_PreviewFrameNumber, "Preview Frame Number: " & Flipnote_GetPreviewFrameNumber($hFlipnote))
	GUICtrlSetData($GUI_PreviousEditingAuthorID, "Previous Editing Author ID: " & Flipnote_GetPreviousEditingAuthorID($hFlipnote, True))
	GUICtrlSetData($GUI_Username, "Username: " & Flipnote_GetUsername($hFlipnote))

	FlipnoteClose($hFlipnote)

	Return SetError(0, 0, $hFlipnote)
EndFunc
Func Flipnote_GetAnimationDataSize($hFlipnote, $bReturnInt)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x04, 4, True)
	If $bReturnInt Then
		$iRet = Int($dRet)
		Return SetError(0, 1, $iRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func Flipnote_GetAudioDataSize($hFlipnote, $bReturnInt = False)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x08, 4, True)
	If $bReturnInt Then
		$iRet = Int($dRet)
		Return SetError(0, 1, $iRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func Flipnote_GetFrameCount($hFlipnote, $bReturnInt = False)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x0C, 2, True)
	ConsoleWrite($dRet & "|" & Int($dRet) & "|" & Dec($dRet) & "|" & Int(Dec($dRet)) & Asc(Dec($dRet)) & @CRLF)
	If $bReturnInt Then
		$iRet = Int($dRet) + 1
		Return SetError(0, 1, $iRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func Flipnote_GetLockStatus($hFlipnote)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x10, 2, True)
	If $dRet = 0x00 Then
		Return SetError(0, 0, False)
	ElseIf $dRet = 0x01 Then
		Return SetError(0, 0, True)
	EndIf
EndFunc
Func Flipnote_GetPreviewFrameNumber($hFlipnote)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x12, 2, True)
	$iRet = Int($dRet) + 1
	Return SetError(0, 0, $iRet)
EndFunc
Func Flipnote_GetOriginalAuthor($hFlipnote)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x14, 22, True)
	$dRet = BinaryStripZeroes($dRet)
	$sRet = BinaryToString($dRet)
	Return SetError(0, 0, $sRet)
EndFunc
Func Flipnote_GetLastEditedAuthor($hFlipnote)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x2A, 22, True)
	$dRet = BinaryStripZeroes($dRet)
	$sRet = BinaryToString($dRet)
	Return SetError(0, 0, $sRet)
EndFunc
Func Flipnote_GetUsername($hFlipnote)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x40, 22, True)
	$dRet = BinaryStripZeroes($dRet)
	$sRet = BinaryToString($dRet)
	Return SetError(0, 0, $sRet)
EndFunc
Func Flipnote_GetOriginalAuthorID($hFlipnote, $bReturnStr = False)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x56, 8, True)
	If $bReturnStr Then
		$sRet = String($dRet)
		$sRet = StringTrimLeft($sRet, 2) ;"0x"
		Return SetError(0, 0, $sRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func Flipnote_GetLastEditedAuthorID($hFlipnote, $bReturnStr = False)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x5E, 8, True)
	If $bReturnStr Then
		$sRet = String($dRet)
		$sRet = StringTrimLeft($sRet, 2) ;"0x"
		Return SetError(0, 0, $sRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func Flipnote_GetPreviousEditingAuthorID($hFlipnote, $bReturnStr = False)
	$bFlipnote = FileRead($hFlipnote)
	If Not IsBinary($bFlipnote) Then
		FileClose($hFlipnote)
		Return SetError(1, 0, False) ;There was an error getting the flipnote data
	EndIf

	$dRet = BinaryReadFromOffset($bFlipnote, 0x8A, 8, True)
	If $bReturnStr Then
		$sRet = String($dRet)
		$sRet = StringTrimLeft($sRet, 2) ;"0x"
		Return SetError(0, 0, $sRet)
	Else
		Return SetError(0, 0, $dRet)
	EndIf
EndFunc
Func FlipnoteClose($hFlipnote)
	FileClose($hFlipnote)
EndFunc

Func BinaryReadFromOffset(ByRef $dBytes, $dOffset, $dLength, $bPeek = False)
	Local $dRet = BinaryMid($dBytes, $dOffset + 1, Dec(Hex($dLength)))
	If Not $bPeek Then $dBytes = BinaryMid($dBytes, Dec(Hex($dLength)) + 1)
	Return $dRet
EndFunc ;Forked from Kealper's "BinaryRead" function to support offsets and hex parameters
Func BinaryStripZeroes(ByRef $dBytes, $bReplaceRef = False)
	$sTemp = String($dBytes)
	$sTemp = StringReplace($sTemp, "00", "")
	$dRet = Binary($sTemp)
	If $bReplaceRef Then $dBytes = $dRet
	Return $dRet
EndFunc