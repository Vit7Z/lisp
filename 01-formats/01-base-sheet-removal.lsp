;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// удаление листа                                               //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:01-base-sheet-removal

( / adoc crnt-primitive crnt-primitive-1 dlt-x dlt-y name-crnt-primitive pnt-1 pnt-2 set-obj-1 x-ins y-ins)

(setvar	"cmdecho" 1)
(setvar	"textstyle" "Standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(while (/= (setq crnt-primitive-1 (entsel "\nВыберите рамку листа\n")) nil) 

	(setq crnt-primitive (car crnt-primitive-1)
				name-crnt-primitive (cdr (assoc 2 (entget crnt-primitive)))
				
				x-ins (nth 1 (assoc 10 (entget crnt-primitive)));точка вставки блока
				y-ins (nth 2 (assoc 10 (entget crnt-primitive)))
	);setq
  
	(cond 
		((= name-crnt-primitive "а4-спдс-лист-1-верт") (setq dlt-x 210 dlt-y 297));=
		((= name-crnt-primitive "а4-спдс-лист-2-верт") (setq dlt-x 210 dlt-y 297));=
		((= name-crnt-primitive "а3-спдс-лист-1-гориз") (setq dlt-x 420 dlt-y 297));=
		((= name-crnt-primitive "а3-спдс-лист-2-гориз") (setq dlt-x 420 dlt-y 297));=
		((= name-crnt-primitive "а2-спдс-лист-1-гориз") (setq dlt-x 594 dlt-y 420));=
		((= name-crnt-primitive "а2-спдс-лист-2-гориз") (setq dlt-x 594 dlt-y 420));=
		
		((= name-crnt-primitive "а1-спдс-лист-1-гориз") (setq dlt-x 841 dlt-y 594));=
		((= name-crnt-primitive "а1-спдс-лист-2-гориз") (setq dlt-x 841 dlt-y 594));=
		
		((= name-crnt-primitive "а0-спдс-лист-1-гориз") (setq dlt-x 1189 dlt-y 841));=
		((= name-crnt-primitive "а0-спдс-лист-2-гориз") (setq dlt-x 1189 dlt-y 841));=
	);cond

	(setq pnt-1 (list (+ x-ins 40) y-ins)
      	pnt-2 (list (+ (+ x-ins dlt-x) 40) (+ y-ins dlt-y))
	);setq

	(setq set-obj-1 (ssget "_W" pnt-1 pnt-2));setq

	(command "_erase" set-obj-1 "")
	(command "_erase" crnt-primitive-1 "")
	
	(setq set-obj-1 nil)
);while

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar	"cmdecho" 1)
(setvar "orthomode" 1)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
