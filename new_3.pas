uses graph;
function F(x:real):real;
begin
F:=ln(sin(x)+cos(x));
end;
var xn,xk,mx,my,dx:real;
    x:real;
    x0,y0,i,c:integer;
    s:string;
begin
x0:=0;
initgraph(x0,y0,'');
xn:=-0;xk:=3*pi;{интервал по Х}
x0:=40;
mx:=(getmaxX-x0-30)/xk;{масштаб по Х}
y0:=60;
my:=(getmaxY-y0-30)/xk;
line(0,y0,getmaxX,y0);{оси}
line(x0,0,X0,getmaxY);
for i:=1 to trunc(xk)+1 do{максимальное количество засечек в одну сторону}
  begin
    line(x0-3,y0-round(i*my),x0+3,y0-round(i*my));{засечки на оси У}
    line(x0-3,y0+round(i*my),x0+3,y0+round(i*my));
    {подпись оси У}
    str(i,s);
    outtextXY(x0-20,y0-round(i*my),s);{соответственно засечкам}
    outtextXY(x0-25,y0+round(i*my)-5,'-'+s);
    line(x0+round(i*mx),y0-3,x0+round(i*mx),y0+3); {засечки на оси Х}
    line(x0-round(i*mx),y0-3,x0-round(i*mx),y0+3);
    {подпись оси Х}
    str(i,s);
    outtextXY(x0+round(i*mx),y0+10,s);
    outtextXY(x0-round(i*mx),y0+10,'-'+s);
  end;
{центр}
outtextXY(x0+5,y0+10,'0');
{подписи концов осей}
outtextXY(getmaxX-10,y0-10,'X');
outtextXY(x0+5,10, 'Y');
{график}
x:=xn;
dx:=0.0001;
while x<=xk do
 begin
  if sin(x)+cos(x)>0 then
  putpixel(x0+round(x*mx),y0-round(F(x)*my),12);
  x:=x+dx;
 end;
{название}
setcolor(12);
outtextXY(getmaxX div 2-150,5,'Grafik functii y=ln(sinx+cosx)');
outtextXY(getmaxX div 2-110,25,'na intervale [0;3pi]');
readln
end.