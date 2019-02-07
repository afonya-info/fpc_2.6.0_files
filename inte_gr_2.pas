Uses Graph,wincrt;
Var Driver,Mode: Integer;
X: Real; Xg,Yg,I: Integer; 
Begin {Инициализация графического режима} 
Driver:=Detect;
InitGraph(Driver,Mode,'C:\TP\BGI'); 
SetColor(White);{белый цвет линий} 
SetBkColor(DarkGray);{задан темно-серый цвет фона} 
Line(10,170,400,170); {строит ось X}
Line(10,20,10,320); {строит ось Y}
{Построение графика функции желтыми точками}
x:=0;
For I:=0 To 390 Do
Begin 
Xg:=10+Round(195/(Pi)*(X));
Yg:=170-Round(130*cos(X));
PutPixel(Xg,Yg,Yellow); 
X:=X+Pi/195
End;
{Разметка осей, запись функции}
OutTextXY(15,30,'Y');
OutTextXY(405,170,'X');
OutTextXY(190,40,'Y=COS(X)');
wincrt.Readkey; {задержка экрана} 
CloseGraph; {выход из графики} 
End.