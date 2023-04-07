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
          label record is standard
          value of file-id is "cadalu.dat".
       01 reg-alu.
          02 num-ent   pic 9(5).
          02 not1-ent  pic 9(2).
          02 not2-ent  pic 9(2).
          02 data-nasc-ent    pic 9(4) occurs 2 times .
      * occurs 2 times.
          02 sexo-ent     pic A(1).


       fd cadatu
          label record is standard
          value of file-id is "cadatu.dat".
       01 reg-atu.
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
           output cadatu.

       principal.
          if  sexo-ent = "F" or sexo-ent = "f"
              perform calc.
          read cadalu at end move "sim" to fim-arq.

       calc.


        if data-nasc-ent(2) NOT < 2000
           perform gravar.

       gravar.
        compute media=(not1-ent + not2-ent)/2.
        move num-ent to num-sai.
        move media to media-sai.
        write reg-atu.
       fim.
          close cadalu cadatu.
