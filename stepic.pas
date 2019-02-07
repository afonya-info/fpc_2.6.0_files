program art;
var a,digit,b: integer;
begin
  readln(a);
  writeln;
  b:=1;
  while a>0 do
    begin
      digit:=a mod 2;
      b:=b*10+digit;;
      a:=a div 2;
    end;
  writeln(b);
  readln;
end.