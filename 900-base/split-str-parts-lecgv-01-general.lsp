;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-lecgv-01-general

(str-701 str-702 str-703 str-99 pnt-ins / cntr-1 list-701 list-702 list-703 list-901 nmbr-ln st-1 st-2 st-3 str-txt x-pnt-ins y-pnt-ers y-pnt-ins y-pnt-ln y-pnt-txt)

;str-702 обозначение (ГОСТ, Ту) - для труб, материалов
;str-703 примечание

(09-cgv-le-empty-line-02)

(setvar "textstyle" "Standard")
(setvar "osmode" 0)
(setvar "cmdecho" 0)

(setq x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
	 		y-pnt-txt y-pnt-ins
	 		y-pnt-ln y-pnt-ins
	 		y-pnt-ers y-pnt-ins
);setq

(if (/= str-702 nil)
	(split-str-parts-lecgv-060-01 str-702);
);if

(setq list-702 list-901
			list-901 nil
);setq

(if (/= str-703 nil)
	(split-str-parts-lecgv-020-01 str-703);
);if

(setq list-703 list-901
			list-901 nil
);setq

(split-str-parts-lecgv-065-01 str-701);

(setq list-701 list-901
			list-901 nil
);setq

(setq nmbr-ln (max (length list-701) (length list-702) (length list-703)));setq

(setvar "cmdecho" 0)
(setvar "osmode" 0)

;удаление существующих строк и линий
(setq st-1 (ssget "_c" (list (- x-pnt-ins 9.5) (- y-pnt-ins 2)) (list (- x-pnt-ins 5.5) (- y-pnt-ins 6))));позиция

(if (= st-1 nil) 
  (command "_text" "_MC" (list (- x-pnt-ins 7.5) (- y-pnt-ins 4)) 2.5 0 "**1")
);if

(setq st-1 (ssget "_c" (list (+ x-pnt-ins 128) (- y-pnt-ins 2)) (list (+ x-pnt-ins 132) (- y-pnt-ins 6))));кол

(if (= st-1 nil) 
  (command "_text" "_MC" (list (+ x-pnt-ins 130) (- y-pnt-ins 4)) 2.5 0 "**2")
);if

(repeat (+ nmbr-ln 1)
	(setq st-1 (ssget "_c" (list (+ x-pnt-ins 59.5) (- y-pnt-txt 2)) (list (+ x-pnt-ins 123) (- y-pnt-ers 4)))
				st-2 (ssget "_c" (list (+ x-pnt-ins 136) (- y-pnt-ins 2)) (list (+ x-pnt-ins 148) (- y-pnt-ers 4)))
				st-3 (ssget "_c" (list (+ x-pnt-ins 152) (- y-pnt-ins 2)) (list (+ x-pnt-ins 168) (- y-pnt-ers 4)))
	);setq

	(if (/= st-1 nil) (command "_erase" st-1 ""));if
	(if (/= st-2 nil) (command "_erase" st-2 ""));if
	(if (/= st-3 nil) (command "_erase" st-3 ""));if
	
	(setq y-pnt-ers (- y-pnt-ers 8));setq
);repeat

;печатаем линии ПЭ
(setq nmbr-ln (+ nmbr-ln 1));setq

(repeat nmbr-ln
	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ln))
  (setq y-pnt-ln (- y-pnt-ln 8));setq
);repeat

;графа шириной 60 мм
(if (/= str-702 nil)
	(progn
		(setq cntr-1 0);setq
		
		(repeat (length list-702)
			(setq str-txt (nth cntr-1 list-702));setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-txt 4)) 2.5 0 str-txt)			
			(setq y-pnt-txt (- y-pnt-txt 8)
						cntr-1 (+ cntr-1 1)
			);setq
		);repeat
	);progn
);if
	
;графа шириной 65 мм
(setq cntr-1 0
			y-pnt-txt y-pnt-ins
);setq

(repeat (length list-701)
	(setq str-txt (nth cntr-1 list-701));setq

	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-txt 4)) 2.5 0 str-txt)
	
  (setq y-pnt-txt (- y-pnt-txt 8)
  			cntr-1 (+ cntr-1 1)
  );setq
);repeat

(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- y-pnt-ins 4)) 2.5 0 str-99)

;графа шириной 20 мм
(if (/= str-703 nil)
	(progn
		(setq cntr-1 0
					y-pnt-txt y-pnt-ins
		);setq

		(repeat (length list-703)
			(setq str-txt (nth cntr-1 list-703));setq
		
			(command "_text" "_ML" (list (+ x-pnt-ins 151) (- y-pnt-txt 4)) 2.5 0 str-txt)
			
			(setq y-pnt-txt (- y-pnt-txt 8)
						cntr-1 (+ cntr-1 1)
			);setq
		);repeat
	);progn
);if
	
(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
