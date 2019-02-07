var
i: integer;
s: string;
c: char;
f,f1,f2: text;
begin
  assign(f,'C:\FPC\2.6.0\files\252.txt');
  assign(f1,'C:\FPC\2.6.0\files\253.txt');
  assign(f2,'C:\FPC\2.6.0\files\254.txt');
  rewrite(f);
  rewrite(f1);
  rewrite(f2);
  s:='';
  for i := 1 to 252 do
    s:=s+'A';
  s[253]:=chr(13);
  writeln(length(s));
  writeln(f,s);
  s:='';
  for i := 1 to 253 do
    s:=s+'A';
  s[254]:=chr(13);
  writeln(length(s));
  writeln(f1,s);
  s:='';
  for i := 1 to 254 do
    s:=s+'A';
  s[255]:=chr(13);
  writeln(length(s));
  writeln(f2,s);
  i:=0;
  while i<260 do
    begin
      read(f,c);
      inc(i);
    end;
  writeln('i=',i);
  close(f);
  close(f1);
  close(f2);
  readln();
  readln;
end.
