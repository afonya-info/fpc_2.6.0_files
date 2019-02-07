//uses crt, charset;
//{$CODEPAGE CP866}
var
i: integer;
s : string;
c: char;
begin
s:='';
  for i:= 1 to 255 do
    writeln(i,' ',chr(i));

  while ord(c) <> 13 do
    begin
      readln(c);
      writeln(ord(c));
    end;
  writeln(ord(0));
  writeln('=========');
  WRITELN('fffff¯¯¯à¨¢¥â');
readln();
end.
