;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// подвал схемы автоматизации, шкафы                            //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-basement-schem-auto-02-box
( / adoc dcl-id list-01 list-01-read-file pnt-1 pnt-2 pnt-txt str-01 txt-1 x-pnt-1 x-pnt-2 y-dlt-1 y-pnt-1 y-pnt-2)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "03-basement-schem-auto-02-box.txt" 1)

(setq list-01 list-01-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-03-basement-schem-auto-02-box.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_03_basement_schem_auto_02" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(set_tile "txt-01" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setvar	"osmode" 6199)

(setq pnt-1 (getpoint "\nУкажите верх сигналов\n")
			pnt-2 (getpoint "\nУкажите низ сигналов\n")
			
			x-pnt-1 (nth 0 pnt-1)
			y-pnt-1 (nth 1 pnt-1)
			
			x-pnt-2 (nth 0 pnt-2)
			y-pnt-2 (nth 1 pnt-2)
			
			y-dlt-1 (* (- y-pnt-1 y-pnt-2) 0.5)
			
			pnt-txt (list (- x-pnt-1 21) (- y-pnt-1 y-dlt-1))
);setq

(setvar "osmode" 0)

(command "_RECTANGLE" (list (- x-pnt-1 22) y-pnt-2) (list x-pnt-1 y-pnt-1))

(setq txt-1
	(entmakex
		(list
			'(0 . "MTEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbMText")
			(cons 10 pnt-txt)
			(cons 1 str-01) 
			'(40 . 2.5) 
			(cons 41 20)
			(cons 42 20) 
			'(71 . 4) 
			'(370 . -1) 
			(cons 7 (getvar "textstyle")) 
		);list
	);entmakex
);setq

(vla-endundomark adoc)

(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(setvar "CMDECHO" 1)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////