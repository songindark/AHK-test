; 按住W，就CTRL+左键
W::
Send, {LControl Down}
Loop
{
GetKeyState, state, W, P;
if state = U 
{ 
Send, {LControl Up} 
Break 
}
Else
Send {LButton} 
Sleep,10
}
Return
