;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// преобразование приборов с сэп в ссвп                         //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:05-seb-to-scec

( / adoc pnt-ins pnt-rot set-primitives)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 1)

(while (/= (setq set-primitives (ssget)) nil)
  (progn
		(setvar "osmode" 6199)
		(setq pnt-rot (getpoint "\n”кажите точку поворота\n")
					pnt-ins (getpoint "\n”кажите точку вставки\n")
		);setq
		(setvar "osmode" 0)
		(command "_copy" set-primitives "" pnt-rot pnt-rot)
		(command "_move" set-primitives "" pnt-rot pnt-ins)
		(command "_rotate" set-primitives "" pnt-ins 90)
		(setvar "osmode" 6199)
  );progn
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////////
