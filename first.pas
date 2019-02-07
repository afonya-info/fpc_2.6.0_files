Program lab2;
uses
crt;
Const
leters:set of char = ['А'..'Я','а'..'я','a'..'z','A'..'Z'];

Var
wmas: array[1..255] of string;
bools: array[1..255] of boolean;
ch:array[1..255] of integer;
dliny: array [1..255] of integer;
i,cod,j,k,n,max,imax,m : integer;
ci:array [1..15] of integer;
s,s1,checkk:string;
c:char;
flag,flag1,flag2: boolean;
f:text;

BEGIN
  assign(f,'C:\FPC\2.6.0\files\Ci.txt');
  rewrite(f);
  s:=' ';
  for i:= 1 to 15 do
    ci[i]:=0;
  flag:=true;
  flag1:=false;
  flag2:=false;
  i:=1;
  cod:=0;
  j:=0;

  {for i:= 1 to 255 do
    checkk[i]:='a';
  writeln(checkk);}
 // writeln;
   clrscr;
  //writeln('Пожалуйста, введите строку, не превышающую 253 символа:');//252 simvola tk est probel 13 i 10 cod sledovatelno na 3 mense razmera stroki
   writeln('String');
  while flag do
    begin
      read(c);
      ci[i]:=ord(c);
      cod:=ord(c);
      writeln(f,ci[i],'(',i,')');
      if flag2 and (cod = 13) then
        while (not(cod=13)) and (i<=10) do
          begin
            read(c);// chitaet do simvola 13
            s:=s+c;
            inc(i);
            j:=i;
            ci[i]:=ord(c);
            writeln(f,ci[i],'(',i,')');
            cod:=ord(c);
          end
      else
        while (not(cod=13)) and (i<=10) do
          begin
            s:=s+c;
            ci[i]:=ord(c);
            writeln(f,ci[i],'(',i,')');
            inc(i);
            j:=i;
            ci[i]:=ord(c);
            cod:=ord(c);
            read(c);
          end;

      {for i:=1 to 15 do
        writeln(ci[i],'(',i,')');
      i:=j;}
      if i>=11 then
        begin
          flag:=true;
          flag2:=true;
          writeln;
          //writeln('Пожалуйста, введите строку заново(не более 252 символов):');
          writeln('again:');
          s:=' ';
          //writeln(ord(s[1]));
          i:=1;
          cod:=0;
         end
      else
        begin
          flag:=false;
          //s[i]:=chr(13);
        end;
    end;

  {i:=2;
  s1:=s[1];
  while not(ord(s[i])=13) do
    begin
      s1:=s1+s[i];
      inc(i);
    end;
  s1:=s1+' ';}
  for i:=1 to 15 do
    write(ci[i],'(',i,')');
  close(f);
  writeln;
  writeln(s1);
  readln;
  readln;
end.
