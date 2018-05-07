pragma SPARK_Mode;

package body Split is

   procedure Split (V : in Integer; T : in out Data; B1, B2 : out Integer)
   is
      P1 : Integer := T'First;
      TMP : Integer;

      --               T'First   B1          P1               B2      T'Last
      --               +--------+-----------+-------------------+----------+
      --               |  < V   |   = V     |      ???          |   > V    |
      --               +--------+-----------+-------------------+----------+
      -- T(P1) < V               <-- SWAP -->
      -- T(P1) > V                           <------ SWAP ----->
      -- T(P1) = V                           ->|

   begin
      B1 := T'First;
      B2 := T'Last;
      while P1 <= B2 loop
         pragma Loop_Invariant
           ( T'First <= B1 and then B1 <= P1 and then
             P1 <= B2 and then B2 <= T'Last and then
              (for all I in T'First .. B1 - 1 => T(I) < V) and then
                 (for all I in B1 .. P1 - 1  => T(I) = V) and then
                 (for all I in B2 + 1 .. T'Last => T(I) > V));
         if T(P1) < V then
            TMP := T(B1);
            T(B1) := T(P1);
            T(P1) := TMP;
            B1 := B1 + 1;
            P1 := P1 + 1;
         elsif T(P1) > V then
            TMP := T(B2);
            T(B2) := T(P1);
            T(P1) := TMP;
            B2 := B2 - 1;
         else
            P1 := P1 + 1;
         end if;
      end loop;
   end Split;

end Split;
