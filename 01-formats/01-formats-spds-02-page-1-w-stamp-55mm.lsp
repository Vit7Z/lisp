;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 01-formats-spds-02-page-1-w-stamp-55mm

(data-stamp data-format / adoc angl block-name-format block-name-stamp dlt-x dlt-y pnt-1 pnt-2 pnt-ins-stamp pnt-txt-30 pnt-txt-31 pnt-txt-32 txt-011 txt-30 txt-31 txt-32 xpnt-1 ypnt-1)

(setq block-name-stamp (cdr (assoc 1 data-stamp))
			txt-011 (cdr (assoc 2 data-stamp))
			
			block-name-format (cdr (assoc 1 data-format))
			dlt-y (cdr (assoc 2 data-format));высота формата
			dlt-x (cdr (assoc 3 data-format));ширина формата
);setq

(setq pnt-1 (getpoint "\nУкажите точку вставки\n")
      xpnt-1 (nth 0 pnt-1)
      ypnt-1 (nth 1 pnt-1)
      pnt-2 (getpoint "\nУкажите направление\n")

      angl (atoi (angtos (angle pnt-1 pnt-2))) ; угол направления
);setq

;;;; рисуем вертикально, вверх от точки указания
(if (and (<= angl 135) (>= angl 45))
	(setq xpnt-1 (- xpnt-1 40)
				ypnt-1 (+ ypnt-1 40)
	);setq
);if

;;;; рисуем горизонтально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
	(setq xpnt-1 (- xpnt-1 (+ dlt-x 40)));setq
);if

;;;; рисуем вертикально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
	(setq xpnt-1 (- xpnt-1 40)
				ypnt-1 (- ypnt-1 dlt-y)
	);setq
);if

(setvar	"OSMODE" 0)

(command "_insert" block-name-format "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list xpnt-1 ypnt-1))

(if (/= txt-011 0);точки вставки текста, если рисуем штамп
	(progn
		(setvar	"osmode" 0)
		(setq xtmp (+ (+ xpnt-1 40) dlt-x)
					pnt-ins-stamp (list (- xtmp 5) (+ ypnt-1 5))
					pnt-txt-30 (list (- xtmp 90) (+ ypnt-1 12.5))
					pnt-txt-31 (list (- xtmp 32.5) (+ ypnt-1 25))
					pnt-txt-32 (list (- xtmp 15) (+ ypnt-1 25))
		);setq

		(command "_insert" block-name-stamp "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp) ; вставка блока

		(setq txt-30
			(entmakex
				(list
					'(0 . "MTEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbMText")
					 (cons 10 pnt-txt-30) ; нач точка текста
					'(1 . "**777**") ; содержание текста
					'(40 . 2.5) ; высота текста
					'(41 . 69) ; растяжение текста
					'(42 . 69) ; ширина текста
					'(71 . 5) ; гориз выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 (getvar "textstyle")) ; стиль текста
				) ; end of list
			); entmakex
		); setq

		(setq txt-31
			(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 pnt-txt-31) ; нач точка текста
					 (cons 11 pnt-txt-31) ; нач точка текста
					'(1 . "*2*") ; содержание текста
					'(40 . 3.5) ; высота текста
					'(41 . 1) ;растяжение текста
					'(50 . 0) ;поворот текста
					'(72 . 1) ;гориз выравнивание текста
					'(73 . 2) ;верт выравнивание текста
					'(370 . -1) ;толщина текста
					 (cons 7 (getvar "textstyle"));стиль текста
				) ;list
			);entmakex
		); setq

		(setq txt-32
			(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 pnt-txt-32) ; нач точка текста
					 (cons 11 pnt-txt-32) ; нач точка текста
					'(1 . "*1*") ; содержание текста
					'(40 . 3.5) ; высота текста
					'(41 . 1) ; растяжение текста
					'(50 . 0) ; поворот текста
					'(72 . 1) ; гориз выравнивание текста
					'(73 . 2) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 (getvar "textstyle")) ; стиль текста
				) ; end of list
			); entmakex
		); setq

	);progn
);if

(command "_regenall")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////