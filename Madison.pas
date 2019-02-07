Program Washington;{$D+,L+}
uses graph,wincrt,crt;
const root=-10.8333;
      NORM=LightGray;
      SEL=Green;
var i,punkt,steps,x,y,d: integer;
    rslt, anlrslt, x1,x2,c: real;
    ch,rk: char;
    f: boolean;
    s: string;
    menu: array[1..4] of string[40];

function clc(x:real):real;
begin
 clc:= -4*x*x*x-22*x*x+176*x-597;
end;

function prim(x:real):real;
begin
 prim:= -1*x*x*x*x-22/3*x*x*x+88*x*x-597*x;
end;

function stlb(a,b:real; n:integer):real;
var i:integer;
    h,x,res:real;
begin
 h:=(b-a)/n;
 x:=a+h/2;
 res:=0;
 for i:= 1 to n do
  begin
   res:=res+clc(x);
   x:=x+h;
  end;
 stlb:=h*res;
end;

function anlsol(a,b: real):real;
begin
anlsol:= abs(prim(a)-prim(b));
end;

function check:real;
var x:real;
begin
repeat
readln(x);
if (x>100000) or (x<-100000) then
writeln('Error. Enter a valid value.'#13#10);
until (x<=100000) and (x>=-100000);
check:=x;
end;

procedure strelka;
begin
GoToXY(x,y+punkt-1);
write(menu[punkt]);
punkt:=punkt+d;
TextAttr:=SEL;
GoToXY(x,y+punkt-1);
write(menu[punkt]);
TextAttr:=NORM;
end;

Procedure Chart(DeltaX, DeltaY : real);
const
 StrelkaX=5;
 StrelkaY=20;
var
  X, Y,dX,K,I: real;
  I1,S1,M: integer;
  Flag,Flag2: Boolean;
  S: String;
begin
  ClearDevice();
  SetColor(white);
  SetLineStyle(0,0,3);
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2),GetMaxY);
  Line(0,Round(GetMaxY/2),GetMaxX,Round(GetMaxY/2));
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2)-StrelkaX,StrelkaY);
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2)+StrelkaX,StrelkaY);
  Line(GetMaxX,Round(GetMaxY/2),GetMaxX-StrelkaY,Round(GetMaxY/2)-StrelkaX);
  Line(GetMaxX,Round(GetMaxY/2),GetMaxX-StrelkaY,Round(GetMaxY/2)+StrelkaX);
  outtextXY(getmaxX-20,getmaxY div 2-20,'X');
  outtextXY(getmaxX div 2+10,10, 'Y');
  
  I := DeltaX;
    while I < GetMaxX do
    begin

    if (DeltaX >= 25) or (Round(I/DeltaX) mod 10 = 0) then
    begin
    Line(GetMaxX div 2 + round(I), GetMaxY div 2, GetMaxX div 2 + round(I), GetMaxY div 2 + 5);
    Str(round(I/DeltaX), S);
    OutTextXY(GetMaxX div 2 + round(I), GetMaxY div 2 + 10, S);

    Line(GetMaxX div 2 - round(I), GetMaxY div 2, GetMaxX div 2 - round(I), GetMaxY div 2 + 5);
    Str(round(-I/DeltaX), S);
    OutTextXY(GetMaxX div 2 - round(I), GetMaxY div 2 + 10, S);
    end;

    I := I + DeltaX;
    end;

  I := DeltaY;
  while I < GetMaxY do
    begin

    if ((DeltaY >= 100) or (round(I/DeltaY) mod 100 = 0)) then
    begin
    Line(GetMaxX div 2, GetMaxY div 2 + round(I), GetMaxX div 2 + 5, GetMaxY div 2 + round(I));
    Str(round(-I/DeltaY), S);
    OutTextXY(GetMaxX div 2 + 15, GetMaxY div 2 + round(I), S);

    Line(GetMaxX div 2, GetMaxY div 2 - round(I), GetMaxX div 2 + 5, GetMaxY div 2 - round(I));
    Str(round(I/DeltaY), S);
    OutTextXY(GetMaxX div 2 + 15, GetMaxY div 2 - round(I), S);
    end;

    I := I + DeltaY;
    end;

  dX := 1/DeltaX;

  SetColor(red);
  Flag := true;

  X:=(-(GetMaxX/DeltaX)/2);
   While X < ((GetMaxX/DeltaX)/2) do
    begin

    Y:=clc(X);
    if (clc(X - dX) > (-(GetMaxY/DeltaY)/2)) and (clc(X + dX) < ((GetMaxY/DeltaY)/2)) then
       begin
         if Flag=true then
            begin
              MoveTo(Round(GetMaxX/2 + X*DeltaX), Round(GetMaxY/2 - Y*DeltaY));
              Flag := false;
            end;
         LineTo(Round(GetMaxX/2 + X*DeltaX), Round(GetMaxY/2 - Y*DeltaY));
       end
       else
       Moveto(Round(GetMaxX/2 + (X)*DeltaX),GetMaxY);
    X := X + dX;
    end;
    
  setcolor(white);
  S1:=round(DeltaX/10);
  Str(S1,S);
  if S1=0 then s:='0.5';
  OutTextXY(GetMaxX - 300, 100, 'OX: increase '+s+'x');
  S1:=round(DeltaY/0.25);
  Str(S1,S);
  if S1=0 then s:='0.5';
  OutTextXY(GetMaxX - 300, 125, 'OY: increase '+s+'x');

    if (x1<>x2) then
  begin
    SetLineStyle(1,0,1);
    Y := clc(x1)*DeltaY;
    if (Y>GetMaxY / 2) then Y:=GetMaxY / 2;
    Line(Round(GetMaxX / 2 + x1*DeltaX), 0, Round(GetMaxX / 2 + x1*DeltaX),GetMaxY);

    Y := clc(x2)*DeltaY;
    if (Y>GetMaxY / 2) then Y:=GetMaxY / 2;
    Line(Round(GetMaxX / 2 + x2*DeltaX), 0, Round(GetMaxX / 2 + x2*DeltaX), GetMaxY);

    K:=x1;
    SetLineStyle(0,0,1);
    setcolor(yellow);
    if (x1<root) and (x2<root) then
    For I1:=Round(GetMaxX / 2 + x1*DeltaX) to Round(GetMaxX / 2 + x2*DeltaX) do
      begin
       K:=K+dX;
       Y := clc(K)*DeltaY;
       if (Y>GetMaxY / 2) then Y:=GetMaxY / 2;
       Line(round(I1), Round(GetMaxY / 2), round(I1), Round(GetMaxY / 2 - Y));
      end;
          if (x1<root) and (x2>root) then
    For I1:=Round(GetMaxX / 2 + x1*DeltaX) to Round(GetMaxX / 2 + root*DeltaX) do
      begin
       K:=K+dX;
       Y := clc(K)*DeltaY;
       if (Y>GetMaxY / 2) then Y:=GetMaxY / 2;
       Line(round(I1), Round(GetMaxY / 2), round(I1), Round(GetMaxY / 2 - Y));
      end;

  end;
