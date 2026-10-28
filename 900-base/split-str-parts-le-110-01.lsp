;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-le-110-01

(str-txt / box-txt len-txt-l len-txt-r pos-blank pos-blank-1 txt-l txt-smbl)

(setq box-txt (textbox (list (cons 1 str-txt)))
 			len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
);setq

;;;;;;; ///////// длина текста меньше 108 мм
(if (< len-txt-r 107)
	(setq list-901 (vl-list* str-txt list-901));setq
);if

;;;;;;; ///////// длина текста больше 108 мм
(if (>= len-txt-r 107)
	(progn
		(while (> len-txt-r 107)
			(setq txt-l ""
						len-txt-l 0
						pos-blank 1
			);setq
			
			;******* цикл по обрезке
			(while (< len-txt-l 107)
				(setq txt-l (substr str-txt 1 pos-blank);отсекаем слева
							txt-smbl (substr str-txt pos-blank 1)
							
							box-txt (textbox (list (cons 1 txt-l)))
							len-txt-l (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
							pos-blank (+ pos-blank 1)
				);setq
				 
				(if (or (= txt-smbl " ") (= txt-smbl "-"))
					(setq pos-blank-1 (- pos-blank 1));setq
				);if
			);while
						
			(setq list-901 (reverse list-901)
						txt-l (substr str-txt 1 pos-blank-1)
						str-txt (substr str-txt (+ pos-blank-1 1))
						box-txt (textbox (list (cons 1 str-txt)))
 						len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
 						list-901 (reverse (vl-list* txt-l list-901))
			);setq
		);while

		(setq list-901 (reverse list-901)
					list-901 (vl-list* str-txt list-901)
					list-901 (reverse list-901)
		);setq
	);progn
);if

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
