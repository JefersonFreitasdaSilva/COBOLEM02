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
       select cadnota assign to disk
       organization is line sequential.
       select cadaprov assign to disk
       organization is line sequential.

       data division.
       file section.
       fd cadnota
          label record is standard
          value of file-id is "cadnota.dat".
       01 reg-nota.
          02 num-ent   pic 9(5).
          02 not1 pic 9(2)v99.
          02 not2 pic 9(2)v99.
          02 not3 pic 9(2)v99.
          02 not4 pic 9(2)v99.

       fd cadaprov
          label record is standard
          value of file-id is "cadaprov.dat".
       01 reg-aprov.
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
          open input cadnota
           output cadaprov.

       principal.
          perform calc.
          read cadnota at end move "sim" to fim-arq.

       calc.
           compute media = (not1 + not2 + not3 + not4) / 4.
           if media is >= 6
               perform gravar.

       gravar.

        move num-ent to num-sai.
        move media to media-sai.
        write reg-aprov.
       fim.
          close cadnota cadaprov.
