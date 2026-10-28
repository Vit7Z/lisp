;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  печать производителя                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-045-01

(str-manufact / box-txt len-txt-1 len-txt-2 len-txt-3 str-left str-right)

(setq box-txt (textbox (list (cons 1 str-manufact)))
			len-txt-3 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
			
			str-lst nil
);setq

(if (> len-txt-3 43)
	(setq str-left (substr str-manufact 1 (+ (vl-string-search "," str-manufact) 1));правая половина + ее длина
				box-txt (textbox (list (cons 1 str-left)))
				len-txt-1 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
						
				str-right (substr str-manufact (+ (vl-string-search "," str-manufact) 3));левая половина + ее длина
				box-txt (textbox (list (cons 1 str-right)))
				len-txt-2 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
	);setq

	(setq str-lst (vl-list* (cons 1 str-manufact) str-lst)); если длина всей строки меньше 43 м
);if

; если обе длины меньше 43 мм
(if (and (> len-txt-3 43) (< len-txt-1 43) (< len-txt-2 43))
	(setq str-lst (list (cons 1 str-left) (cons 2 str-right)));setq
);if

; если левая длина больше 43мм, а правая длина меньше 43 мм
(if (and (> len-txt-3 43) (> len-txt-1 43) (< len-txt-2 43))
	(split-str-parts-spcf-045-02 str-left str-right)
);if

; если левая длина меньше 43мм, а правая длина больше 43 мм
(if (and (> len-txt-3 43) (< len-txt-1 43) (> len-txt-2 43))
	(alert "Разбивка правой части производителя не разработана!")
);if

; если обе длиныбольше 43 мм
(if (and (> len-txt-3 43) (> len-txt-1 43) (> len-txt-2 43))
	(alert "Разбивка правой части производителя не разработана!")
);if

(gc)
(princ)
)
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
;///////  подпрограмма разбиения левой части реквизитов производителя /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-045-02

(str-left str-right / box-txt cntr-1 cntr-2 cntr-3 len-txt-1 len-txt-2 num-1 num-2 pos-brk prt-left prt-lst smbl-brk)

(setq box-txt (textbox (list (cons 1 str-left)))
			len-txt-1 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
			
			cntr-1 (fix (/ len-txt-1 43)) ;кол повтореий внешнего цикла
			cntr-2 1 ;позиция первого символа
			cntr-3 1
			
			len-txt-1 0			
			len-txt-2 50
);setq

(while (> len-txt-2 43)
	(setq pos-brk 0);setq
	
	(while (< len-txt-1 43)
		(setq smbl-brk (substr str-left cntr-2 1)
					
					prt-left (substr str-left 1 cntr-2)
					box-txt (textbox (list (cons 1 prt-left)))
					len-txt-1 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
		);setq
		
		(if (and (= smbl-brk " ") (< len-txt-1 43))
			(setq pos-brk cntr-2);setq
		);if
	
		(setq cntr-2 (+ cntr-2 1))
	);while

	(setq prt-lst (substr str-left 1 pos-brk)				
				prt-lst (cons cntr-3 prt-lst)
				
				str-lst (vl-list* prt-lst str-lst)
				
				str-left (vl-string-left-trim " " (substr str-left pos-brk))
				
				box-txt (textbox (list (cons 1 str-left)))
				len-txt-2 (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
				
				len-txt-1 0				
				cntr-2 1				
				cntr-3 (+ cntr-3 1)
	);setq
);while

(setq prt-lst (cons cntr-3 str-left) ;остатки строки, которые меньше 43 мм
			str-lst (vl-list* prt-lst str-lst)
			prt-lst (cons (+ cntr-3 1) str-right)
			str-lst (vl-list* prt-lst str-lst)
			str-lst (vl-sort str-lst (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)))))
);setq

(gc)
(princ)
)
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец подпрограммы                                           /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////
