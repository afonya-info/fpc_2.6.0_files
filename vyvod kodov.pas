uses
charset;
var
i:integer;
begin
  for i:=1 to 200 do
    writeln(i,' ',chr(i));
  readln;
end.