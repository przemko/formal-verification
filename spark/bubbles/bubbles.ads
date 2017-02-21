package Bubbles with SPARK_Mode is

   type Table is array (Positive range <>) of Integer;

   -- ponizsza funkcja Perm zostala zaczerpnieta z
   -- J.W. McCormick, P.C. Chain. Building High Integrity Applications
   -- with SPARK.

   function Perm (A : in Table; B : in Table) return Boolean
     with
       Global => null,
       Ghost => True,
       Import => True;

   procedure Swap (T : in out Table; I : in Positive; J : in Positive)
     with
       Depends =>
         (T => (T, I, J)),
         Pre =>
           T'Length > 1 and then
           I in T'Range and then
           J in T'Range and then I /= J,
         Post =>
           Perm (T'Old, T) and then
           (for all K in T'Range =>
              (if K /= I and then K /= J then T (K) = T'Old (K))) and then
     T (I) = T'Old (J) and then T (J) = T'Old (I);

   procedure Bubble (T : in out Table; I : in Positive)
     with
       Depends => (T => (T, I)),
       Pre => T'Length > 0
       and then I in T'Range
       and then T'First > Positive'First
       and then T'Last < Positive'Last,
       Post =>
         Perm (T'Old, T) and then
         (for all J in T'First .. I => T(J) <= T(I))
         and then (for some J in T'First .. I => T(I) = T'Old (J))
         and then (for all J in I + 1 .. T'Last => T (J) = T'Old (J));

   procedure Sort (T : in out Table)
     with
       Depends => (T => T),
     Pre =>
       T'Length >= 1 and then
       T'Last > Positive'First and then
       T'Last < Positive'Last  and then
       T'First > Positive'First and then
       T'First < Positive'Last,
       Post =>
         Perm (T'Old, T) and then
     (for all I1 in T'Range =>
        (for all I2 in T'Range =>
             (if I1 < I2 then T(I1) <= T(I2))));

end Bubbles;

