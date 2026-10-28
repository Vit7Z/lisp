;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  обрезка по заказанному символу str-patrn                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-060-01

(str-order / box-txt cntr len-txt-l len-txt-r num-1 num-2 pos-blank pos-blank-1 str-patrn str-tech-std str-txt txt-l txt-smbl)

;str-txt - строка, которую разбиваем
;str-tech-std - текст ТУ или другого документа
;str-patrn - символ по которому разбиваем "пробел" или "-"
;str-lst - возвращаемый список

(setq str-txt (cdr (assoc 1 str-order))
			str-patrn (cdr (assoc 2 str-order))
			str-tech-std (cdr (assoc 3 str-order))
			
			cntr 0
			str-lst nil
	  	
	  	box-txt (textbox (list (cons 1 str-txt)))
	  	len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
);setq

;;;;;;; ///////// длина текста больше 60 мм
(if (>= len-txt-r 60)
	(progn
		(while (> len-txt-r 60)
			(setq len-txt-l 0
						pos-blank 1
						txt-l ""
			);setq
			
			;******* цикл по обрезке
 			(while (< len-txt-l 57)
				(setq txt-l (substr str-txt 1 pos-blank);отсекаем слева
							txt-smbl (substr str-txt pos-blank 1)
							
							box-txt (textbox (list (cons 1 txt-l)))
							len-txt-l (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
							pos-blank (+ pos-blank 1)
				);setq
				
				(if (= txt-smbl str-patrn) (setq pos-blank-1 (- pos-blank 1)));if
 			);while

			(setq txt-l (substr str-txt 1 pos-blank-1)
						str-txt (substr str-txt (+ pos-blank-1 1))
						box-txt (textbox (list (cons 1 str-txt)))
 						len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
 						
 						cntr (+ cntr 1)
 						txt-l (cons cntr txt-l)
 						str-lst (vl-list* txt-l str-lst)
			);setq
		);while
	);progn
);if

(setq cntr (+ cntr 1)
			txt-l (cons cntr str-txt)
			str-lst (vl-list* txt-l str-lst)
);setq

(if (/= str-tech-std nil)
	(setq cntr (+ cntr 1)
				txt-l (cons cntr str-tech-std)
				str-lst (vl-list* txt-l str-lst)
				str-lst (vl-sort str-lst (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)))))
	);setq
);if

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
