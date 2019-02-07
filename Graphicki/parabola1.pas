program art; {$D+,L+}

uses graph,wincrt,crt;

var gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d:integer;
  maxm:string;

begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
  //setcolor(3);
  ch:=1;
  col:=1;
  setbkcolor(0);
  setfillstyle(1,12);
  bar3d(ox-100,oy-100,ox-40,oy-40,20,true);
  circle(ox,oy,33);
  maxm:='';
  a:= (getmaxx div 2 ) - 200;
  b:=(getmaxx div 2) +200;
  a1:=-200;
  a2:=200;
  setcolor(3);
  {d:=3;
  i:=a;
  while a<b do
    begin
      x:=a1*d;
      y:= x*x div 100;

    end;}
  for i:= a to b do
    begin

    y:= a1*a1 div 100;
    moveto(i,y);
    inc(a1);
    y2:=a1*a1 div 100;
    lineto(i+1,y2);
    putpixel(i,y,3)

    end;
  str(getmaxmode,maxm);
  outtextxy(ox,oy+50,maxm);
  while wincrt.readkey<>#27 do
    begin
      setcolor(col);
      circle(ox,oy,33+ch);
      ch:=ch+4;
      writeln(col);
      inc(col);
      if wincrt.readkey = #32 then
        Begin
          setviewport(ox-50,oy-50,ox+50,oy+50,true);
          setbkcolor(0);
          setfillstyle(1,0);
          clearviewport;;;;
          bar(0,0,getmaxx,getmaxy);
          ch:=1;
          col:=1;

  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
        end;
    end;
  restorecrtmode;
  writeln('Max mode = ',maxm);
  closegraph;
end.
