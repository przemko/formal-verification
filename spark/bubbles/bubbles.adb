package body Bubbles with SPARK_Mode is

   -- ponizsza funkcja Perm_Transitive zostala zaczerpnieta z
   -- J.W. McCormick, P.C. Chain. Building High Integrity Applications
   -- with SPARK.

   function Perm_Transitive (A, B, C : Table) return Boolean
     with
       Global => null,
       Post =>
         (if Perm_Transitive'Result
          and then Perm (A, B)
          and then Perm(B, C)
                  then Perm(A, C)),
         Ghost => True,
         Import => True;

   procedure Swap (T : in out Table; I : in Positive; J : in Positive) is
      Temp : Integer := T (I);
      Old_T : constant Table := T with Ghost;
   begin
      T (I) := T (J);
      T (J) := Temp;
      pragma Assume (Perm(Old_T, T));
   end Swap;

   procedure Bubble (T : in out Table; I : in Positive) is
      Prev_T : Table (T'Range) with Ghost;
   begin

      pragma Assume (Perm (T, T));

      for J in T'First + 1 .. I loop

         Prev_T := T;

         if T (J - 1) > T (J) then

            Swap (T, J - 1, J);

         end if;

         pragma Assume (Perm_Transitive (T'Loop_Entry, Prev_T, T));

         pragma Loop_Invariant (Perm (T'Loop_Entry, T));

         pragma Loop_Invariant
           (for some K in T'First .. J =>
                 T(J) = T'Loop_Entry (K));

         pragma Loop_Invariant
           (for all K in J + 1 .. T'Last =>
              T(K) = T'Loop_Entry (K));

         pragma Loop_Invariant
           (for all K in T'First .. J =>
              T(K) <= T(J));

      end loop;

   end Bubble;

   procedure Sort (T : in out Table) is
      Prev_T : Table (T'Range) with Ghost;
   begin

      pragma Assume (Perm (T, T));

      for I in reverse T'Range loop

         Prev_T := T;

         Bubble (T, I);

         pragma Assume (Perm_Transitive (T'Loop_Entry, Prev_T, T));

         pragma Loop_Invariant (Perm (T'Loop_Entry, T));

         pragma Loop_Invariant
           (for all J in I .. T'Last =>
              (for all K in T'First .. J =>
                   T(K) <= T(J)));

      end loop;

   end Sort;

end Bubbles;

