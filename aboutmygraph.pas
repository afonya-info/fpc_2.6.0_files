Program getgmode;
Uses Graph;

Var
    Driver, Mode: SmallInt;

Begin
    DetectGraph(Driver, Mode);
    WriteLn(' �ࠩ���', Driver, ', ����������� �����: ', Mode);
    ReadLn;
    InitGraph(Driver, Mode, '');
    WriteLn('ࠧ�襭��', GetMaxX+1,'x',GetMaxY+1, ', ������: ', GetMaxColor+1);
    ReadLn;
    CloseGraph;
End.
