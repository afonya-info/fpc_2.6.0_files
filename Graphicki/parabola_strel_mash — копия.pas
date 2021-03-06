program art; {$D+,L+}

uses graph,wincrt,crt;

const
	lxm = -1000;
	rxm = 1000;

type 
	mas = array[lxm..rxm] of real;
	
var 
	mx,my,mm:mas;// ��������������� ������ ��� ���������
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
  maxm:string;
	
procedure gra(scx,scy: real);
	var dx,xgn,xgm,x1,y1,fxgn, fxgm,fxgm2 : real;
	begin
		xgn:=-100;
		dx:=0.01;
		
		while xgn<=100 do
			begin
				xgm:=xgn*scx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
				x:=ox + trunc(xgm);
				fxgn := scy*xgn*xgn;
				y:=oy - trunc(fxgn);
				putpixel(x,y,red);
				
				{x:=ox + trunc(xgm);
				y:=oy - trunc(fxgm/100);
				y:=oy - trunc(fxgm2/100);
				putpixel(x,y,green);}
				xgn:=xgn+dx;
    end;
	end;
	
procedure osi;
	begin
		cleardevice;
		setcolor(2);
		line(0,oy,getmaxx,oy);
		line(ox,0,ox,getmaxy);
	end;
	

begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
  //setcolor(3);
	mx[0]:=1;
	my[0]:=1;
	mm[0]:=1;
	j:=1.5;
	for i:= 1 to rxm do
		begin
			mx[i]:=1/j;
			j:=j+0.5;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mx[i]:=j;
			j:=j+0.5;
		end;
		
	j:=1.5;
	for i:= 1 to rxm do//
		begin
			my[i]:=j;
			j:=j+0.5;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			my[i]:=1/j;
			j:=j+0.5;
		end;
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
	
	ix:=-20;// ������� � �������� 5 mx[5] = 1/10
	iy:=0;
	im:=0;
	gra(mx[ix],my[iy]); // ������� ������ 
	repeat 
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin 
									dec(ix);
									osi;
									gra(mx[ix],my[iy]);
								end;
					#77:	begin
									inc(ix);
									osi;
									gra(mx[ix],my[iy]);
								end;
					#72:	begin
									dec(iy);
									osi;
									gra(mx[ix],my[iy]);
								end;
					#80:	begin
									inc(iy);
									osi;
									gra(mx[ix],my[iy]);									
								end;
				end;
			end;
	until c=#27;
		
		
	circle(ox div 2,oy div 2, 30);
	
	
  while wincrt.readkey<>#27 do
    begin
     { setfillstyle(3,3);
      floodfill(2,2,10);}
      setcolor(col);
      circle(ox,oy,33+ch);
      ch:=ch+4;
      //writeln(col);
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
  closegraph;
end.
