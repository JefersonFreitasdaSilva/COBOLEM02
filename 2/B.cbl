       identification division.
       program-id. A.
       author. Jeferson.
       installation. fatec-sp.
       date-written. 07/04/2023.
       date-compiled.
       security.

       environment division.
       configuration section.
       source-computer. ibmpc.
       object-computer. ibmpc.
       special-names. decimal-point is comma.

       input-output section.
       file-control.
       select cadalu assign to disk
       organization is line sequential.
       select cadatu assign to disk
       organization is line sequential.

       data division.
       file section.
       fd cadalu
           label record are standard
           value of file-id is "cadalu.dat".
       01 reg-alu.
           02 num-ent   pic 9(5).
           02 nome-ent  pic x(30).
           02 sexo-ent  pic A(1).
           02 data-nasc-ent.
               03 dd-ent pic 9(2).
               03 mm-ent pic 9(2).
               03 aa-ent pic 9(4).


       fd cadatu
           label record are standard
           value of file-id is "cadatu.dat".
       01 reg-atu.
           02 num-sai  pic 9(5).
           02 nome-sai pic x(30).
           02 data-nasc-sai.
               03 dd-sai pic 9(2).
               03 mm-sai pic 9(2).
               03 aa-sai pic 9(4).

       working-storage section.
       77 fim-arq pic x(3) value "nao".

       procedure division.

       PGM-1.

       perform inicio.
       perform principal until fim-arq equal "sim".
       perform fim.
       stop run.

       inicio.
          open input cadalu
              output cadatu.

       principal.
          if  sexo-ent is equal "m" or sexo-ent equal "M"
             if aa-ent is <= 1960
                   perform grava.
          read cadalu at end move "sim" to fim-arq.

       grava.
              move num-ent  to  num-sai.
              move nome-ent to nome-sai.
              move aa-ent to aa-sai.
              move mm-ent to mm-sai.
              move dd-ent to dd-sai.
              write reg-atu.
       fim.
           close cadalu cadatu.
