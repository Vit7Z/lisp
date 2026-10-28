;/////// *************************************************************//////////////////////////////////////////////////
;/////// рисование отрезка с точкой на конце                          //////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////
(defun c:04-len-segment-w-dot

( / adoc circle-1 hatch-1 line_1 pnt-1 pnt-2 x-pnt-1 x-pnt-2 y-pnt-1 y-pnt-2)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

;провер€ем и создаем блок "точка 1мм"
(if	(= (tblsearch "block" "точка-1мм") nil)
  (progn 
	  (command "_circle" '(0 0) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
	);progn
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(while (/= (setq pnt-1 (getpoint "\n”кажите начальную точку\n")) nil)
  (progn
		(setq x-pnt-1 (nth 0 pnt-1)
					y-pnt-1 (nth 1 pnt-1)
					
					pnt-2 (getpoint "\n”кажите конечнюю точку\n")
					x-pnt-2 (nth 0 pnt-2)
					y-pnt-2 (nth 1 pnt-2)
		);setq
	
		;;;;;;;лини€
		(setq line_1
			(entmakex
				(list
					'(0 . "LINE")
					'(100 . "AcDbLine")
					'(100 . "AcDbEntity")
					(cons 10 pnt-1)
					(cons 11 pnt-2)
				);list
			);entmakex
		);setq
		
		;вставка блока "точка-1мм"
		(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-2)
  );progn
);while
	
	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;;; //////////////////////////// конец программы; /////////////////////////////
