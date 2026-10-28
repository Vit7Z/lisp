;/////////////////// рисование контура на рассто€нии мм от крайних точек, рассто€ние вводитс€ с клавиатуры ////////////////////////////////
(defun c:10-cntr-dist-inpt-2

( / dist pnt-1 pnt-2 pnt-3 pnt-4 pnt-rctngl-1 pnt-rctngl-2 x-pnt-2 x-pnt-4 y-pnt-1 y-pnt-3)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo
  
(setvar "osmode" 6199)
(setvar "celtscale" 0.4)

(if (= (tblsearch "ltype" "acad_iso02w100") nil)
	(progn
		(command "_linetype" "_l" "acad_iso02w100" "acadiso.lin" "") ;загружаем, если нет
		(setvar "celtype" "acad_iso02w100")
	);progn
	
	(setvar "celtype" "acad_iso02w100")
);if

(command "_layer" "”становить" "0" "")

(setq	pnt-1 (getpoint "\n”кажите крайнюю верхнюю точку\n")         
			pnt-2 (getpoint "\n”кажите крайнюю левую точку\n")       
			pnt-3 (getpoint "\n”кажите крайнюю нижнюю точку\n")
			pnt-4 (getpoint "\n”кажите крайнюю правую точку\n")
			dist	(getint "\n”кажите рассто€ние\n")
);setq

(setq	y-pnt-1 (nth 1 pnt-1)
			x-pnt-2 (nth 0 pnt-2)
			y-pnt-3 (nth 1 pnt-3)
			x-pnt-4 (nth 0 pnt-4)
			pnt-rctngl-1 (list (- x-pnt-2 dist) (+ y-pnt-1 dist))
			pnt-rctngl-2 (list (+ x-pnt-4 dist) (- y-pnt-3 dist))
);setq

(setvar "osmode" 0)
(command "_rectangle" pnt-rctngl-1 pnt-rctngl-2)

(setvar "celtscale" 1)
(setvar "celtype" "ByLayer")
(setvar "osmode" 6199)

(vla-endundomark adoc)
)
; /////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////////////