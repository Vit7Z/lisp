;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// направление потока воздуха                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-stream-direction-gost-21-205-gas

( / adoc dcl-id lin-1 lin-2 lin-3 opt-01 pnt1 pnt2 pnt3)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if (< (setq dcl-id (load_dialog "dia-699-stream-direction-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_699_gost_21_205_stream_direction" dcl-id))
		(exit)
);if

(action_tile "txt-01"
  (strcat "(setq opt-01 \"01\")"
          "(done_dialog)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq opt-01 \"02\")"
          "(done_dialog)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq opt-01 \"03\")"
          "(done_dialog)");srcat
);action_tile

(action_tile "accept"
  (strcat "(setq opt-01 \"01\")"
          "(done_dialog)");srcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setvar "cmdecho" 0)
(setvar "osmode" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "направление-потока-газа-схтх") nil);создаем блок
  (progn
		(setq pnt1 (polar '(0 0) (angtof "90" 0) 2)
					pnt2 (polar pnt1 (angtof "330" 0) 4)
					pnt3 (polar '(0 0) (angtof "270" 0) 2)
   	);setq

    (command "_line" pnt1 pnt2 "")
    (setq lin-1 (entlast))
    
    (command "_line" pnt2 pnt3 "")
    (setq lin-2 (entlast))
    
    (command "_line" pnt3 pnt1 "")
    (setq lin-3 (entlast))

		(command "_block" "направление-потока-газа-схтх" '(0 0) lin-1 lin-2 lin-3 "");command
  );progn
);if

(cond
	((= opt-01 "01") (opt-01-699-stream-direction-gost-21-205-gas));=
	((= opt-01 "02") (opt-02-699-stream-direction-gost-21-205-gas));=
	((= opt-01 "03") (opt-03-699-stream-direction-gost-21-205-gas));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun opt-01-699-stream-direction-gost-21-205-gas

( / angl-blck pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-blck (angtos (angle pnt-ins pnt-drctn) 1)
  );setq
   
  (setvar "osmode" 0)

  (command "_insert" "направление-потока-газа-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun opt-02-699-stream-direction-gost-21-205-gas

( / angl-drct pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-drct (angle pnt-ins pnt-drctn) ;угол в радианах, строка
			  pnt-ins (polar pnt-ins angl-drct 3.4641016)			  
			  angl-drct (angtos (+ angl-drct 3.1415926) 1)
  );setq
  
  (setvar "osmode" 0)

  (command "_insert" "направление-потока-газа-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-drct pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun opt-03-699-stream-direction-gost-21-205-gas

( / angl-blck angl-drct pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-blck (angtos (angle pnt-ins pnt-drctn) 1)			  
			  angl-drct (+ (angtof angl-blck 3) 3.1415926)			  
			  pnt-ins (polar pnt-ins angl-drct 1.7320508)			  
  );setq
  
  (setvar "osmode" 0)

  (command "_insert" "направление-потока-газа-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
