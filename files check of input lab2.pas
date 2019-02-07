Program lab2;
uses
charset;
Const
leters:set of char = ['А'..'Я','а'..'я','a'..'z','A'..'Z'];

Var
wmas: array[1..255] of string;
bools: array[1..255] of boolean;
ch:array[1..255] of integer;
dliny: array [1..255] of integer;
i,cod,j,k,n,max,imax,m,x : integer;
s,s1,kk:string;
c:char;
flag,flag1: boolean;

BEGIN
  flag:=true;
  flag1:=false;

  for i:= 1 to 253 do
    kk:= kk + 'k';
  writeln(kk);

  writeln('Пожалуйста, введите строку, не превышающую 253 символа:');//252 simvola tk est probel 13 i 10 cod sledovatelno na 3 mense razmera stroki
  while flag do
    begin
      i:=1;
      cod:=-1;
      s:=' ';
      while (not(cod=13)) and (i< 256)   do // cod = 0 eto priznak perepolneniya esli vvodit stroky zcelikom
        begin
          read(c);
          s:=s+c;
          inc(i);
          cod:=ord(s[i]);
        end;
      if i>255 then
        begin
          flag:=true;
          writeln;
          writeln('Пожалуйста, введите строку заново(не более 253 символов):');
        end
      else
        flag:=false;
    end;

  i:=2;
  s1:=s[1];
  while not(ord(s[i])=13) do
    begin
      s1:=s1+s[i];
      inc(i);
    end;
  s1:=s1+' ';
  s1:=s1+'6';
  writeln(s1);
  readln;
end.
