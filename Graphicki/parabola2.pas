program art; {$D+,L+}

uses graph,wincrt,crt;

var gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol:integer;
  h,xgn,xgm, m, x1,y1,fxgn, fxgm,fxgm2 : real;
	c: char;
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
  d:=2;
  {i:=a;
  while a<b do
    begin
      x:=a1*d;
      y:= x*x div 100;

    end;}
  for i:= a to b do
    begin
    x:=a1 div d;
    y:= x*x div 100;
    moveto(i,y);
    inc(a1);
    y2:=x*x div 100;
    lineto(i+1,y2);
    putpixel(i,y,3)

    end;
  {setcolor(red);
  rectangle(ox-300,oy-300,ox+300,oy+300);
  line(ox-300,oy-300,ox+300,oy+300);
  setfillstyle(3,red);
  floodfill(ox+5,oy+5,red);
  str(getmaxmode,maxm);
  outtextxy(ox,oy+50,maxm);}
	setcolor(2);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);
	kol:=1;
  h:=0.001;
  xgn:=-100;
	m:=120;
  while xgn<=100 do
    begin
      xgm:=xgn;
			x:=ox + trunc(xgm);
			fxgn := xgn*xgn;
			fxgm2:= 4 * xgm * xgm * xgm - 25 * xgm * xgm + 491 * xgm - 2134;
      y:=oy - trunc(fxgn);
      putpixel(x,y,red);
			{x:=ox + trunc(xgm);
			y:=oy - trunc(fxgm/100);
			y:=oy - trunc(fxgm2/100);
			putpixel(x,y,green);}
      xgn:=xgn+h;
    end;

		
		
	circle(ox div 2,oy div 2, 30);

	
  while wincrt.readkey<>#27 do
    begin
     { setfillstyle(3,3);
      floodfill(2,2,10);}
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