program art;
const
eps = 0.0000001;
var x,n:double;
i:integer;
begin
  n:=0.00001;
  x:=1;
  while x<10 do
    begin
      if ((4*exp(ln(x)*3) - 25*exp(ln(x)*2) + 491*x -2134)<(1/256)) and((4*exp(ln(x)*3) - 25*exp(ln(x)*2) + 491*x -2134)>-(1/256)) then
        writeln(x,' ��७�');
      x:=x+n;
    end;
  readln();
end.
