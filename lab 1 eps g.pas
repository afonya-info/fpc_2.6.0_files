program lab1;
const eps = 0.00001;
var x,y,h: single;
BEGIN
  x:=-11;
  y:=0;
  h:=0.2;
  while x<=8 do
   begin
    if x + eps <-9 then
      y:= x - sin(x)
    else
      if x + eps <1 then
        y:= 78+x
      else
        if x + eps <6 then
          y:=2*sin(x)
        else
          y:= 83*25 - exp(ln(x)*(0.1*x));
   writeln('x = ',x:5:1,' f(x) = ',y:1:2);
   x:=x+h;
   end;
  readln();
END.
