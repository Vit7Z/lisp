;/////////////////// рисование контура на рассто€нии мм от крайних точек, рассто€ние вводитс€ с клавиатуры ////////////////////////////////
(defun c:10-cntr-dist-inpt-3

( / adoc pnt-1 pnt-2 pnt-rctngl-1 pnt-rctngl-2 x-pnt-1 x-pnt-2 y-pnt-1 y-pnt-2)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo
  
(setvar "osmode" 6199)
(setvar "celtscale" 0.4)
(setvar "celtype" "acad_iso02w100")

(command "_layer" "”становить" "0" "")

(setq	pnt-1 (getpoint "\n”кажите левую точку\n")         
			pnt-2 (getpoint "\n”кажите правую точку (по диагонали от левой)\n")       
);setq

(setq	x-pnt-1 (nth 0 pnt-1)
			y-pnt-1 (nth 1 pnt-1)
			x-pnt-2 (nth 0 pnt-2)
			y-pnt-2 (nth 1 pnt-2)
);setq

(cond
	((= y-pnt-1 y-pnt-2) 
		(setq pnt-rctngl-1 (list x-pnt-1 (+ y-pnt-1 5))
					pnt-rctngl-2 (list x-pnt-2 (- y-pnt-2 5))
		);setq
	);
	
	((> y-pnt-1 y-pnt-2) 
		(setq pnt-rctngl-1 (list x-pnt-1 (+ y-pnt-1 5))
					pnt-rctngl-2 (list x-pnt-2 (- y-pnt-2 5))
		);setq
	);	
	
	((< y-pnt-1 y-pnt-2) 
		(setq pnt-rctngl-1 (list x-pnt-1 (- y-pnt-1 5))
					pnt-rctngl-2 (list x-pnt-2 (+ y-pnt-2 5))
		);setq
	);
);cond


(setvar "osmode" 0)
  
(command "_rectangle" pnt-rctngl-1 pnt-rctngl-2)

(setvar "celtscale" 1)
(setvar "celtype" "ByLayer")
(setvar "osmode" 6199)

(vla-endundomark adoc)
)
; /////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////////////