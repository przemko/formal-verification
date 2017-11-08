pragma SPARK_Mode;

package body Split is

   procedure Split (V : in Integer; T : in out Data; B1, B2 : out Integer)
   is
      P1 : Integer := T'First;
      P2 : Integer := T'Last;
   begin
      B1 := T'First;
      B2 := T'Last;
      while P1 <= P2 loop
         pragma Loop_Invariant
           ( T'First <= B1 and then B1 <= P1 and then
             P2 <= B2 and then B2 <= T'Last and then
              (for all I in T'First .. B1 - 1 => T(I) < V) and then
                 (for all I in B1 .. P1 - 1  => T(I) = V) and then
               (for all I in P2 + 1 .. B2 => T(I) = V) and then
                 (for all I in B2 + 1 .. T'Last => T(I) > V));
         if T(P1) = V then
            P1 := P1 + 1;
         elsif T(P2) = V then
            P2 := P2 - 1;
         elsif T(P1) < V then
            if P1 > B1 then
               T(B1) := T(P1);
               T(P1) := V;
            end if;
            B1 := B1 + 1;
            P1 := P1 + 1;
         elsif T(P2) > V then
            if P2 < B2 then
               T(B2) := T(P2);
               T(P2) := V;
            end if;
            B2 := B2 - 1;
            P2 := P2 - 1;
         else
            declare
               TMP : Integer := T(P1);
            begin
               T(P1) := T(P2);
               T(P2) := TMP;
            end;
         end if;
      end loop;
   end Split;

end Split;
