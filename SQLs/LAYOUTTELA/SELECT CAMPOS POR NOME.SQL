{ Regra responsável por:  Tornar o campo Indisponbilidade em MW obrigatóro quando Indisp. Geralçai = Sim               }
{ Programador responsável: Beethoven Nunes (beethoven.nunes@cpflrenovaveis.com / beto.nunes@live.com                   }
{ S.S Engeman nº 1254                                                                                                  }
{ Data Criação : 17/09/2021                                                                                            }
{----------------------------------------------------------------------------------------------------------------------}


INTERFACE
 USES  
  FN_UTEIS;

IMPLEMENTATION

MAIN
  var
    codOrd, codapl, indisp, areaManut: String;

    
BEGIN

 codOrd := fieldByName('OrdSer','CodOrd',AsString); 
 codapl := fieldByName('OrdSer','codapl',AsString); 

if ( codOrd='') then begin
  abort;
end; 

if (areaManut <> 'AEG') then begin

  if ( codapl <> '') then begin
    areaManut:=FN_UTEIS.AREAMANUT(codapl);
    indisp:=fieldByName('OrdSer','u_indis',AsString);
  end; 
  
  if (indisp='Sim') then begin
    setProperty('L_CST_SCROLLCADU_INDISPMW','Font.Color',clBlue);
    setProperty('L_CST_SCROLLCADU_INDISPMW','Font.Style','FsBold');
  end else begin
    setProperty('L_CST_SCROLLCADU_INDISPMW','Font.Color',clBlack);
    setProperty('L_CST_SCROLLCADU_INDISPMW','Font.Style','FsNormal');
  end;
end;

END.