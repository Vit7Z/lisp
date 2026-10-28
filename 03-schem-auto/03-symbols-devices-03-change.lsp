;///////////////////////////////////// приведение текста к одному содержимому //////////////////////////
(defun 03-symbols-devices-03-change

(data-txt / adoc counter data-old-txt lngth-old-txt old-txt set-txt)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(prompt "\n¬ыберите в какой текст добавл€ть\n")
		
(setq	set-txt (ssget '((0 . "*text")))
			lngth-old-txt (sslength set-txt)
			counter 0
			data-txt (cons 1 data-txt)
);setq
	
	
(repeat	lngth-old-txt
	(setq data-old-txt (entget (ssname set-txt counter)) ;получаем содержимое текущего примитива текста
				old-txt (assoc 1 data-old-txt)
				data-old-txt (subst data-txt old-txt data-old-txt)		
	);setq
		
	(entmod data-old-txt)

	(setq	counter (+ 1 counter));setq
);repeat

(vla-endundomark adoc)

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////

