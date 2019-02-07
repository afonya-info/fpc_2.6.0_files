program labos;{$D+,L+}

uses wincrt, graph, crt;

const
  xr = 5;yr = 5;ac = 14;pa = 7; q = 5;

var
  rk: char; menu: array [1..q] of string;  step: int64;hh, root, a, b, y: real; sp, sa: string;
  place: integer;
      {‚лў®¤ ¬Ґ­о}
procedure MenuToScr;
var
  i: byte;
begin
  clrscr;
  TextColor(pa);
  i := 1;
  for i := 1 to q do
  begin
    gotoxy(xr, yr + i - 1); write(menu[i]);
  end;
  Textcolor(ac);
  gotoxy(xr, yr + place - 1); write(menu[place]);
  TextColor(pa);
end;
    
procedure Information;
begin
  clrscr;
  Textcolor(13);
  gotoxy(5, 1); writeln('Calculate the area of bounded line shape: -2*x^3+(-1)*x^2+(51)*x+(-714)');
  gotoxy(5, 2); writeln('The curve crosses the x-axix at ', root:0:2);
  gotoxy(5, 3); writeln('The area is calculated by the method of right rectangles');
  gotoxy(5, 4); writeln('Integration limits are entered by user');
  gotoxy(5, 5); writeln('Error calculation is organized');
  gotoxy(5, 6); writeln('Use the arrows to move around the menu');
  gotoxy(5, 7); writeln('Press ENTER to start');
  readln();
end;
       


       
procedure Input(var a: real; var b: real; var n: int64; var h: real);
var
  k: real;
begin
  clrscr;
  TextColor(11);
  writeln(' Required to find the area above the x-axis');
  writeln('Function above the axis to ', root:0:2, ' function below the x-axis from ', root:0:2);
  TextColor(14);
  writeln('If you enter the  integration limit more than', root:0:2, ' then the area will be = 0');
  Normvideo;
  writeln();
  writeln('Enter the left intergration limit, the number is not more than 1000 and not less than -1000 ');
  readln(a);
  while (a < -1000) or (a > 1000)  do
  begin
    TextColor(12);
    writeln('Wrong input, repeat again');
    NormVideo;
    readln(a);
  end;
  writeln('Enter the right intergration limit, the number is not more than 1000 and not less than -1000 ');
  readln(b);
  while (b < -1000) or (b > 1000)  do
  begin
    TextColor(12);
    writeln('Wrong input, repeat again');
    NormVideo;
    readln(b);
  end;
  if a > b
             then
  begin
    TextColor(12);
    writeln('Incorret intergration limits');
    Normvideo;
    k := b;
    b := a;
    a := k;
  end;
  writeln('Enter the number of segments, the number is not more than 1000000 and not less than 0');
  readln(n);
  while (n <= 0) or (n > 1000000) do
  begin
    TextColor(12);
    writeln('Wrong input, repeat again');
    NormVideo;
    readln(n);
  end;
  if a > root then
  begin
    a := 0;
    b := 0;
    h := 0;
    
  end
                       else
  begin
    if  b > root  then b := root;
    h := (b - a) / n;
  end;
  readln();
end;
         
function fun(x: real): real;
begin
  fun := -2 * x * x * x + (-1) * x * x + 51 * x + (-714);
end;

function perv(x: real): real;
begin
  perv := -(2 / 4) * x * x * x * x + (-1 / 3) * x * x * x + (51 / 2) * x * x - 714 * x;
end;

procedure Dixot(var v: real);
      
var
  q, w, t, c, e: real;
begin
  q := -100;
  w := 100;
  e := 0.0001;
  c := (q + w) / 2;
  while abs(q - w) > e do
  begin
    t := fun(q) * fun(c);
    if  t < 0 then
      w := c
    else
      q := c;
    c := (q + w) / 2;
  end;
  v := (q + w) / 2;
end;

        
procedure Integral(a: real;  b: real;  n: longint; h: real);
var
  x: real;i: longint;S1, S2, p, ap: real;
begin
  clrscr;
  writeln('Calculation area of the shape using the right-hand rectangle method');
  S1 := 0;
  i := 1;
  for i := 1 to n do
  begin
    x := a + i * h;
    s1 := s1 + fun(x) * h;
  end;
  str(s1:0:4, sp);
  writeln('Area is equal ', '= ', s1:0:6);
  writeln();
  writeln('Calculate the area of analytical methods and consider the error');
  begin
    S2 := perv(b) - perv(a);
    str(s2:0:4, sa);
    p := abs(s1 - s2);
    
    if p = 0 then ap := 0
    else ap := (p / s2) * 100;
    writeln('analytical method', ' = ',  S2:0:6);
    writeln();
    writeln('calculation error = +- ', p:0:5);
    writeln();
    writeln('absolute calculating error =', ap:0:5, '%'  );
  end;
  readln();
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
    if b3 > root then b3 := -9;
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
  clrscr;
  Dixot(root);
  menu[1] := '1) Information';
  menu[2] := '2) Input of data';
  menu[3] := '3) Right rectangle calculation and calculation of measurement error';
  menu[4] := '4) Function graph';
  menu[5] := '5) Exit';
  place := 1;
  MenuToScr;
  repeat
    rk := readkey;
    if rk = #0
                      then
    begin
      rk := readkey;
      case rk of
        #80: 
          if place = q
                                           then
          begin
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(ac);
            place := 1;
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(pa);
            
          end
                                           else
          begin
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(ac);
            place := place + 1;
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(pa);
          end;
        #72: 
          if place = 1 then
          begin
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(ac);
            place := q;
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(pa);
          end
                                            else
          begin
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(ac);
            place := place - 1;
            gotoxy(xr, yr + place - 1); write(menu[place]);
            TextColor(pa);
          end;
      end;
    end
                 else
    begin
      if  rk = #13
                                      then
      begin
        case place of
          1: Information;
          2: Input(a, b, step, hh);
          3: Integral(a, b, step, hh);
          4: plotting;
          5: rk := #27;
        end
      end;
      MenuToScr;
    end;
  until rk = #27;
end.








