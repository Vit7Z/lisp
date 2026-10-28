;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  печать примечания                                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-040-01

(str-note / box-txt cntr len-txt-l len-txt-r num-1 num-2 pos-blank pos-blank-1 str-txt txt-l txt-smbl)

(setq str-txt str-note
			str-lst nil
	  	cntr 0
	  	box-txt (textbox (list (cons 1 str-txt)))
	  	len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
);setq

;;;;;;; ///////// длина текста больше 40 мм
(if (>= len-txt-r 39)
	(progn
		(while (> len-txt-r 39)
			(setq len-txt-l 0
						pos-blank 1
						txt-l ""
			);setq
			
			;******* цикл по обрезке
 			(while (< len-txt-l 37)
				(setq txt-l (substr str-txt 1 pos-blank);отсекаем слева
						txt-smbl (substr str-txt pos-blank 1)
							
						box-txt (textbox (list (cons 1 txt-l)))
						len-txt-l (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
						pos-blank (+ pos-blank 1)
				);setq
				
				(if (= txt-smbl " ") (setq pos-blank-1 (- pos-blank 1)));if
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
		str-lst (vl-sort str-lst (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)))))
);setq

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
