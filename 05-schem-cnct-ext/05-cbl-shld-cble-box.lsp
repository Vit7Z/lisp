;;;;********************************************************************************************************************
;;;;////////////////////////// рисование экрана кабеля, выбор направления //////////////////////////////////////////////
;;;;********************************************************************************************************************
(defun c:05-cbl-shld-cble-box

( / adoc circle-1 direction dist-x1 dist-y1 dlt-x dlt-y hatch-1 line_2 line_3 p1-lin2 p2-lin2 p-crcl1 pnt-1 pnt-2 
pnt-drct ss1 xpnt-1 xpnt-2 xpnt-drct x-pnt-ins-1 x-pnt-ins-2 ypnt-1 ypnt-2 ypnt-drct y-pnt-ins-1)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

;проверяем и создаем блок точка 1мм
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

(setq pnt-1 (getpoint "\nУкажите точку кабеля\n") ; получение необходимых точек
			xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)

			pnt-2 (getpoint "\nУкажите середину клеммы заземления\n")
			xpnt-2 (nth 0 pnt-2)
			ypnt-2 (nth 1 pnt-2)

			pnt-drct (getpoint "\nУкажите направление\n")
			xpnt-drct (nth 0 pnt-drct)
      ypnt-drct (nth 1 pnt-drct)
      
      dlt-x (abs (- xpnt-1 xpnt-drct))
      dlt-y (abs (- ypnt-1 ypnt-drct))
);setq

(setvar "osmode" 0)

;;;;;;; определение вектора рисования
(if (< xpnt-1 xpnt-2)
	(if (> ypnt-1 ypnt-2)
		(if (> dlt-x dlt-y)
			(setq direction "horiz-left-down"
						dist-y1 -1
						dist-x1 -1.5
			);setq

			(setq direction "vert-right-up"
					dist-y1 1.5
					dist-x1 1
			);setq
		);if
		
		;< ypnt-1 ypnt-2
		(if (> dlt-x dlt-y)
			(setq direction "horiz-left-up"
						dist-y1 1
						dist-x1 -1.5
			);setq

			(setq direction "vert-right-down"
					dist-y1 -1.5
					dist-x1 1
			);setq
		);if
	);if
);if


(if (> xpnt-1 xpnt-2)
	(if (> ypnt-1 ypnt-2)
		(if (> dlt-x dlt-y)
			(setq direction "horiz-right-down"
						dist-y1 -1
						dist-x1 1.5
			);setq
			
			(setq direction "vert-left-up"
						dist-y1 1.5
						dist-x1 -1
			);setq
		);if
		
		;< ypnt-1 ypnt-2
		(if (> dlt-x dlt-y)
			(setq direction "horiz-right-up"
						dist-y1 1
						dist-x1 1.5
			);setq

			(setq direction "vert-left-down"
					dist-y1 -1.5
					dist-x1 -1
			);setq
		);if
	);if
);if


;;;;;;; жилы вертикально
(if (or (= direction "vert-right-up") 
				(= direction "vert-right-down")
 				(= direction "vert-left-up") 
 				(= direction "vert-left-down"));=
  (setq p-crcl1 (list xpnt-1 (+ ypnt-1 dist-y1))
        p1-lin2 (list (+ xpnt-1 dist-x1) (+ ypnt-1 dist-y1))
        p2-lin2 (list xpnt-2 (+ ypnt-1 dist-y1))
  );setq
);if

;;;;;;; жилы горизонтально
(if (or (= direction "horiz-left-down")
				(= direction "horiz-left-up")
				(= direction "horiz-right-down")
				(= direction "horiz-right-up"));=
  (setq p-crcl1 (list (+ xpnt-1 dist-x1) ypnt-1)
        p1-lin2 (list (+ xpnt-1 dist-x1) (+ ypnt-1 dist-y1))
        p2-lin2 (list (+ xpnt-1 dist-x1) ypnt-2)
  );setq
);if


;вставка блока "точка-1мм"
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 p1-lin2)

;круг экрана
(setq circle-1
	(entmakex
		(list
			'(0 . "CIRCLE")
			'(100 . "AcDbCircle")
			(cons 10 p-crcl1)
			'(40 . 1)
			'(8 . "0")
			'(6 . "acad_iso02w100")
			'(48 . 0.1)
		);list
	);entmakex
);setq

;линия экрана от круга экрана
(setq line_2
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p1-lin2)
			(cons 11 p2-lin2)
			'(8 . "0")
			'(6 . "acad_iso02w100")
			'(48 . 0.1)
		);list
	);entmakex
);setq

;линия экрана к клемме
(setq line_3
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p2-lin2)
			(cons 11 pnt-2)
			'(8 . "0")
			'(6 . "acad_iso02w100")
			'(48 . 0.1)
		);list
	);entmakex
);setq

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(setq	ss1 (ssadd)			
			ss1 (ssadd line_2 ss1)
			ss1 (ssadd line_3 ss1)
);setq

(command "_pedit" "_M" ss1 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;;;;********************************************************************************************************************
;;;;////////////////////////// конец                                      //////////////////////////////////////////////
;;;;********************************************************************************************************************