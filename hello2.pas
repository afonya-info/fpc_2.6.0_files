uses crt,charset,windows;

var name:string[20];

begin
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  writeln('���� ������! ���� ���: ');
  readln(name);
  writeln('��� �����: ',name);
  readln();
end.
