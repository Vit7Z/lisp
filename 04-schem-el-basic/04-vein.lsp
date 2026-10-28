;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// стрелки                                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun c:04-vein

( / adoc dcl-id list-01 lngth-ln)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "8" "10" "12" "17" "20"));setq

(if (< (setq dcl-id (load_dialog "dia-04-vein.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_vein" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)

(action_tile "txt-01"
  (strcat "(setq lngth-ln (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq lngth-ln (atoi lngth-ln))

(04-vein-01 lngth-ln)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)

(princ)
)

;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// стрелки                                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////

(defun 04-vein-01

(lngth-ln / angl angl-txt pnt-2 pnt-drctn pnt-ins pnt-ins-txt xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setvar "textstyle" "standard")

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq	pnt-drctn	 (getpoint "\nУкажите точку направления\n")
				xpnt-ins	 (nth 0 pnt-ins)
				ypnt-ins	 (nth 1 pnt-ins)
				xpnt-drctn (nth 0 pnt-drctn)
				ypnt-drctn (nth 1 pnt-drctn)
				angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))			 
	);setq

	(cond
	
		((and (<= angl 135) (>= angl 45)) ;вверх
			(setq pnt-2 (list xpnt-ins (+ ypnt-ins lngth-ln))
						pnt-ins-txt (list xpnt-ins (+ ypnt-ins 1))
						angl-txt 90
			);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq pnt-2 (list (- xpnt-ins lngth-ln) ypnt-ins)
						pnt-ins-txt (list (- xpnt-ins (- lngth-ln 1)) ypnt-ins)
						angl-txt 0
			);setq
		);=

		((and (<= angl 315) (>= angl 225)) ;вниз
			(setq pnt-2 (list xpnt-ins (- ypnt-ins lngth-ln))
						pnt-ins-txt (list xpnt-ins (- ypnt-ins (- lngth-ln 1)))
						angl-txt 90
			);setq
		);=

		((or (<= angl 45) (>= angl 315)) ;вправо
			(setq pnt-2 (list (+ xpnt-ins lngth-ln) ypnt-ins)
						pnt-ins-txt (list (+ xpnt-ins 1) ypnt-ins)
						angl-txt 0
			);setq
		);=
		
	);end cond

	(setvar "osmode" 0)
	(command "_line" pnt-ins pnt-2 "")
	(command "_text" "_bl" pnt-ins-txt 2.5 angl-txt "*****")
	(setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
