;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ссылки на листы                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:02-reference

( / adoc counter data-obj list-item new-txt original-obj original-txt temp-char tmp-obj type-obj)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)

(setvar "osmode" 0)

(setq original-obj (entget (car (entsel "\nВыберите текст\n"))) ;выбираем текст и его содержимое	
			original-txt (assoc 1 original-obj)
			counter 1
			list-item ""
);setq

(while (/= nil (setq tmp-obj (entsel "\nВыберите № стр.\n")))

	;определяем тип выбранного примтива
	(setq data-obj (entget (car tmp-obj))
				type-obj (cdr (assoc 0 data-obj))
	);setq
	
	(if (or (= type-obj "TEXT") (= type-obj "MTEXT"))	
		(progn
			(setq temp-char (cdr (assoc 1 data-obj)));setq
			
			(if (= counter 1)
				(setq list-item temp-char);setq
			);if
			
			(if (> counter 1)
				(setq list-item (strcat list-item ", " temp-char));setq
			);if
			
			(setq counter (1+ counter));setq
			
		);progn
	);if

	(if (= type-obj "INSERT")	
		(alert "Для блока - доделать!!!");progn
	);if

);while


(if (= counter 2)
	(setq new-txt "См. лист ");setq
	(setq new-txt "См. листы ");setq
);if

(setq new-txt (strcat new-txt list-item)
			new-txt (cons 1 new-txt)
			original-obj (subst	new-txt original-txt original-obj)
);setq

(entmod original-obj)

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)

(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////