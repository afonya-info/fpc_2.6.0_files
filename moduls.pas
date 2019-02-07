program art;
uses crt;
const n= 4;
push=15;
unpush=112;
type armen = array[1..n] of string[90];
var
menu : armen;
poz:integer; sym:char; x,y:integer;
  procedure proc1;
    begin
      clrscr;
      writeln('proc1');
      readln;
    end;
  procedure proc2;
    begin
      clrscr;
      writeln('proc2');
      readln;
    end;
  procedure proc3;
    begin
      clrscr;
      writeln('proc3');
      readln;
    end;
  procedure outmenu;
    var i:integer;
    begin
      clrscr;
      for i:=1 to n do
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
  textbackground(7);
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
          #80:if poz<n then
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
              1:proc1;
              2:proc2;
              3:proc3;
              4:sym:=#27;
            end;
            outmenu;
          end;
  until sym=#27;
end.

















