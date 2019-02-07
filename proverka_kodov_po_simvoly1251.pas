uses crt,windows;
var c : char;
i: integer;
begin
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  while c <> #27 do
    begin
      c:=readkey;
      writeln(c,' - ',ord(c));
    end;

end.
