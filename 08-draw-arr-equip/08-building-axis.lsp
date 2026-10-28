;/////////////////////////////////////////////////////////////////////////////////////////
;/////// рисование оси здани€ ////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////

(defun c:08-building-axis

( / adoc angl crcl-1 line-1 pnt-2 pnt-3 pnt-drctn pnt-ins txt-1 xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "osmode" 6199)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(if (= (tblsearch "layer" "building") nil)
	(command "_layer" "—оздать" "building" "“ип" "Continuous" "building" "÷вет" 2 "building" "”становить" "building" "");создаем слой
);if

(if (= (tblsearch "ltype" "acad_iso10w100") nil)
	(command "_linetype" "_l" "acad_iso10w100" "acadiso.lin" "") ;загружаем, если нет
);if

(setq pnt-ins (getpoint "\n”кажите первую точку оси\n")
			pnt-drctn (getpoint "\n”кажите вторую точку оси\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			xpnt-drctn (nth 0 pnt-drctn)
			ypnt-drctn (nth 1 pnt-drctn)
			angl (atoi (angtos (angle pnt-ins pnt-drctn)))
);setq

(cond																;сравниваем значение angl
	;вверх
	((and (<= angl 135) (>= angl 45)) ;вверх
		(progn
			(setq pnt-2 (list xpnt-ins ypnt-drctn) ;втора€ точка отрезка
					pnt-3 (list xpnt-ins (+ ypnt-drctn 5)) ;точка окружности и текста
			);setq
		);progn
	);услови€

	;влево
	((and (<= angl 225) (>= angl 135))	;влево
		(progn
			(setq pnt-2 (list xpnt-drctn ypnt-ins) ;втора€ точка отрезка
						pnt-3 (list (- xpnt-drctn 5) ypnt-ins) ;точка окружности и текста
			);setq
		);progn
	);услови€

	;dybp
	((and (<= angl 315) (>= angl 225))	;вниз
		(progn
			(setq pnt-2 (list xpnt-ins ypnt-drctn) ;втора€ точка отрезка
						pnt-3 (list xpnt-ins (- ypnt-drctn 5)) ;точка окружности и текста
			);setq
		);progn
	);услови€

	(progn			;вправо
		(setq pnt-2 (list xpnt-drctn ypnt-ins) ;втора€ точка отрезка
					pnt-3 (list (+ xpnt-drctn 5) ypnt-ins) ;точка окружности и текста
		);setq
	);progn
);cond


;рисуем линию
(setvar "osmode" 0)

(setq line-1
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 pnt-ins)
			(cons 11 pnt-2)
			'(8 . "building")
			'(6 . "acad_iso10w100")
			'(48 . 0.7)
		);list
	);entmakex
);setq

(setq line-1 (entlast))

(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      (cons 10 pnt-3) ;нач точка текста
      (cons 11 pnt-3) ;нач точка текста
      (cons 1 "***") ;содержание текста
      '(40 . 5) ;высота текста
      '(41 . 1) ;раст€жение текста
      '(50 . 0) ;поворот текста
      '(72 . 1) ;гориз выравнивание текста
      '(73 . 2) ;верт выравнивание текста
      '(370 . -1) ;толщина текста
       (cons 7 (getvar "textstyle")) ;стиль текста
       '(8 . "building")
    );list
  );entmakex
);setq

(setq txt-1 (entlast))

;круг
(setq crcl-1
	(entmakex
		(list
			'(0 . "CIRCLE")
			'(100 . "AcDbCircle")
			(cons 10 pnt-3)
			'(40 . 5)
			'(8 . "building")
		);list
	);entmakex
);setq

(setq crcl-1 (entlast))

(setvar "orthomode" 1)

(setvar "osmode" 6199)

(command "_.COPY" line-1 txt-1 crcl-1 "" "Ќесколько" pnt-ins);

(setvar "copymode" 0)

(vla-endundomark adoc)

(princ)
(gc)
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////