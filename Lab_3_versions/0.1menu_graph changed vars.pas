﻿program art;

uses wincrt,graph,crt;

const
  c = 5;
  push = 112;
  unpush = 15;
  backcol = 7;
  root = 4.62919;

type
  armen = array[1..c] of string[90];

var
  menu: armen;
  sym: char; poz, x, y: integer;
  a, b, step, n, w, f, l, r, t, s, snl, d, absd, plos, zn: real;
  rk: char;

function fun(funx: real): real;
begin
  fun := 4 * funx * funx * funx - 25 * funx * funx + 491 * funx - 2134;
end;

function perv(fx: real): real;
begin
  perv := fx * fx * fx * fx - (25 / 3) * fx * fx * fx + 245.5 * fx * fx - 2134 * fx;
end;

procedure enterborders;
begin
  clrscr;
  writeln('Please, enter boarders of integration:');
  write('low boarder = ');
  readln(a);
  write('high boarder = ');
  readln(b);
  write('amount of splits = ');
  readln(step);
  while step < 1 do
  begin
    writeln('amount of splits must be natural number, try again');
    write('amount of splits = ');
    readln(step);
  end;
  if a > b then begin
    t := a;
    a := b;
    b := t;
  end;
  writeln('press any key');
  readln;
end;

function integ(var w: real): real;
var
  sum: real;
begin
  w := w + n;
  sum := 0;
  while (fun(w) > 0) and (w <= b) do
  begin
    sum := sum + fun(w) * n;
    w := w + n;
  end;
  integ := sum;
end;

procedure inaccuracy;
begin
  clrscr;
  d := abs(snl - s);
  if snl <> 0 then
    absd := d / snl * 100
  else
    absd := 0;
  writeln('relati2ve inaccuracy = ', d:5:5);
  writeln('absolute inaccuracy = ', absd:5:5, '%');
  readln;
end;

procedure outmenu;
var
  i: integer;
begin
  clrscr;
  for i := 1 to c do
  begin
    gotoxy(x, y + i - 1);
    write(menu[i]);
  end;
  textattr := push;
  gotoxy(x, y + poz - 1);
  write(menu[poz]);
  textattr := unpush;
end;

procedure outsquare;
begin
  writeln('square calculated by software:', s:5:5, ' square units');
  writeln('square, calculated by analytic method:', snl:5:5, ' square units');
  writeln('press any key');
  readln;
end;

procedure calsquare;
begin
  clrscr;
  s := 0;
  n := abs(b - a) / step;
  w := a + n / 2;
  while w < b do
  begin
    if fun(w) > 0 then
    begin
      zn := fun(w) * n;
      plos := integ(w);
      s := s + plos + zn;
    end;
    w := w + n;
  end;
  if a < root then
    if b < root then
      snl := 0
    else
      snl := perv(b) - perv(root)
  else
    snl := perv(b) - perv(a);
  outsquare;
end;

