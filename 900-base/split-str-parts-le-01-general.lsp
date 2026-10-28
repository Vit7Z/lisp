;/////// ************************************************************ //////////////////////////////////////////////////
;/////// number - количество                                          //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun split-str-parts-le-01-general

(str-701 str-702 pnt-ins str-num / cntr-1 list-701 list-702 list-901 nmbr-ln st-1 str-txt x-pnt-ins y-pnt-ers y-pnt-ins 
y-pnt-ln y-pnt-txt)

(100-le-empty-line-02)

(setvar "textstyle" "Standard")
(setvar "cmdecho" 0)
(setvar "osmode" 0)

;str-701 - строка основная
;str-702 - строка примечаний

;разбиение текста примечаний на отрезки длиной 45 мм
;на выходе получили список
(if (/= str-702 nil)
	(progn
		(split-str-parts-le-045-01 str-702);
		(setq list-702 list-901);setq
	);progn
);if

(setq list-901 nil);setq

;разбиение текста основной строки на отрезки длиной 110 мм, на выходе получили список
(split-str-parts-le-110-01 str-701);
	
(setq list-701 list-901
			nmbr-ln (max (length list-701) (length list-702));количество строк
			
			x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
	 		y-pnt-txt y-pnt-ins
	 		y-pnt-ln y-pnt-ins
	 		y-pnt-ers y-pnt-ins
);setq

(setvar "osmode" 0)

;модификация количества
(setq st-1 (ssget "_c" (list (+ x-pnt-ins 117) (- y-pnt-ins 2)) (list (+ x-pnt-ins 113) (- y-pnt-ins 4))));setq

(if (= st-1 nil) 
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- y-pnt-ins 4)) 2.5 0 str-num)
);if

(repeat (+ nmbr-ln 1)
	(setq st-1 (ssget "_c" (list (- x-pnt-ins 0.4) (- y-pnt-ers 2)) (list (+ x-pnt-ins 109.4) (- y-pnt-ers 4))));setq
	(if (/= st-1 nil) (command "_erase" st-1 ""));if
	(setq y-pnt-ers (- y-pnt-ers 8));setq
);repeat

(setq nmbr-ln (+ nmbr-ln 1));setq

;печатаем линии ПЭ
(repeat nmbr-ln
	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ln))
  (setq y-pnt-ln (- y-pnt-ln 8));setq
);repeat

(setq cntr-1 0);setq

;печатаем основную строку
(repeat (length list-701)
	(setq str-txt (nth cntr-1 list-701));setq

	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-txt 4)) 2.5 0 str-txt)
	
  (setq y-pnt-txt (- y-pnt-txt 8)
  			cntr-1 (+ cntr-1 1)
  );setq
);repeat

(setq cntr-1 0
			y-pnt-txt y-pnt-ins
);setq


;печатаем примечание
(if (/= list-702 nil)
	(repeat (length list-702)
		(setq str-txt (nth cntr-1 list-702));setq
	
		(command "_text" "_ML" (list (+ x-pnt-ins 121) (- y-pnt-txt 4)) 2.5 0 str-txt)
		
		(setq y-pnt-txt (- y-pnt-txt 8)
					cntr-1 (+ cntr-1 1)
		);setq
	);repeat
);if

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
