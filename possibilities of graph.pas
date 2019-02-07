Program gmodeinfo;
Uses ptcGraph, SysUtils;

Var
    ModeInfo: PModeInfo; // ���� ����� ��������� ���������� � ������������
    Rez: String;

Begin
    ModeInfo:=QueryAdapterInfo;
    If ModeInfo=NIL Then
        WriteLn('�� ������� �������� ���������� � �������������...')
    Else
    Begin
        WriteLn(   '��ࠩ��� ', ' �०��� ', ' ࠧ�襭�� ', '梥⮢ ');
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