end;


procedure punkt1();
begin
 clrscr;
 writeln('Enter the limits of integration.'#13#10);
 write('1.Enter the lower limit of integration(from -100k to 100k): ');
 x1:=check;
 write('2.Enter the upper limit of integration(from -100k to 100k): ');
 x2:=check;
 write('3.Enter the number of rectangles(from 1 to 32k): ');
 repeat
  readln(steps);
  if (steps<1) or (steps>32000) then
   writeln('Error. Enter a valid value.'#13#10);
 until (steps>0) and (steps<=32000);
 if x1>x2 then
  begin
   c:=x1;
   x1:=x2;
   x2:=c;
  end;
  f:=true;
  writeln('Press <Enter> to continue');
  ReadKey;
end;

procedure punkt2();
var pgr:real;
begin
 clrscr;
 if f=true then
  begin
  if x1=x2 then
   writeln('Values that are entered in first paragraph coincide.'#13#10'Enter a valid values.'#13#10)
   else
   begin
   if (x1<root) and (x2<root) then
    begin
     rslt:=stlb(x1,x2,steps);
     anlrslt:=anlsol(x1,x2);
     pgr:=abs(((rslt-anlrslt)/anlrslt)*100)
    end
   else
   if (x1<root) and (x2>root) then
    begin
     rslt:=stlb(x1,root,steps);
     anlrslt:=anlsol(x1,root);
     pgr:=abs(((rslt-anlrslt)/anlrslt)*100)
    end
   else
    begin
     rslt:=0;
     anlrslt:=0;
     pgr:=0;
    end;
   writeln('Results.'#13#10);
   write('Integral calculated by method of rectangles: ',rslt:0:4,#13#10);
   write('Integral calculated by analytical method: ',anlrslt:0:4,#13#10);
   writeln('Inaccuracy: ',pgr:0:2,'%'#13#10);
  end;
  end
  else
   writeln('Enter the values in the first paragraph'#13#10);
 write('Press <Enter> to continue');
 ReadKey;
end;

procedure punkt3();
var Gd,Gm: integer;
    DeltaY,DeltaX:real;
begin
clrscr;
DetectGraph(Gd,Gm);
InitGraph(Gd,Gm,'');
DeltaX := 10;
DeltaY := 0.25;
if (x1<-150) or (x2>150) then
 begin
  closegraph;
  writeln('For correct operation of the chart, enter the values of the limits from -150 to 150'#13#10);
  writeln('Press <Enter> to continue');
  readkey;
 end 
 else
 begin 
  Chart(DeltaX,DeltaY);
   repeat
    rk := wincrt.readkey;
    if rk = #0 then rk := wincrt.readkey;
     Case rk of
       '+': if (DeltaX < 94) and (DeltaY < 3) then begin DeltaX := DeltaX * 2; DeltaY := DeltaY * 2; end;
       '-': if (DeltaX >= 10) and (DeltaY >= 0.25 ) then begin DeltaX := DeltaX/2; DeltaY := DeltaY/2; end;
       #75: if (DeltaX >= 10) then DeltaX := DeltaX/2;
       #77: if (DeltaX < 94) then DeltaX := DeltaX*2;
       #72: if (DeltaY < 3) then DeltaY := DeltaY*2;
       #80: if (DeltaY >= 0.25) then DeltaY := DeltaY/2;
     end;
    if (rk<>#13) then Chart(DeltaX,DeltaY);
   until (rk = #13);
   Closegraph();
 end;  
end;

procedure startmenu;
var i: integer;
begin
 clrscr;
 writeln('Lab N3'#13#10);
 write('Calculation of integral by the method of rectangles.'#13#10);
 write('F(x) = -4x^3 - 22x^2 + 176x-597 '#13#10);
 write('Use <up> and <down> to navigate through the menu.'#13#10);
 write('Use <Enter> to select an item.'#13#10);
 for i:= 1 to 4 do
  begin
   GoToXY(x,y+i-1);
   write(menu[i]);
  end;
 TextAttr:=SEL;
 GoToXY(x,y+punkt-1);
 write(menu[punkt]);
 TextAttr:=NORM;
end;

begin
 // setconsolecp(1251);
  ///setconsoleoutputcp(1251);
menu[1]:= '1.Entering limits';
menu[2]:= '2.Calculation of the integral';
menu[3]:= '3.Graph';
menu[4]:= 'Exit';
punkt:=1;
x:=1;
y:=8;
f:=false;
TextAttr:=NORM;
startmenu;
repeat
 ch:= ReadKey;
 if ch=#0 then
  begin
   ch:=ReadKey;
   case ch of
    #80:
     if punkt<4 then
      begin
       d:=1;
       strelka;
      end;
    #72:
     if punkt>1 then
      begin
       d:=-1;
       strelka;
      end;
   end;
  end

 else
  if ch=#13 then
   begin
    case punkt of
     1:punkt1;
     2:punkt2;
     3:punkt3;
     4:ch:=#27;
    end;
   startmenu;
   end;
 until ch=#27;
end.
