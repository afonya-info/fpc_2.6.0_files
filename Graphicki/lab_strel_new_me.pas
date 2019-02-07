program art; {$D+,L+}

uses graph,wincrt,crt;

const
	lxm = -1000;
	rxm = 1000;

type 
	mas = array[lxm..rxm] of real;
	mmsc = record
		x:mas;
		y:mas;
	end;
	
var 
	mx,my:mas;// вспомогательный массив для масшатбов
	mm:mmsc;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
  maxm:string;
	
procedure gra(scx,scy,scmx,scmy: real);
	var dx,xgn,xgm,x1,y1,fxgn, fxgm,fxgm2 : real;
	begin
		xgn:=-100;
		dx:=0.01;
		setcolor(red);
		
		while xgn<=100 do
			begin
				xgm:=xgn*scx*scmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
				x:=ox + trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*scy*scmy;
				y:=oy - trunc(fxgn);
				putpixel(x,y,red);
				moveto(x,y);
				xgn:=xgn+dx;
				xgm:=xgn*scx*scmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
				x:=ox + trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*scy*scmy;
				y:=oy - trunc(fxgn);
				lineto(x,y);
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
	
	mx[0]:=1;
	my[0]:=1;
	mm.x[0]:=1;
	mm.y[0]:=1;
	
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
		
	j:=1.5;	
	for i:= 1 to rxm do
		begin
			mm.x[i]:=1/j;
			j:=j+0.12;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mm.x[i]:=j;
			j:=j+0.12;
		end;

	j:=1.5;
	for i:= 1 to rxm do//
		begin
			mm.y[i]:=j;
			j:=j+0.12;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mm.y[i]:=1/j;
			j:=j+0.12;
		end;
		
	setcolor(2);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);
	
	ix:=-20;// масштаб с индексом 5 mx[5] = 1/10
	iy:=-20;
	im:=0;
	gra(mx[ix],my[iy],mm.x[im],mm.y[im]); // выведет график 
	repeat 
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin 
									dec(ix);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
								end;
					#77:	begin
									inc(ix);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
								end;
					#72:	begin
									dec(iy);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
								end;
					#80:	begin
									inc(iy);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);									
								end;
				end;
			end
		else
			begin
				case c of 
					#45:	begin
									dec(im);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
								end;
					#43:	begin
									inc(im);
									osi;
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);									
								end;
				end;
			end;
	until c=#27;
		
  closegraph;
end.
