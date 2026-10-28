;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-130-01

(str-01-2 / box-txt cntr cntr-1 len-txt lst-len num-1 num-2 txt-00 txt-01 txt-tmp)

(setq cntr 0
			cntr-1 1
			txt-00 "- "
			len-txt 1
			str-lst nil
			
			lst-len (length str-01-2)
);setq

(setq str-01-2 (vl-sort str-01-2 (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2))))));сортируем по возрастанию

(repeat lst-len
	(setq txt-tmp (cdr (nth cntr str-01-2)));setq

	(cond
		((= txt-00 "- ") 
			(setq box-txt (textbox (list (cons 1 (strcat txt-00 txt-tmp))))
						len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))			
			);setq
		);=
		
		((/= txt-00 "- ") 
			(setq box-txt (textbox (list (cons 1 (strcat txt-00 ", " txt-tmp))))
						len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))			
			);setq
		);=
	);cond

	(if (< len-txt 124) 
		(cond
			((= txt-00 "- ") (setq txt-00 (strcat txt-00 txt-tmp)));=
			
			((/= txt-00 "- ") (setq txt-00 (strcat txt-00 ", " txt-tmp)));=
		);cond
	);if

	(if (> len-txt 124)
		(setq str-lst (vl-list* (cons cntr-1 txt-00) str-lst)
					txt-00 (strcat "- " txt-tmp)
					cntr-1 (1+ cntr-1)
					len-txt 1
		);setq
	);if	
	
 
	(setq cntr (+ cntr 1));setq
);repeat

(setq txt-01 (cons cntr-1 txt-00)
			str-lst (vl-list* txt-01 str-lst)
			str-lst (vl-sort str-lst (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)))));сортируем по возрастанию
);setq

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
