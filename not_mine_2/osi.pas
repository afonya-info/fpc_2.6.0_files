uses wincrt,graph;

var 
	strelkax, strelkay, gd,gm : integer;
begin
	detectgraph(gd,gm);
	initgraph(gd,gm,'');
	
	StrelkaX:=5;
	StrelkaY:=20;
	
	ClearDevice();
  SetColor(white);
  SetLineStyle(0,0,3);
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2),GetMaxY);
  Line(0,Round(GetMaxY/2),GetMaxX,Round(GetMaxY/2));
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2)-StrelkaX,StrelkaY);
  Line(Round(GetMaxX/2),0,Round(GetMaxX/2)+StrelkaX,StrelkaY);
  Line(GetMaxX,Round(GetMaxY/2),GetMaxX-StrelkaY,Round(GetMaxY/2)-StrelkaX);
  Line(GetMaxX,Round(GetMaxY/2),GetMaxX-StrelkaY,Round(GetMaxY/2)+StrelkaX);
  outtextXY(getmaxX-20,getmaxY div 2-20,'X');
  outtextXY(getmaxX div 2+10,10, 'Y');
	wincrt.readkey;
	closegraph;
end.