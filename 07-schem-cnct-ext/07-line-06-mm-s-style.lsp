;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование линии 0.6мм дл€ спвп                               //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////

(defun c:07-line-06-mm-s-style

( / lin1-p2 lin2-p2 lin3-p2 line_1 line_2 line_3 pnt-1 pnt-2 pnt-3 pnt-l xpnt-1 xpnt-2 xpnt-3 ypnt-1 ypnt-2 ypnt-3)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
	
(setq pnt-1 (getpoint "\n”кажите лев. нижнюю точку жилы\n")
			xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)
			
			pnt-2 (getpoint "\n”кажите прав. нижнюю точку клеммы\n")
			xpnt-2 (nth 0 pnt-2)
			ypnt-2 (nth 1 pnt-2)
			
			pnt-3 (getpoint "\n”кажите прав. верхнюю точку клеммы\n")
			xpnt-3 (nth 0 pnt-3)
			ypnt-3 (nth 1 pnt-3)
			
			lin1-p2 (list (+ xpnt-2 2.5) ypnt-1)			
			lin2-p2 (list (+ xpnt-2 2.5) (+ ypnt-3 7))			
			lin3-p2 (list (+ xpnt-2 15) (+ ypnt-3 7))
);setq


;;;;;;;; лини€ 0.6 мм
(setq line_1
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 pnt-1)
			(cons 11 lin1-p2)
			'(370 . 60)
		);list
	);entmakex
);setq


;;;;;;;; лини€ 0.6 мм
(setq line_2
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 lin1-p2)
			(cons 11 lin2-p2)
			'(370 . 60)
		);list
	);entmakex
);setq


;;;;;;;; лини€ 0.6 мм
(setq line_3
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 lin2-p2)
			(cons 11 lin3-p2)
			'(370 . 60)
		);list
	);entmakex
);setq


;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(setq	ss1 (ssadd)		
			ss1 (ssadd line_1 ss1)	
			ss1 (ssadd line_2 ss1)
			ss1 (ssadd line_3 ss1)
);setq

(command "_pedit" "_M" ss1 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)

(vla-endundomark adoc)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(princ)
)
;;; //////////// конец программы ////////////////////////////////////////////////////////////////////////
