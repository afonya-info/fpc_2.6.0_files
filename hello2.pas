uses crt,charset,windows;

var name:string[20];

begin
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  writeln('Всем привет! Ваше имя: ');
  readln(name);
  writeln('Вас зовут: ',name);
  readln();
end.
