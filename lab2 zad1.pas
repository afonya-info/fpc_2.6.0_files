program lab2z1;
uses crt;
const cn = 1000;
var a: array [1..cn] of longint;
    i,j,n,min,prov,digit:longint;
    //n,min,prov,digit:real;
    c:char;
    s,s1:string;
    flag,flag1,flag2,minus,flag0:boolean;
BEGIN
  writeln('Amount of array`s elements:');
  flag0:=true;
  write('n = ');
  flag:=true;
  while flag do
  begin
    readln(s);
    flag1:=true;
    i:=1;
    n:=0;
    digit:=0;
    while (flag1 and (i<=length(s))) do
    begin
      case s[i] of
        '0':digit:=0;
        '1':digit:=1;
        '2':digit:=2;
        '3':digit:=3;
        '4':digit:=4;
        '5':digit:=5;
        '6':digit:=6;
        '7':digit:=7;
        '8':digit:=8;
        '9':digit:=9;
      else
        flag1:=false;
      end;
      n:=n*10+digit;
      {writeln('s[i] ',s[i]);
      writeln('digit ',digit);
      writeln('n ',n);}
      inc(i);
    end;
    prov:=n;
      s1:='';
      if flag1 then
        while prov <> 0 do
        begin
          case (prov mod 10) of
            0 : c:='0';
            1 : c:='1';
            2 : c:='2';
            3 : c:='3';
            4 : c:='4';
            5 : c:='5';
            6 : c:='6';
            7 : c:='7';
            8 : c:='8';
            9 : c:='9';
          end;
          prov:=prov div 10;
          s1:=c+s1;
        end;
      if (length(s)<> (i-1)) or (length(s)=0) then
      begin
        writeln('You should to input number, which not bigger then',cn,' and it must be positive one' );
        write('n = ');
      end
      else if s1<>s then
      begin
        writeln('Span of number must be: [-2147483647;2147483647]:');
        write('n = ');
      end
      else
       flag:=false;
  end;
    for j:= 1 to n do
    begin
      flag2:=true;
      flag0:=true;
      write('a[',j,'] = ');
      while flag2 do
      begin
        s:='';
        readln(s);
        if (s[1] = '-')then
        begin
          i:=2;
          minus:=true;
        end
        else
        begin
          i:=1;
          minus:=false;
        end;
        flag1:=true;
        a[j]:=0;
        digit:=0;
        while (flag1 and (i<=length(s))) do
        begin
          case s[i] of
            '0':digit:=0;
            '1':digit:=1;
            '2':digit:=2;
            '3':digit:=3;
            '4':digit:=4;
            '5':digit:=5;
            '6':digit:=6;
            '7':digit:=7;
            '8':digit:=8;
            '9':digit:=9;
          else
            flag1:=false;
        end;
        a[j]:=a[j]*10+digit;
        {writeln('s[i] ',s[i]);
        writeln('digit ',digit);
        writeln('a[',j,'] ',a[j]);}
        inc(i);
      end;
      prov:=a[j];
      s1:='';
      if flag1 then
        while prov <> 0 do
        begin
          case (prov mod 10) of
            0 : c:='0';
            1 : c:='1';
            2 : c:='2';
            3 : c:='3';
            4 : c:='4';
            5 : c:='5';
            6 : c:='6';
            7 : c:='7';
            8 : c:='8';
            9 : c:='9';
          end;
          prov:=prov div 10;
          s1:=c+s1;
          flag0:=false;
        end;
      if minus then
        s1:='-'+s1;
      if flag0 then
      begin
        a[j]:=0;
        s1:='0';
      end;
      if (length(s)<> (i-1)) or (length(s)=0) then
      begin
        writeln('Each element of array must be integer positive or negative number:');
        write('a[',j,'] = ');
      end
      else if s1<>s then
      begin
        writeln('Span of number must be: [-2147483647;2147483647]:');
        write('a[',j,'] = ');
      end
      else
      begin
        flag2:=false;
        if minus then
          a[j]:=a[j] *(-1);
      end;
      end;
    end;
  min:=abs(a[1]);
  for i:= 2 to n do
    if abs(a[i])<abs(min) then
      min:=abs(a[i]);
  writeln(min);
  readln;
END.