procedure plotting;
var
  gd, gm, maxx, maxy: integer;n1: real;
  XRight, XLeft, YRight, YLeft, x0, y0: integer;dx, dy, xx, yy, fmin, fmax, mx, my, a3, b3, a1, b1, a2, b2: real;
  rk: char;  flag: boolean;
  s: string;
   
  procedure Otrez;
  var
    xr, yr, ii, nnn: longint;num: real;
  begin
    setcolor(14);
    settextstyle(1, 0, 1);
    nnn := round((b1 - a1) / dx) + 1;
    ii := 1;
    for ii := 1 to nnn do
    begin
      Num := a1 + (ii - 1) * dx;
      xr := Xleft + trunc(mx * (num - a1));
      line(xr, y0 - 2, xr, y0 + 2);
      str(num:0:0, s);
      if abs(num) > 1E-15 then
        OutTextXY(xr - TextWidth(s) div 2, y0 + 10, s);
    end;
    nnn := round((fmax - fmin) / dy) + 1;
    ii := 1;
    for ii := 1 to nnn do
    begin
      Num := Fmin + (ii - 1) * dy;
      yr := yright - trunc(my * (num - fmin));
      line(x0 - 2, yr, x0 + 2, yr);
      str(num:0:0, s);
      if abs(num) > 1E-15 then
        OutTextXY(x0 + 7, yr - TextHeight(s) div 2 + 4, s)
    end;
    Outtextxy(x0 - 10, y0 + 10, '0');
  end;
  
  procedure Ubu;
  var
    xxx, yyy: int64;yc, cc: real;
  begin
    cc := a1;
    
    while cc <= b1 do
    begin
      yc := fun(cc);
      xxx := x0 + round(mx * cc);
      yyy := y0 - round(my * yc);
      if (yyy <= yright) and (yyy >= yleft) then putpixel(xxx, yyy, 14);
      cc := cc + 0.01;
    end;
  end;
  
  procedure Infa;
  var
    xx00, yy00: integer;
  begin
    setcolor(1);
    Settextstyle(4, 2, 1);
    s := 'Function =-2*x^3-1*x^2+51*x-714';
    OuttextXy(1000, 40, S);
    xx00 := Getmaxx div 2;
    yy00 := getmaxy div 2;
    setcolor(10);
    settextstyle(2, 2, 2);
    Outtextxy(1100, 100, 'SCALING');
    settextstyle(1, 3, 2);
    Outtextxy(920, 150, 'ZOOM +    = + ');
    Outtextxy(1150, 150, 'ZOOM -    = - ');
    Outtextxy(920, 180, 'ZOOM Ox + = 9 ');
    Outtextxy(1150, 180, 'ZOOM Ox - = 6 ');
    Outtextxy(920, 210, 'ZOOM Oy + = 7 ');
    Outtextxy(1150, 210, 'ZOOM Oy - = 4 ');
    Outtextxy(1000, 240, 'NORM SCALING    = 0 ');
    setcolor(1);
    settextstyle(2, 2, 2);
    setcolor(2);
    Outtextxy(1050, 330, 'IND. SCALING');
    Outtextxy(920, 370, 'ZOOM + = M');
    Outtextxy(1150, 370, 'ZOOM - = N');
    Outtextxy(980, 420, 'NORM INDSCALING = C ');
    setcolor(1);
    setcolor(5);
    outtextxy(1000, 450, 'NORM Graph = ENTER');
    setcolor(1);
    line(901, 480, getmaxx, 480);
    line(901, 300, getmaxx, 300);
    line(901, 0, 901, getmaxy);
    Settextstyle(2, 2, 1);
    Outtextxy(1000, 500, sp);
    s := 'FOR EXIT PUT SPACE';
    OuttextXy(1000, 800, S);
  end;
  
  procedure Method;
  var
    xrr, yrr, hrr: integer;ccc, hhh: real;
  begin
    setcolor(14);
    hhh := (b3 - a3) / n1;
    ccc := a3;
    
    while ccc <= b3  do
    begin
      hrr := trunc(hhh * mx);
      xrr := trunc(ccc * mx);
      yrr := trunc(fun(ccc) * my);
      moveto(x0 + xrr, y0);
      Lineto(x0 + xrr, y0 - yrr);
      lineto(x0 + xrr + hrr, y0 - yrr);
      lineto(x0 + xrr + hrr, y0);
      lineto(x0 + xrr, y0);
            { lineto(x0+xr,yr-y0);
             lineto(x0+xr+hr,y0);
             lineto(x0+xr+hr,y0);}
      ccc := ccc + hhh;
    end;
  end;
  
  procedure Vis;
  var
    xro, yro, toc1, toc2, toc3, toc4: integer;tt, az: real;
  begin
    if a3 > -14 then tt := 5 else tt := 1;
    if (fun(a3) <= fmax) and (a1 <= a3) and (b3 - a3 >= tt)  then
    begin
      setcolor(14);
      toc1 := trunc(a3 * mx);
      toc2 := trunc(fun(a3) * my);
      toc3 := trunc(b3 * mx);
      toc4 := trunc(fun(b3) * my);
      line(x0 + toc1, y0, x0 + toc1, y0 - toc2);
      line(x0 + toc1, y0, x0 + toc3, y0);
      line(x0 + toc3, y0, x0 + toc3, y0 - toc4);
      setfillstyle(3, 13);
      floodfill(x0 + toc1 + 2, y0 - 2, 14);
    end;
  end;

  procedure Ris;
  var
    num: integer;
  begin
    x0 := 900 div 2;
    y0 := getmaxy div 2;
    XLeft := maxx;
    Xright := 900 - maxx;
    YLeft := maxy;
    Yright := getmaxy - maxy;
        {a1,b1}
    setcolor(14);
    Line(Xleft, y0, xright + 18, y0);
    Line(x0, Yleft - 18, x0, Yright);
    {oc0x}  Line(Xright + 24, y0, xright + 10, y0 + 6);
    Line(Xright + 24, y0, Xright + 10, y0 - 6);
    {ocoy}  Line(x0, Yleft - 24, x0 + 6, yleft - 10);
    Line(x0, Yleft - 24, x0 - 6, yleft - 10);
    setcolor(1);
    Settextstyle(1, 0, 2);
    Outtextxy(xright, y0 + 25, 'X');
    Outtextxy(x0 + 10, yleft - 28, 'Y');
    setcolor(14);
    mx := (Xright - Xleft) / (b1 - a1);
    my := (Yright - Yleft) / (Fmax - Fmin);
    Otrez;
    Ubu;
    Vis;
    method;
    
    
    
  end;

