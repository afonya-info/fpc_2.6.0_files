program art;
var
b,a,s:real;
f:string;
  function sum(var c,d:real):real;
    begin
      sum:=a+b;
      b:=33;
    end;
begin
  a:=1;
  b:=22;
  s:=0;
  s:=s+sum(a,b);
  readln(s);
  writeln(s,'   ',f);
  readln;
end.