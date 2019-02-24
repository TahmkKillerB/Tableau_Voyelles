Program Tableau_Voyelles;
Uses Wincrt;
Type
  Tab = Array[1..16] Of String;
Var
	T: Tab;
  n: Integer;
Procedure Colonne(Var N:Integer); {N: nombre des colonnes à saisir}
Begin
  Repeat
    Write('Saisissez le nombre de colonnes : ');
    Readln(n);
  Until (n>=5) And (n<=20);
End;
Function verif2(ch:String): Boolean;
{Vérifier s'il existe au moins une lettre, car sinon
                                             on peut accepter une chaine ne contenant que des escpaces}
Var
  i,S: Integer;
Begin
  S := 0;
  For i:=1 To Length(ch) Do
    If Upcase(ch[i]) In ['A'..'Z'] Then
      S := S+1;
  verif2 := S<>0;
End;
Function Verif(ch:String): Boolean;
{Vérifier l'existence des lettres alphabétiques majuscules, et les espaces}
Var
  ok: Boolean;
  i: Integer;
Begin
  i := 1;
  ok := True;
  Repeat
    ok := ((Upcase(ch[i])In['A'..'Z']) Or(ch[i]=' ')) And (Upcase(ch[i])=ch[i]);
    i := i+1;
  Until (i=Length(ch)) Or Not(ok);
  Verif := ok;
End;
Procedure Remplir(Var T:Tab ; N:Integer);
{ici, on assure que chaques chaines vérifie toutes les conditions de l'exercice}
Var
  i,j: Integer;
Begin
  For j:=1 To N Do
    Repeat
      Write('T[',j,'] : ');
      Readln(T[j]);
    Until (Length(T[j])>=1)And(Length(T[j])<=20) And (verif(T[j])) And(verif2(T[j]));
End;
Function Voy(ch:String): Integer; {Renvoie le nombre des voyelles dans une chaine}
Var
  i,S: Integer;
Begin
  S := 0;
  For i:=1 To Length(ch) Do
    If ch[i] In ['A','E','I','O','U','Y'] Then
      S := S+1;
  Voy := S;
End;
Procedure Affich(T:Tab;N:Integer); {évident...}
Var
  i,j,max: Integer;
Begin
  Max := voy(T[1]);
  For i:=2 To N Do
    If voy(T[i]) > max Then
      Begin
        max := voy(T[i]);
        Writeln(max);
      End;
  If max=0 Then
    Writeln('Les chaines ne contiennent aucune voyelle.')
  Else
    Begin
      Writeln('le(s) mot(s) contenant le plus grand nombre de voyelle est(sont) : ');
      For j:=1 To N Do
        If voy(T[j])=max Then
          Writeln(T[j]);
    End;
End;
Begin
  Colonne(N);
  Remplir(T,N);
  Affich(T,N);
End.
