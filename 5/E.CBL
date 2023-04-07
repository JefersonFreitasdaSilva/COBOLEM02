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
       select cadapr assign to disk
       organization is line sequential.

       data division.
       file section.
       fd cadalu
          label record is standard
          value of file-id is "cadalu.dat".
       01 reg-alu.
          02 num-ent   pic 9(5).
          02 nome-ent  pic x(30).
          02 not1 pic 9(2)v99.
          02 not2 pic 9(2)v99.
          02 falta pic 9(02).


       fd cadapr
          label record is standard
          value of file-id is "cadapr.dat".
       01 reg-apr.
          02 num-sai  pic 9(5).
          02 media-sai pic 9(2)v99.

       working-storage section.
       77 fim-arq pic x(3) value "nao".
       01 media pic 9(2)v99.

       procedure division.

       PGM-1.
          perform inicio.
          perform principal until fim-arq = "sim".
          perform fim.
          stop run.

       inicio.
          open input cadalu
           output cadapr.

       principal.
          read cadalu at end move "sim" to fim-arq.
          perform calc.

       calc.
           compute media = (not1 + not2) / 2.
           if media is >= 6
              if falta not > 4
                perform gravar.

       gravar.

        move num-ent to num-sai.
        move media to media-sai.
        write reg-apr.
       fim.
          close cadalu cadapr.
