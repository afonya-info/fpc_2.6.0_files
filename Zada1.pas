program art;
const n = 100000000;
var i,n1:integer;
    a: array [1..n] of single;
    min: single;

begin
  a[1]:=min;
  readln(n1);
  writeln;
  for i:= 2 to n1 do
    begin
      read(a[i]);
      if a[i]<0 then
         a[i]:=a[i]*(-1);
      if a[i]<min then
         min:=a[i];
    end;
    writeln(min);
  readln;
end.
