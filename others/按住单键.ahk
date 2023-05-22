SetKeyDelay, 50
#SingleInstance force
#NoEnv 
#Warn
#Persistent
global v_switch := 1
q::
    ; 双暂停开关
    v_switch := 1-v_switch
    if v_switch = 1
        {
            send,{l Up}
        }

~h::l