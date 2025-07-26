#SingleInstance Force
#Requires AutoHotkey v2.0

run_as_admin() {
    if (!A_IsAdmin && !InStr(DllCall("GetCommandLine", "str"), ' /restart'))
        try
            if A_IsCompiled
                Run('*RunAs "' A_ScriptFullPath '" /restart')
            else Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"')
        finally ExitApp()
    TrayTip('Script Running as Admin: ' (A_IsAdmin ? 'True' : 'False'))
}
run_as_admin()

; swap Ctrl and CapsLock
CapsLock::Ctrl
Ctrl::CapsLock

; auto click
~XButton2::
{
    while GetKeyState("XButton2", "P") {
        SendInput "{LButton down}"
        SendInput "{LButton up}"
        Sleep 50
    }
}
