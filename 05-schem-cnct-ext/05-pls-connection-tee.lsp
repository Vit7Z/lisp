;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// рисование знака соединение тройниковое на ссвп               ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun c:05-pls-connection-tee

( / adoc line-1 line-2 pnt-ins)

(setvar "cmdecho" 0)
   
(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setq name_block "соединение-НСТ-ссвп");setq

;;;;;;; блок знак кабеля 15 мм
(if (= (tblsearch "block" name_block) nil)
	(progn
		(setvar "osmode" 0)
		(setvar "celweight" 120)
		(command "_line" '(0 0) '(0 -4) "")
		(setq line-1 (entlast))
		(command "_line" '(0 -2) '(2 -2) "")
		(setq line-2 (entlast))
		
		(command "_block" name_block '(0 0) line-1 line-2 "")
		(setvar "celweight" -1)
	);progn
);if

(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку оси\n"));setq

(setvar "osmode" 0)

(command "_insert" name_block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////
