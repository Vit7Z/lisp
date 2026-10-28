;;; разработчик seaotter56@mail.ru
;/////// *************************************************************////////////////////////////////////////
;/////// перенос обозначений жил с СПЭ на подключение к клеммам устройства ///////////////////////////////////
;/////// *************************************************************////////////////////////////////////////
(defun c:05-wires-from-spe-to-device

( / adoc counter-1 crnt-obj curnt-txt data-txt dlt-y1 dlt-y2 list-901 p1-lin1 p1-txt p2-lin1 pnt-1 pnt-2 
x-pnt-1 y-pnt-1 y-pnt-2)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq counter-1 1);setq

;;;;;;; собираем данные обозначений жил
(while (/= (setq crnt-obj (car (entsel "\nВыберите жилы\n"))) nil)

	(setq	data-txt (cdr (assoc 1 (entget crnt-obj)))
				
				curnt-txt (cons counter-1 data-txt)

				list-901 (vl-list* curnt-txt list-901)
				
				counter-1 (+ 1 counter-1)
	);setq
);while

(setvar "osmode" 6199)

(setq counter-1 1
			pnt-1 (getpoint "\nУкажите точку вставки\n")			
			x-pnt-1 (nth 0 pnt-1)
			y-pnt-1 (nth 1 pnt-1)
			
			pnt-2 (getpoint "\nУкажите направление\n")
			y-pnt-2 (nth 1 pnt-2)
);setq

(if (< y-pnt-1 y-pnt-2)
	(setq dlt-y1 12
				dlt-y2 1
	);setq
	
	(setq dlt-y1 -12
				dlt-y2 -11
	);setq
);if

(setvar "osmode" 0)
(setvar "textstyle" "standard")

(repeat (length list-901)
	(setq curnt-txt (cdr (assoc counter-1 list-901))
				
				p1-lin1 (list x-pnt-1 y-pnt-1)
				p2-lin1 (list x-pnt-1 (+ y-pnt-1 dlt-y1))
				
				p1-txt (list x-pnt-1 (+ y-pnt-1 dlt-y2))
	);setq
			
	(command "_.line" p1-lin1 p2-lin1 "")
	
	(if (/= curnt-txt nil)
		(command "_text" "_bl" p1-txt 2.5 90 curnt-txt)
	);if
	
	(setq x-pnt-1 (+ x-pnt-1 5)
				counter-1 (+ 1 counter-1)
	);setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;///////*************************************************************/////////////////////////////////////////
;//////////////////////////// конец //////////////////////////////////////////////////////////////////////////

