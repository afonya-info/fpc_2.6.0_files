uses crt;
var c : char;
i: integer;
begin
  while c <> #27 do
    begin
      c:=readkey;
      writeln(c,' - ',ord(c));
    end;

end.
