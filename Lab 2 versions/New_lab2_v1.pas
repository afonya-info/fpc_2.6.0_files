Program lab2;
uses
crt,windows;
Const
leters:set of char = ['А'..'я','ё','Ё','0'..'9']; //vot takaya ascii interesnaya
spchar:set of char = ['-'];
bword:set of char = [' ','"','(','[','{','<'];
eword:set of char = [' ','.',',','?','!',':',';','"',')',']','}','>'];

Var
wmas: array[1..255] of string;// massiv slov
bools: array[1..255] of boolean;//dlya proverki ycheta slova pri poiske povtorov
ch:array[1..255] of integer;// massiv kolichestva povtorenii
chsort: array[1..255] of integer;// dlya perenaznacheniya chtoby ne poteryat mas ch
dliny: array [1..255] of integer;// dliny slov
chindex : array [1..255] of boolean;
i,cod,j,k,n,max,imax,m,x,t,kflag1,kod: integer;
s,s1,kk:string;
c:char;
flag,flag1,flagle: boolean;

BEGIN
  flag:=true;
  flag1:=false;
  kflag1:=0;
  kod:=0;
  setconsolecp(1251);
  setconsoleoutputcp(1251);

  {for i:= 1 to 253 do
    kk:= kk + 'k';
  writeln(kk);}

  writeln('Пожалуйста, введите строку:');//252 simvola tk est probel 13 i 10 cod sledovatelno na 3 mense razmera stroki
  while flag do
    begin
      i:=1;
      s:='';
      readln(s);
      flagle:=true;
      while (flagle and (i<=length(s[i])))  do // cod = 0 eto priznak perepolneniya esli vvodit stroky zcelikom
        begin
          if not(s[i] in leters) then
            flagle:=false;
          inc(i);
        end;
      if not flagle then
        begin
          flag:=true;
          writeln;
          writeln('В строке должны быть только символы кирилицы. Повторите ввод:');
        end
      else
        flag:=false;
    end;
  s1:=s+' ';

  //-----stroka s1 polnostiy gotova--------

  for i:=1 to 255 do // zanolenie massiva
    for j:= 1 to 255 do
      wmas[i]:=wmas[i]+' ';

  for i:= 1 to 255 do// zaedinichivanie massiva dlya ycheta povtorov;
    bools[i]:=true;

  for i:= 1 to 255 do//zaedinichivanie massiva dlya chetchika
    ch[i]:=1;

  i:=1;
  k:=1;
  while i< length(s1) do//zapis kazdogo slova v massi
    begin
      if (s1[i] in leters) then
        begin
          j:=i;
          n:=1;
          while not((s1[i] in leters) and (s1[i+1] in eword)) do //yslovie konca slova
            begin
              wmas[k][n]:=s1[j];
              inc(i);
              inc(j);
              inc(n);
            end;
          wmas[k][n]:=s1[j];
          dliny[k]:=n;// dlinya slova
          inc(k);
        end;
      inc(i);
    end;

  dec(k); // dlina wmas

{ vlozhenimi ciklami perebiraem stroki i esli
oni ravnyu to yvelich chetchik povtorov i
izmenyaem ychet povtorov bools chtoby ne povtoritsya pri poiske povtorov}

  i:=1;
  j:=1;

  while i<k do
    begin
      j:=i+1;
      while j<= k do
        begin
          if (bools[i]) and (dliny[i]=dliny[j]) then// esli sovpali dliny slov togda sravnit ih posimvolno
            begin
              for m:= 1 to dliny[i] do// РїРѕРјРµРЅСПС‚СЊ РґРѕ РґР»РёРЅРЅС‹ СЃС‚САРѕРєРё wmas i
                begin
                  if ((wmas[i][m] in ['А'..'я']) and (wmas[j][m] in ['А'..'я'])) or ((wmas[j][m] in ['А'..'я']) and (wmas[i][m] in ['А'..'я'])) then
                    kod:=abs(ord(wmas[i][m])-ord(wmas[j][m]));//d b raven 32 esli bukvy odinakovye no v raznyh registrah

                  if ((wmas[i][m] = 'Ё') and (wmas[j][m] = 'ё')) or ((wmas[j][m] = 'Ё') and (wmas[i][m] = 'ё')) then
                    kod:=abs(ord(wmas[i][m])-ord(wmas[j][m]));//d b raven 16 esli bukvy odinakovye no v raznyh registrah

                  if (wmas[i][m] = wmas[j][m]) or (kod = 32) or (kod = 16) then // t e simvoly ili ravny ili ih cody otlich. na 32 chto sootvetstvyet ravenstvy bolshoy i malenkoi bukvy
                    inc(kflag1);// proverka et li voobshe povtoryaemoe slovo yvelichivaem chetchik esli simvoly sovpali i potom proverim esli chetchik raven dline slova to est slovo kotoroe povtoryaetsya
                  kod:=0;
                end;
              if kflag1 = dliny[i] then // vot zdes i proveryaetsya slovo na povtor voobse i inc ch ibo tochno slovo sovpalo s dr slovom i eto nyzhno ychest
                begin
                  flag1:=true;
                  inc(ch[i]);
                  bools[j]:=false;//logika dlya ycheta proverki
                end;
              kflag1:=0;
            end;
          inc(j);
        end;
      inc(i);
    end;

{nahodim max v massive ch kotory oznachaet samoe chastovstrechayyseesya
slovo i po indexu ch nahodim samo slovo}
  for i:= 1 to 4 do
    writeln;
  max:=ch[1];
  imax:=1;
  for i:= 2 to k do
    if max<ch[i] then
      begin
        max:=ch[i];
        imax:=i;
      end;

  for i:= 1 to 255 do
    chindex[i]:=false;
  for i:= 1 to 255 do
    if ch[i] = max then
      chindex[i]:=true;


  if flag1 then
    begin
      for i:= 1 to 255 do
        if chindex[i] then
          begin
            j:=1;
            while ord(wmas[i][j]) <> 32 do
              begin
                write(wmas[i][j]);
                inc(j);
              end;
            writeln(' - (Самое частовстречающееся/одно из самых частовстречающихся) слов в заданной строке');
          end;
    end
  else
    writeln('В данной строке отсутствуют повторяющееся слова'); // writeln(s1,'|||',wmas[1],wmas[2]);
  readln;
END.
