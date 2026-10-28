;/////// ************************************************************ ////////////////////
;/////// нумерация                                                    ////////////////////
;/////// ************************************************************ ////////////////////
(defun c:04-numbering-wiring-1

( / adoc crnt-obj dcl-id p1 p2 pnt-ins pnt-ins-txt pos-txt smbl-tmp str-01 str-prfx str-txt txt xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-04-numbering-wiring-1.dcl")) 0) ;ищем диалог
  (progn
	  (alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_numbering_wiring_1" dcl-id))
  (exit)
);if

(action_tile "but11"
  (strcat "(setq str-prfx nil)"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but12"
  (strcat "(setq str-prfx \"=\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but13"
  (strcat "(setq str-prfx \"+\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but14"
  (strcat "(setq str-prfx \"-\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

;;;;;;; получаем начальный номер /////////////////////////////////////////////////////////
(setq str-01 (entget (car (entsel "\nВыберите начальное обозначение\n")))
			str-01 (cdr (assoc 1 str-01))
			pos-txt 1
			txt ""
);setq

(repeat (strlen str-01)
	(setq smbl-tmp (substr str-01 pos-txt 1));setq
		
	(if (wcmatch smbl-tmp "#")
	  (setq txt (strcat txt smbl-tmp));setq
	);if

	(setq pos-txt (+ pos-txt 1));setq
);repeat

(setq str-01 (* (atoi txt) 100));setq

;;;;;;; рисуем обозначение жилы в месте указания /////////////////////////////////////////
(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq str-txt (itoa str-01)
				xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				pnt-ins-txt (list (+ xpnt-ins 1) ypnt-ins)
	);setq
	
	(setvar "osmode" 0)
	
	;;;;;;; стираем текст, если он есть ////////////////////////////////////////////////////
	(setq p1 (list xpnt-ins ypnt-ins);точки секущей линии
			  p2 (list (+ xpnt-ins 4) (+ ypnt-ins 3))
			  crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
  );setq

  (if (/= crnt-obj nil)
    (command "_erase" crnt-obj "")
  );if
	
	(if (/= str-prfx nil) 
    (setq str-txt (strcat str-prfx str-txt))
  );if
	
	(command "_text" "_bl" pnt-ins-txt 2.5 0 str-txt)
	(setvar "osmode" 6199)
	(setq	str-01 (+ str-01 1));setq
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
