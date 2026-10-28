;/////// ************************************************************ //////////////////////////////////////////////////
;/////// нумерация                                                    //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun c:09-cgv-numbering-items-01-seq

( / adoc crnt-obj data data-txt dcl-id start-num txt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq start-num (atoi (getstring "\nВведите начальное значение\n")));setq

(while (/= (setq crnt-obj (car (entsel "\nВыберите текст\n"))) nil)

	(setq	data (entget crnt-obj)
				data-txt (assoc 1 data)
				
				txt (itoa start-num)
				txt (cons 1 txt)
				
				data (subst	txt data-txt data)
	);setq

	(entmod data)

	(setq start-num (+ 1 start-num));setq
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////