begin
  if (a < -40) or (step = 0) or (step > 100)  or (a = b) or (b > root)  then
  begin
    clrscr;
    textcolor(10);
    writeln('To work witn graphik mode input left limit>-40 , the numbet of segments is grater than zero and a<>b');
    writeln('Repeat input,press enter');
    normvideo;
    readln();
    input(a, b, step, hh);
  end
      else
  begin
    a3 := a;
    b3 := b;
    n1 := step;
    if b3 > root then b3 := 5;
    gd := detect;
    initgraph(gd, gm, '');
    maxx := 75;
    maxy := 75;
      {   a3:=-45;
         b3:=-10.345;
         n1:=10; }
    a1 := -50;
    b1 := 50;
    a2 := -130;
    b2 := 130;
        { a2:=-60;
         b2:=60;}
    dx := 5;
    fmax := 60000;
    fmin := -60000;
    dy := 6000;
    Infa;
    repeat
      setfillstyle(0, 0);
      bar(0, 0, 900, Getmaxy);
      ris;
      rk := wincrt.readkey;
      case rk of
        #43: 
          if (b1 < 150) and (fmax < 200000)
          then
          begin
            a1 := a1 - 20;
            b1 := b1 + 20;
            dx := b1 / 10;
            fmax := fmax + 20000;
            fmin := fmin - 20000;
            dy := fmax / 10;
          end;
        #45: 
          if (b1 > 30)  and (fmax > 40000)
          then
          begin
            a1 := a1 + 20;
            b1 := b1 - 20;
            dx := b1 / 10;
            Fmin := fmin + 20000;
            fmax := fmax - 20000;
            dy := fmax / 10;
          end;
        #57: 
          if (b1 < 150)  then
          begin
            a1 := a1 - 20;
            b1 := b1 + 20;
            dx := b1 / 10;
          end;
        #54:  
          if (b1 > 30) then
          begin
            a1 := a1 + 20;
            b1 := b1 - 20;
            dx := b1 / 10;
          end;
        #55: 
          if fmax < 200000 then
          begin
            fmax := fmax + 20000;
            fmin := fmin - 20000;
            dy := fmax / 10;
          end;
        #52: 
          if fmax > 40000 then
          begin
            fmin := fmin + 20000;
            fmax := fmax - 20000;
            dy := fmax / 10;
          end;
        #109: 
          if  maxx < 175 then
          begin
            maxx := maxx + 25;
            maxy := maxy + 25;
          end;
        #110: 
          if  maxx > 50 then
          begin
            maxx := maxx - 25;
            maxy := maxy - 25;
          end;
        
        
        #99: begin maxx := 75; maxy := 75; end;
        #48: begin a1 := -30; b1 := 30; dx := b1 / 10; fmin := -60000; fmax := 60000; dy := fmax / 10; end;
        #13: begin a1 := -30; b1 := 30; dx := b1 / 10; fmin := -60000; fmax := 60000; dy := fmax / 10; maxx := 75; maxy := 75; end;
      
      
      end;
      delay(100);
    until rk = #32;
    closegraph;
  end;
end;
begin
  //textbackground(7);
  {$D+,L+}
  clrscr;
  menu[1] := 'Enter the borders of integreation';
  menu[2] := 'The area value calculated by software and analytical method by';
  menu[3] := 'The inaccuracy of calculation: single and absolute';
  menu[4] := 'Plotting';
  menu[5] := 'Exit';
  poz := 1;
  x := 3; y := 3;
  textattr := unpush;
  outmenu;
  repeat
    sym := readkey;
    if sym = #0 then
    begin
      sym := readkey;
      case sym of
        #80:
          if poz < c then
          begin
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            inc(poz);
            textattr := push;
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := unpush;
          end;
        #72:
          if poz > 1 then
          begin
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := push;
            dec(poz);
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := unpush;
          end;
      end;
    end
    else
    if sym = #13 then
    begin
      case poz of
        1: enterborders;
        2: calsquare;
        3: inaccuracy;
        4: plotting;
        5: sym := #27;
      end;
      outmenu;
    end;
  until sym = #27;

end.

















