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
       select cadcli1 assign to disk
       organization is line sequential.
       select cadcli2 assign to disk
       organization is line sequential.

       data division.
       file section.
       fd cadcli1
           label record are standard
           value of file-id is "cadcli1.dat".
       01 reg-cli1.
           02 cod-ent   pic 9(5).
           02 nome-ent  pic x(30).
           02 renda-ent pic 9(6)v9(2).

       fd cadcli2
           label record are standard
           value of file-id is "cadcli2.dat1".
       01 reg-cli2.
           02 cod-sai  pic 9(5).
           02 nome-sai pic x(30).

       working-storage section.
       77 fim-arq pic x(3) value "nao".

       procedure division.

       PGM-1.

       perform inicio.
       perform principal until fim-arq equal "sim".
       perform fim.
       stop run.

       inicio.
          open input cadcli1
              output cadcli2.

       principal.
          if renda-ent IS >= 10000
               perform grava.
          read cadcli1 at end move "sim" to fim-arq.

       grava.
              move cod-ent  to  cod-sai.
              move nome-ent to nome-sai.
              write reg-cli2.
       fim.
           close cadcli1 cadcli2.
