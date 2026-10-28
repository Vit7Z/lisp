;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-lecgv-020-01

(str-txt / box-txt len-txt-l len-txt-r pos-blank pos-blank-1 txt-l txt-smbl)

(setq	box-txt (textbox (list (cons 1 str-txt)))
 			len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
);setq

;;;;;;; ///////// длина текста меньше 43 мм
(if (<= len-txt-r 19)
	(setq list-901 (vl-list* str-txt list-901));setq
);if

;;;;;;; ///////// длина текста больше 43 мм
(if (> len-txt-r 19)
	(progn
		(while (> len-txt-r 19)
			(setq txt-l ""
						len-txt-l 0
						pos-blank 1
						pos-blank-1 nil
			);setq
			
			;******* цикл по обрезке
			(while (< len-txt-l 19)
				(setq txt-l (substr str-txt 1 pos-blank);отсекаем слева
							txt-smbl (substr str-txt pos-blank 1)
							
							box-txt (textbox (list (cons 1 txt-l)))
							len-txt-l (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
							pos-blank (+ pos-blank 1)
				);setq
				 
				(if (= txt-smbl " ") (setq pos-blank-1 (- pos-blank 1)));if
				(if (and (>= len-txt-l 19) (= pos-blank-1 nil)) (setq len-txt-l 16));if
			);while
						
			(setq list-901 (reverse list-901)
						txt-l (substr str-txt 1 pos-blank-1)
						list-901 (reverse (vl-list* txt-l list-901))
						str-txt (substr str-txt (+ pos-blank-1 1))
						box-txt (textbox (list (cons 1 str-txt)))
 						len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))						
			);setq
			
			(if (and (> len-txt-r 19) (= (vl-string-search " " str-txt) nil))
				(setq len-txt-r 16);setq
			);if
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
