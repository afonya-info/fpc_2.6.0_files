uses crt,windows;
const a:set of char=['�'..'�'];
b='�';
begin
  if b in a then
    writeln(1)
  else
    writeln(0);
  readln;
end.