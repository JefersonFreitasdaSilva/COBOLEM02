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
       select aprov assign to disk
       organization is line sequential.
       select reprov assign to disk
       organization is line sequential.

       data division.
       file section.
       fd cadalu
          label record is standard
          value of file-id is "cadalu.dat".
       01 reg-alu.
          02 num-ent   pic 9(5).
          02 nome-ent  pic x(20).
          02 media-ent pic 9(2)v99.


       fd aprov
          label record is standard
          value of file-id is "aprov.dat".
       01 reg-aprov.
          02 num-a   pic 9(5).
          02 nome-a  pic x(20).
          02 media-a pic 9(2)v99.

       fd reprov
          label record is standard
          value of file-id is "reprov.dat".
       01 reg-reprov.
          02 num-r   pic 9(5).
          02 nome-r  pic x(20).
          02 media-r pic 9(2)v99.

       working-storage section.
       77 fim-arq pic x(3) value "nao".

       procedure division.

       PGM-1.
          perform inicio.
          perform principal until fim-arq = "sim".
          perform fim.
          stop run.

       inicio.
          open input cadalu
           output aprov reprov.

       principal.
          read cadalu at end move "sim" to fim-arq.
          perform separar.

       separar.
       if media-ent > 6 or media-ent = 6
            perform gravaprov.

        if media-ent < 6
            perform gravareprov.



       gravaprov.
        move num-ent to num-a.
        move nome-ent to nome-a.
        move media-ent to media-a.
        write reg-aprov.

       gravareprov.
        move num-ent to num-r.
        move nome-ent to nome-r.
        move media-ent to media-r.
        write reg-reprov.
       fim.
          close cadalu aprov reprov.
