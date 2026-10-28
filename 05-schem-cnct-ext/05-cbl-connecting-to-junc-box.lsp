;/////// *************************************************************//////////////////////////////
;/////// подключение кабеля к клеммам коробки                         //////////////////////////////
;/////// *************************************************************//////////////////////////////
(defun c:05-cbl-connecting-to-junc-box

( / adoc angl-1 angl-blk2 circle-1 direction dist-2 dist-3 dist-4 half-x hatch-1 line_1 line_2 
line_3 line_4 line-1 line-2 line-3 line-4 line-5 p1-lin1 p1-lin2 p2-lin1 p2-lin2 p-blk1 p-blk2 
p-crcl1 pnt-1 pnt-2 pnt-3 pnt-drct ss1 x-pnt-1 x-pnt-2 x-pnt-drct y-pnt-1 y-pnt-2 y-pnt-drct)

;dist-1 = 0 - длина жилы
;dist-2 = 1.5 - расстояние от точки вставки жилы до центра круга, обозначающего экран
;dist-3 = 3 - расстояние от точки вставки жилы до точки вставки сальника
;dist-4 = 10 - длина линии, проходящей через сальник

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

;проверяем и создаем блок "точка 1мм"
(if	(= (tblsearch "block" "точка-1мм") nil)
  (progn 
	  (command "_circle" '(0 0) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
	);progn
);if

;проверяем и создаем блок "ссвп-сальник-коробки"
(if (= (tblsearch "block" "ссвп-сальник-коробки") nil)
	(progn												
		(setvar "osmode" 0)
		(command "_line" '(-2 0) '(2 0) "")
		(setq line-1 (entlast))
		(command "_line" '(2 0) '(1 2) "")
		(setq line-2 (entlast))
		(command "_line" '(1 2) '(-1 2) "")
		(setq line-3 (entlast))
		(command "_line" '(-1 2) '(-2 0) "")
		(setq line-4 (entlast))
		(command "_line" '(0 0) '(0 2) "")
		(setq line-5 (entlast))
		(command "_block" "ссвп-сальник-коробки" '(0 0) line-1 line-2 line-3 line-4 line-5 "");command
	);progn
);if

(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\nУкажите 1 точку жил\n")
			x-pnt-1 (nth 0 pnt-1)
			y-pnt-1 (nth 1 pnt-1)
		
			pnt-2 (getpoint "\nУкажите 2 точку жил\n")
			x-pnt-2 (nth 0 pnt-2)
			y-pnt-2 (nth 1 pnt-2)
			
			pnt-3 (getpoint "\nУкажите точку экрана\n")

			pnt-drct (getpoint "\nУкажите направление\n")
			x-pnt-drct (nth 0 pnt-drct)
			y-pnt-drct (nth 1 pnt-drct)
				
			angl-1 (atoi (angtos (angle pnt-1 pnt-2)))
);setq

;определение вектора рисования
(if (or (<= angl-1 45) (>= angl-1 315));вправо
	(if (< y-pnt-1 y-pnt-drct)	       
		(setq direction "right-up");вверх
		
		(setq direction "right-down");вниз
	);if
);if

(if (and (<= angl-1 225) (>= angl-1 135));влево
	(if (< y-pnt-1 y-pnt-drct)
		(setq direction "left-up");вверх
			
		(setq direction "left-down");вниз
	);if
);if

(if (and (<= angl-1 315) (>= angl-1 225));вниз
	(if (< x-pnt-1 x-pnt-drct)
		(setq direction "down-right");вправо
			
		(setq direction "down-left");влево
	);if
);if

(if (and (<= angl-1 135) (>= angl-1 45));вверх
	(if (< x-pnt-1 x-pnt-drct)
		(setq direction "up-right");вправо
			
		(setq direction "up-left");влево
	);if
);if

(if (or (= direction "left-up") 
				(= direction "left-down") 
				(= direction "down-right")
				(= direction "down-left")
				(= direction "up-right")
				(= direction "up-left"))
	(alert "Не обработано.")
);if
	
(setvar "osmode" 0)

(if (= direction "right-up")
	(setq dist-2 1.5			
				dist-3 3				
				dist-4 10
				angl-blk2 0
  );setq
);if

(if (= direction "right-down")
	(setq dist-2 -1.5			
				dist-3 -3				
				dist-4 -10
				angl-blk2 180
  );setq
);if

(if (or (= direction "right-up") (= direction "right-down"))
	(setq half-x (* (- x-pnt-2 x-pnt-1) 0.5)
        	
        p-crcl1 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-2)) ;точка центра круга экрана
        	        	
        p-blk1 (list (+ (+ x-pnt-1 half-x) 1) (+ y-pnt-1 dist-2)) ;точка вставки блока "точка-1мм"
        	
        p-blk2 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-3)) ;точка вставки блока "ссвп-сальник-коробки"
        	
        p1-lin2 p-blk1 ;точки штриховой линии 1 от блока "точка-1мм"
        p2-lin2 (list (+ x-pnt-2 5) (+ y-pnt-1 dist-2))
  );setq
);if


;линия 0.6 мм
(setq line_1
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 pnt-1)
			(cons 11 pnt-2)
			'(370 . 60)
		);list
	);entmakex
);setq

;вставка блока "точка-1мм"
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 p-blk1)

;вставка блока "ссвп-сальник-коробки"
(command "_insert" "ссвп-сальник-коробки" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blk2 p-blk2)

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
			(cons 11 pnt-3)
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

;;;;;;;линия от линия 0.6 мм + перпендикулярно ей
(setq p1-lin1 (list (+ x-pnt-1 half-x) y-pnt-1)
      p2-lin1 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-4))
);setq

(setq line_4
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p1-lin1)
			(cons 11 p2-lin1)
		);list
	);entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;;; //////////////////////////// конец программы; /////////////////////////////
