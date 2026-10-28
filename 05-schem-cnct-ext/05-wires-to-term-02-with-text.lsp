;///////*************************************************************************************///////
;/////// перенос жил и текста от прибора к клеммному р€ду,                                   ///////
;/////// жилы + текст располагаютс€ вниз от указанной точки                                  ///////
;///////*************************************************************************************///////
(defun c:05-wires-to-term-02-with-text

( / adoc circle-1 cntr-1 crnt-obj hatch-1 line-1 line-2 line-3 line-4 line-5 list-901 lngth-set 
num-1 num-2 pnt-ins set-primitives tmp-list)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

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

;провер€ем и создаем блок "ссвп-сальник-коробки"
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

(while (/= (setq set-primitives (ssget '((0 . "*text")))) nil)
  (progn
		(setvar "osmode" 6199)
		
		(setq pnt-ins (getpoint "\n”кажите точку вставки\n")					
					lngth-set (sslength set-primitives)
					cntr-1 0
					list-901 nil
					crnt-obj nil
		);setq
		
		;;;;;;;создаем набор из текстов и координат
		(repeat lngth-set
			(setq crnt-obj (entget (ssname set-primitives cntr-1)) 
						tmp-list (list (assoc 1 crnt-obj) (assoc 11 crnt-obj))				
						list-901 (vl-list* tmp-list list-901)
						cntr-1 (1+ cntr-1)
			);setq
		);repeat

		;;;;;;;сортируем набор по "x"
		(setq list-901 (vl-sort list-901 
			(function 
				(lambda (num-1 num-2) 
					(< (nth 1 (assoc 11 num-1)) (nth 1 (assoc 11 num-2))));lambda
				));vl-sort
		);setq
				
		(setvar "osmode" 0)
	
		(05-wires-to-term-02-with-text-01 pnt-ins lngth-set list-901)
  );progn
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)

;///////*************************************************************/////////////////////////////////////////
;//////////////////////////// конец //////////////////////////////////////////////////////////////////////////


;/////// *************************************************************////////////////////////////////////////
;/////// подключение кабел€ к клеммам коробки                         ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////
(defun 05-wires-to-term-02-with-text-01

(pnt-ins lngth-set list-901 / circle-1 cntr-2 dist-1 dist-2 dist-3 half-x line_1 line_2 line_3 line_4 
p1-lin1 p1-txt p2-lin1 p2-lin2 p2-lin3 p-blk1 p-blk2 p-crcl1 ss1 txt-crnt x-pnt-1 x-pnt-2 y-pnt-1)

(setq dist-1 -12 ;длина жилы
			dist-2 -13.5;рассто€ние от точки вставки жилы до центра круга, обозначающего экран
			dist-3 -15 ;рассто€ние от точки вставки жилы до точки вставки сальника

			x-pnt-1 (nth 0 pnt-ins)
			y-pnt-1 (nth 1 pnt-ins)

			x-pnt-2 (+ x-pnt-1 (* (- lngth-set 1) 5))
			half-x (* (- x-pnt-2 x-pnt-1) 0.5)
		
			p1-lin1 (list x-pnt-1 (+ y-pnt-1 dist-1)) ;точки линии 0,6 мм
      p2-lin1 (list x-pnt-2 (+ y-pnt-1 dist-1))
        	
      p-crcl1 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-2)) ;точка центра круга экрана
      p-blk1 (list (+ (+ x-pnt-1 half-x) 1) (+ y-pnt-1 dist-2)) ;точка вставки блока "точка-1мм"
        	
      p-blk2 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-3)) ;точка вставки блока "ссвп-сальник-коробки"        	
      p2-lin2 (list (+ x-pnt-2 5) (+ y-pnt-1 dist-2));точка штриховой линии 1 от блока "точка-1мм"
        	
      p2-lin3 (list (+ x-pnt-2 5) y-pnt-1) ;точки штриховой линии 2
);setq

(setvar "osmode" 0)

;вставка блока "точка-1мм"
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 p-blk1)

;вставка блока "ссвп-сальник-коробки"
(command "_insert" "ссвп-сальник-коробки" "_x" 1 "_y" 1 "_z" 1 "_r" 180 p-blk2)

;лини€ 0.6 мм
(setq line_1
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p1-lin1)
			(cons 11 p2-lin1)
			'(370 . 60)
		);list
	);entmakex
);setq

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

;лини€ экрана от круга экрана
(setq line_2
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p-blk1)
			(cons 11 p2-lin2)
			'(8 . "0")
			'(6 . "acad_iso02w100")
			'(48 . 0.1)
		);list
	);entmakex
);setq

;лини€ экрана к клемме
(setq line_3
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 p2-lin2)
			(cons 11 p2-lin3)
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

;;;;;;отрезки жил + текст
(setq cntr-2 0);setq

(repeat lngth-set
	(setq p1-lin1 (list x-pnt-1 y-pnt-1)
				p2-lin1 (list x-pnt-1 (+ y-pnt-1 dist-1))
				
				p1-txt (list x-pnt-1 (- y-pnt-1 11))
				txt-crnt (cdr (car (nth cntr-2 list-901)))
	);setq
			
	(command "_.line" p1-lin1 p2-lin1 "")
	
	(if (/= txt-crnt nil)
		(command "_text" "_bl" p1-txt 2.5 90 txt-crnt)
	);if
	
	(setq x-pnt-1 (+ x-pnt-1 5)
				cntr-2 (1+ cntr-2)
	);setq
);repeat

(setq x-pnt-1 (nth 0 pnt-ins));setq

;;;;;;;лини€ от лини€ 0.6 мм + перпендикул€рно ей
(setq p1-lin1 (list (+ x-pnt-1 half-x) (+ y-pnt-1 dist-1))
      p2-lin1 (list (+ x-pnt-1 half-x) (+ y-pnt-1 -22))
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

)
;///////*************************************************************/////////////////////////////////////////
;//////////////////////////// конец //////////////////////////////////////////////////////////////////////////
