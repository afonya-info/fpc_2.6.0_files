program art;
uses crt;
const c= 4;
push=112;
unpush=15;
backcol = 7;
root = 4.62919;
type armen = array[1..c] of string[90];
var
menu : armen;
sym:char; poz,x,y:integer;
a,b,step,n,w,f,l,r,t,s,snl,d,absd:real;
  procedure enterborders;
    begin
      clrscr;
      writeln('Please, enter boarders of interation:');
      write('low boarder = ');
      readln(a);
      write('high boarder = ');
      readln(b);
      write('amount of splits = ');
      readln(step);
      if a>b then begin
        t:=a;
        a:=b;
        b:=t;
      end;
      writeln('press any key');
      readln;
    end;
  function integ(var w:real):real;
  var sum:real;
    begin
      w:=w+n;
      sum:=0;
      f:=4*w*w*w - 25*w*w + 491*w -2134;;
      while (f>0) and (w<=b) do
        begin
          sum:=sum+f*n;
          w:=w+n;
          f:=4*w*w*w - 25*w*w + 491*w -2134;;
        end;
    end;
  procedure inaccuracy;
    begin
      clrscr;
      d:=abs(snl-s);
      absd:=d/snl*100;
      writeln('relati2ve inaccuracy = ',d);
      writeln('absolute inaccuracy = ',absd);
      readln;
    end;
  procedure outmenu;
    var i:integer;
    begin
      clrscr;
      for i:=1 to c do
        begin
          gotoxy(x,y+i-1);
          write(menu[i]);
        end;
      textattr:=push;
      gotoxy(x,y+poz-1);
      write(menu[poz]);
      textattr:=unpush;
    end;
begin
  //textbackground(7);
  clrscr;
  menu[1]:='Enter the borders of integreation';
  menu[2]:='The area value calculated by software and analytical method by';
  menu[3]:='The inaccuracy of calculation: single and absolute';
  menu[4]:='Exit';
  poz:=1;
  x:=3; y:=3;
  textattr:=unpush;
  outmenu;
  repeat
    sym:=readkey;
    if sym=#0 then
      begin
        sym:=readkey;
        case sym of
          #80:if poz<c then
                begin
                  gotoxy(x,y+poz-1);
                  write(menu[poz]);
                  inc(poz);
                  textattr:=push;
                  gotoxy(x,y+poz-1);
                  write(menu[poz]);
                  textattr:=unpush;
                end;
          #72:if poz>1 then
              begin
                gotoxy(x,y+poz-1);
                write(menu[poz]);
                textattr:=push;
                dec(poz);
                gotoxy(x,y+poz-1);
                write(menu[poz]);
                textattr:=unpush;
              end;
        end;
      end
    else
        if sym = #13 then
          begin
            case poz of
              1:enterborders;
              2:begin
      clrscr;
      s:=0;
      n:=abs(b-a)/step;
      w:=a +n/2;
      while w<b do begin
        f:=4*w*w*w - 25*w*w + 491*w -2134;;
        if f>0 then
          s:=s+f*n+integ(w);
        w:=w+n;
      end;
      if a<root then
        if b<root then
          snl:=0
        else
          snl:=(b*b*b*b - (25/3)*b*b*b + 245.5*b*b -2134*b) - (root*root*root*root - (25/3)*root*root*root + 245.5*root*root -2134*root)
      else
        snl:=(b*b*b*b - (25/3)*b*b*b + 245.5*b*b -2134*b) - (a*a*a*a - (25/3)*a*a*a + 245.5*a*a -2134*a);
      writeln('square calculated by software:',s,' square units');
      writeln('square, calculated by analytic method:',snl,' square units');
      readln;
    end;
              3:inaccuracy;
              4:sym:=#27;
            end;
            outmenu;
          end;
  until sym=#27;
end.

















