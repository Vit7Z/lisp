;//////// отметка высоты ///////
(defun c:08-mark-hight

( / angl angl-1 jstfy line-1 line-2 line-3 line-4 line-5 nm pnt-1 pnt-ins pnt-txt txt xpnt-1 xpnt-ins ypnt-1 ypnt-ins)

(setvar "CMDECHO" 0)
(setvar "osmode" 0)

(if (= (tblsearch "layer" "building") nil)
	(entmakex 
		'((0 . "LAYER")
  	(100 . "AcDbSymbolTableRecord")
  	(100 . "AcDbLayerTableRecord")
  	(2 . "building")
  	(70 . 0) ;standard flags (bit-coded values): 1 = Layer is frozen
  	(62 . 2) ;color
  	(6 . "Continuous") ;linetype name
  	(290 . 1) ;plotting flag. If set to 0, do not plot this layer
  	(370 . -1)) ;lineweight enum value; line wide 0
	);entmakex
);if

(setvar "clayer" "building")

(if (= (tblsearch "block" "знак-высоты-1" ) nil)
	(progn
		
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(0 2) '(2 0) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(2 0) '(4 2) "")
		(setq line-3 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_.LINE" '(-1 0) '(4 0)	 "")
		(setq line-1 (entlast))
		(command "_.LINE" '(2 0) '(2 4) "")
		(setq line-4 (entlast))
		(command "_.LINE" '(2 4) '(11 4) "")
		(setq line-5 (entlast))

		(command "_block" "знак-высоты-1" '(-1 0) line-1 line-2	line-3	line-4	line-5 "")
	);progn
) ;if

(if (= (tblsearch "block" "знак-высоты-2" ) nil)
	(progn
	
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(0 2) '(-2 0) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-2 0) '(-4 2) "")
		(setq line-3 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_.LINE" '(1 0) '(-4 0) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(-2 0) '(-2 4) "")
		(setq line-4 (entlast))
		(command "_.LINE" '(-2 4) '(-11 4) "")
		(setq line-5 (entlast))
		
		(command "_block" "знак-высоты-2" '(1 0) line-1 line-2	line-3	line-4	line-5 "")
	);progn
) ;if

(setvar "osmode" 6199)
(setvar "orthomode" 1)
(command "_.undo" "_begin")

(setq pnt-1 (getpoint "\n”кажите точку уровн€\n")
			xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)

			pnt-ins (getpoint "\n”кажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)

			angl (atoi (angtos (angle pnt-1 pnt-ins)))
			txt "***,***"
);setq

(if (or (<= (abs (- 0 angl)) 45) ;направление вправо
				(<= (abs (- 360 angl)) 45)
		);or
	(setq angl-1 0
				pnt-ins (list xpnt-ins ypnt-1)
				pnt-txt (list (+ xpnt-ins 3) (+ ypnt-1 4))
				jstfy "_BL"
				nm "знак-высоты-1"
	);setq
);if

(if (< (abs (- 90 angl)) 45) ;направление вверх
	(setq angl-1 90
				pnt-ins (list xpnt-1 ypnt-ins)
				pnt-txt (list (- xpnt-1 4) (+ ypnt-ins 3))
				jstfy "_BL"
				nm "знак-высоты-1"
	);setq
);if

(if (<= (abs (- 180 angl)) 45) ;направление влево
	(setq angl-1 0
				pnt-ins (list xpnt-ins ypnt-1)
				pnt-txt (list (- xpnt-ins 3) (+ ypnt-1 4))
				jstfy "_BR"
				nm "знак-высоты-2"
	);setq
);if

(if (< (abs (- 270 angl)) 45) ;направление вниз
	(setq angl-1 270
				pnt-ins (list xpnt-1 ypnt-ins)
				pnt-txt (list (+ xpnt-1 4) (- ypnt-ins 3))
				jstfy "_BL"
				nm "знак-высоты-1"
	);setq
);if

(setvar "osmode" 0)
(command "_.LINE" pnt-1 pnt-ins "")
(command "_TEXT" "_J" jstfy pnt-txt 2.5 angl-1 txt)
(command "_insert" nm "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-1 pnt-ins)

(setvar "clayer" "0")
(setvar "CMDECHO" 1)
(command "_.undo" "_end")
(setvar "osmode" 6199)

(princ)
(gc)
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////