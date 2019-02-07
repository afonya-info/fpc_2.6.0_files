uses crt,graph;
const
x1=0;{начало и конец графика в пикселах без коэффициентов}
x2=3;
var
a,x,dx,y1,y:real;
mx,my,x0,y0,grD,px,py1,grM,i,k1,k2:integer;
s,s1:string;
begin
clrscr;
writeln('Grafik functii 1/cos^2(x)');
writeln('      oblast opredelenia x<>pi/2');
writeln;
grD:=detect;
initgraph(grD,GrM,'');
X0:=10;{начало координат}
Y0:=470;
mx:=200; my:=10; {коэффициенты по осям подогнаны под реальный график}
SetBkColor(7); {цвет фона}
setlinestyle(0,0,1);{сплошная линия}
SetColor(1);{цвет линий осей}
line(x0,y0,640,y0); {ось Х}
line(x0,y0,x0,0); {ось У}
setlinestyle(1,0,0);  {пунктирная линия}
Setcolor(9);  {цвет сетки}
for i:=1 to 30 do   {максимальное количество засечек в одну сторону}
   begin
    line(x0,y0-i*70,630,y0-i*70);     {засечки на оси У}
    line(x0+i*20,0,x0+i*20,y0); {засечки на оси Х}
    {подпись оси У}
    str(i*15,s);
    outtextXY(x0+5,y0-i*70,s);{соответственно засечкам}
    {подпись оси Х}
    k1:=i div 10;
    str(k1,s);
    k2:=i mod 10;
    str(k2,s1);
    s:=s+'.'+s1;
    if i mod 2=0 then outtextXY(x0+i*20,y0-10,s);
    outtextXY(x0+5,y0-10,'0');
   end;
{подписи концов осей}
outtextXY(getmaxX-10,y0-10,'X');
outtextXY(x0+10,5, 'Y');
dx:=0.001;
x:=x1;
while x<=x2 do
   begin
     px:=x0+round(x*mx); {изменение по оси Х}
     y1:=1/sqr(cos(x)); {график}
     py1:=y0-round(y1);
     putpixel(px,py1,12);
     x:=x+dx; {наращиваем х}
   end;
readln;
closegraph
end.