;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// нумерация                                                    //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:09-cgv-numbering-items-02-delta-incr

( / adoc crnt-obj data data-txt dcl-id dlt-01 txt-tmp)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(if (< (setq dcl-id (load_dialog "dia-09-cgv-numbering-items-02-delta-incr.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_09_cgv_numbering_items_delta" dcl-id))
		(exit)
);if

(action_tile "txt-01"
  (strcat "(setq dlt-01 (get_tile \"txt-01\"))"
  				"(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq dlt-01 (atoi dlt-01));setq

(while (/= (setq crnt-obj (car (entsel "\nВыберите №\n"))) nil)

	(setq	data (entget crnt-obj)
	
				data-txt (assoc 1 data)
				
				txt-tmp (+ (atoi (cdr data-txt)) dlt-01)
				
				txt-tmp (cons 1 (itoa txt-tmp))
				
				data (subst	txt-tmp data-txt data)
	);setq

	(entmod data)

);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////