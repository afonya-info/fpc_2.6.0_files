Program gmodeinfo;
Uses ptcGraph, SysUtils;

Var
    ModeInfo: PModeInfo; // Сюда будет заносится информация о видеорежимах
    Rez: String;

Begin
    ModeInfo:=QueryAdapterInfo;
    If ModeInfo=NIL Then
        WriteLn('Не удалось получить информацию у видеоадаптера...')
    Else
    Begin
        WriteLn(   'ь¤а ©ўҐа  ', ' ьаҐ¦Ё¬  ', ' а §аҐиҐ­ЁҐ ', 'жўҐв®ў ');
        WriteLn('------------------------------------------------------------');
        While ModeInfo^.Next<>NIL Do
        Begin
            Write(ModeInfo^.DriverNumber:10);
            Write(ModeInfo^.ModeNumber:9);
            // Write(' "'+ModeInfo^.ModeName+'"':22);
            Rez:=IntToStr(ModeInfo^.MaxX+1)+'x'+IntToStr(ModeInfo^.MaxY+1);
            Write(Rez:11);
            WriteLn(ModeInfo^.MaxColor:7);
            ModeInfo:=ModeInfo^.Next;
        End;
        ReadLn;
    End;
End.
