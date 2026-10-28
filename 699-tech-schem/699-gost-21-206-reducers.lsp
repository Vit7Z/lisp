;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// переход                                                      //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:699-gost-21-206-reducers

( / adoc dcl-id lin-1 lin-2 lin-3 opt-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if (< (setq dcl-id (load_dialog "dia-699-gost-21-206-reducers.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_699_gost_21_206_reducers" dcl-id))
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

(if	(= (tblsearch "block" "переход-гост-21-206-схтх") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_line" '(0 1.5) '(0 -1.5) "")
    (setq lin-1 (entlast))
    
    (command "_line" '(0 1.5) '(6 0) "")
    (setq lin-2 (entlast))
    
    (command "_line" '(0 -1.5) '(6 0) "")
    (setq lin-3 (entlast))
    
		(command "_block" "переход-гост-21-206-схтх" '(0 0) lin-1 lin-2 lin-3 "");command
  ) ; конец progn
);if	

(setvar "osmode" 6199)

(cond
	((= opt-01 "01") (opt-01-699-gost-21-206-reducers));=
	((= opt-01 "02") (opt-02-699-gost-21-206-reducers));=
	((= opt-01 "03") (opt-03-699-gost-21-206-reducers));=
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
(defun opt-01-699-gost-21-206-reducers

( / angl-blck pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-blck (angtos (angle pnt-ins pnt-drctn) 1)
  );setq
   
  (setvar "osmode" 0)

  (command "_insert" "переход-гост-21-206-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun opt-02-699-gost-21-206-reducers

( / angl-drct pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-drct (angle pnt-ins pnt-drctn) ;угол в радианах, строка
			  pnt-ins (polar pnt-ins angl-drct 3.4641016)			  
			  angl-drct (angtos (+ angl-drct 3.1415926) 1)
  );setq
  
  (setvar "osmode" 0)

  (command "_insert" "переход-гост-21-206-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-drct pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun opt-03-699-gost-21-206-reducers

( / angl-blck angl-drct pnt-drctn pnt-ins)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn (getpoint "\nУкажите точку направления\n")
			  angl-blck (angtos (angle pnt-ins pnt-drctn) 1)			  
			  angl-drct (+ (angtof angl-blck 3) 3.1415926)			  
			  pnt-ins (polar pnt-ins angl-drct 1.7320508)			  
  );setq
  
  (setvar "osmode" 0)

  (command "_insert" "переход-гост-21-206-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
  (setvar "osmode" 6199)
);while

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
