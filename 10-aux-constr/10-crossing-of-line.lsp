;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ïåğåñå÷åíèå ëèíèé                                            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:10-crossing-of-line

( / adoc angl-lin-e angl-lin-s arc-1 clr-lin data-lin end-pnt-lin lin-sel lwr-lin pi pnt-1 pnt-2 pnt-ins st-pnt-lin thick-lin typ-lin xpnt-ins ypnt-ins)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(while (/= (setq lin-sel (entsel "\nÂûáåğèòå ëèíèş\n")) nil)
	(setq pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n")	
				typ-lin (cdr (assoc 0 (entget (car lin-sel))))
				data-lin (entget (car lin-sel))
	);setq
	
	(if (= typ-lin "LINE")
		(setq st-pnt-lin (cdr (assoc 10 (entget (car lin-sel))))
					end-pnt-lin (cdr (assoc 11 (entget (car lin-sel))))
					lwr-lin (cdr (assoc 8 (entget (car lin-sel))))
					thick-lin (cdr (assoc 370 (entget (car lin-sel))))
					clr-lin (assoc 62 (entget (car lin-sel))) ;color
					pi 3.14159265359					
					angl-lin-s (angle st-pnt-lin end-pnt-lin)	
		);setq
	);if

	(if (= thick-lin nil)
		(setq thick-lin -1);setq
	);if

	(if (and (> angl-lin-s (* pi 0.5)) (< angl-lin-s (* pi 1.5)))
		(setq angl-lin-s (- angl-lin-s pi));setq
	);if

	;definition of color
	(if (= clr-lin nil) 
		(setq clr-lin 256) ;color by layer
		
		(setq clr-lin (cdr (assoc 62 (entget (car lin-sel)))));setq
	);if

	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
					
				angl-lin-e (+ angl-lin-s pi) 
					
				pnt-1 (polar pnt-ins angl-lin-s 1)
				pnt-2 (polar pnt-ins angl-lin-e 1)
	);setq
	
	(setvar "osmode" 0)

	(setq arc-1
		(entmakex
			(list
				'(0 . "ARC")
				'(100 . "AcDbCircle")
				'(100 . "AcDbArc")
				(cons 62 clr-lin)
				(cons 8 lwr-lin)
				(cons 370 thick-lin) ;thickness
				
				(cons 10 pnt-ins)
				(cons 40 1) ;radius
				(cons 50 angl-lin-s)
				(cons 51 angl-lin-e)
			);list
		);entmake
	);setq

	(command "_break" lin-sel "_F" pnt-1 pnt-2)

	(setvar "osmode" 6199)
);while


(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ÊÎÍÅÖ ÏĞÎÃĞÀÌÌÛ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////