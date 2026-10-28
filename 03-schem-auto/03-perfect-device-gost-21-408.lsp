;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-perfect-device-gost-21-408

( / adoc angl line-1 pnt-drct pnt-obj x-pnt-obj y-pnt-obj)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(while (/= (setq	pnt-obj (getpoint "\n”кажите точку\n")) nil)
	(setq	pnt-drct (getpoint "\n”кажите направление\n")
				angl (atoi (angtos (angle pnt-obj pnt-drct))) ; угол вставки
				x-pnt-obj (nth 0 pnt-obj)
				y-pnt-obj (nth 1 pnt-obj)
	);setq
	
	(cond
		((and (<= angl 315) (>= angl 225));вниз
			(setq pnt-drct (list x-pnt-obj (- y-pnt-obj 5)));setq
		);=
		
		((and (< angl 225) (> angl 135));влево
			(setq pnt-drct (list (- x-pnt-obj 5) y-pnt-obj));setq
		);=
		
		((and (<= angl 135) (>= angl 45));вверх
			(setq pnt-drct (list x-pnt-obj (+ y-pnt-obj 5)));setq
		);=
			
		((or (> angl 315) (< angl 45));вправо
			(setq pnt-drct (list (+ x-pnt-obj 5) y-pnt-obj));setq
		);=
	);cond
	
	(setvar "celweight" 60)
	(setvar "osmode" 0)
	
	(setq	line-1
		(entmake
			(list
				(cons 0 "LINE")
				(cons 100  "AcDbEntity")
				(cons 100  "AcDbLine")
				(cons 8 "0")
				(cons 10 pnt-obj)
				(cons 11 pnt-drct)
			);list
		);entmake
	);setq
	
	(setvar "osmode" 6199)
	(setvar "celweight" -1)
);while

(setvar "celweight" -1)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////////
