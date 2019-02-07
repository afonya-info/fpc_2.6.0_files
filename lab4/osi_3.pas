uses crt,graph,wincrt;

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
	mx,my:mas;
	mm:mmsc;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
  maxm:string;
procedure osi(ntx,nty,ntmx,ntmy:real);// послыать занчение масштаба
	var iosi,xsrt,ysrt,dox,doy,shlen,shy,stx,sty,ntxint,ntmxint: integer;
			xgn,fxgn:real;
			tx:string;
	begin
		cleardevice;
		setcolor(2);
		line(0,oy,getmaxx,oy);
		line(ox,0,ox,getmaxy);
		
		shlen:=10;//длина штриха должна делиться на 2
		shy:=oy - shlen div 2 ;// начальная точка штриха по у
		shx:= ox - shlen div2;
		dox:=20;
		xsrt:=ox + dox;
		setusercharsize(4,50,150,1000);
		settextstyle(1,1,0);
    setusercharsize(4,50,150,1000); 
		
		ntxint:=trunc(ntx);
		ntmxint:=trunc(ntmx);

		while xsrt< getmaxx do
			begin
				moveto(xsrt,shy);
				linerel(0,shlen);
				str((xsrt-ox)*ntx*ntmx:20:3,tx);
				stx:=xsrt+1;
				settextjustify(1,2);
				sty:=shy+shlen+2;
				outtextxy(stx,sty,tx);
				xsrt:=xsrt + dox;
				tx:='';
			end;
			
		xgn:=0.01;
		for iosi:= 1 to 2000 do
			begin
				xgm:=xgn*ntx*ntmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
				xsrt:=ox - trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*nty*ntmy;
				ysrt:=oy - trunc(fxgn);
				
				if (trunc(frac(fxgn)*10) = 0) and (trunc(frac(fxgn)*100) = 0)  then // число храниться не точно, такой костыль 
					begin
						moveto(shx,ysrt);
						linerel(0,shlen);
						
						{str(trunc(xgn),tx);
						stx:=xsrt+1;
						sty:=shy+shlen+2;
						
						settextjustify(1,2);
						settextstyle(1,1,0);
						tx:='-'+tx;
						outtextxy(stx,sty,tx);}
	
					end;
				xgn:=xgn + dx;
			end;
		
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
		
	ix:=50;
	iy:=0;
	im:=20;	
		
	osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
	wincrt.readkey;
end.