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

#SuspendExempt

F10:: {
    Suspend()
    TrayTip('Arknights: ' (A_IsSuspended ? 'Pause' : 'Run'))
}

F12:: ExitApp()

#SuspendExempt False

; 划火柴
~RButton:: {
    SendInput("{F down}")
    SendInput("{F up}")

    SendInput("{LButton down}")
    MouseMove(0, -30, 0, "R")

    Sleep(30)

    SendInput("{Escape down}")
    SendInput("{Escape up}")

    KeyWait("RButton")
    SendInput("{LButton up}")
}

; 开技能
~W:: {
    SendInput("{LButton down}")
    SendInput("{LButton up}")

    Sleep(30)

    SendInput("{Escape down}")
    SendInput("{Escape up}")
}
