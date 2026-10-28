;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:05-metal-hose-lngth

( / adoc cable-lngth cable-mark counter-1 counter-2 crnt-obj dlt-x-1 dlt-x-2 dlt-y-1 dlt-y-2 list-901 
list-902 lngth-set num-1 num-2 obj-angl p11-c p12-c pnt-ins set-obj str-tmp str-tmp-02 str-up str-up-02 
str-up-03 tmp-list-901 tmp-list-902 typ-obj x-obj x-pnt-ins y-obj y-pnt-ins)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object))
	);setq
);start undo

(setvar "cmdecho" 0)

(setvar "osmode" 0)

(setq set-obj (ssget '((0 . "*text")))
			lngth-set (sslength set-obj)
			
			cable-mark 0
			cable-lngth 0
			counter-1 0
);setq


(repeat lngth-set
	(setq crnt-obj (entget (ssname set-obj counter-1))
				typ-obj (cdr (assoc 0 crnt-obj))
	);setq
	
	;;;;;;; если выбранный объект TEXT или MTEXT
	(if (or (= typ-obj "TEXT") (= typ-obj "MTEXT"))
		(progn
			(setq cable-mark (cdr (assoc 1 crnt-obj)) ;марка кабеля вся
									
						obj-angl (rtos (cdr (assoc 50 crnt-obj))) ;угол поворота
						x-obj (nth 1 (assoc 10 crnt-obj)) ;точка вставки
						y-obj (nth 2 (assoc 10 crnt-obj))
			);setq
			
			(if (= obj-angl "0") ;кабель горизонтально
				(setq dlt-x-1 7
							dlt-x-2 -1
							dlt-y-1 0
							dlt-y-2 -2
  			);setq
      );if
			
			(if (= obj-angl "1.5708") ;кабель вертикально
				(setq dlt-x-1 2
							dlt-x-2 7
							dlt-y-1 1
							dlt-y-2 0
  			);setq
      );if
		);progn
	);if


	(setq p11-c (list (+ x-obj dlt-x-1) (+ y-obj dlt-y-1));cекущая рамка, для выделения примитива с длиной кабеля
  			p12-c (list (+ x-obj dlt-x-2) (+ y-obj dlt-y-2))
  			cable-lngth (ssget "_C" p11-c p12-c '((0 . "TEXT")));текст
	);setq
	
	(if (/= cable-lngth nil)
		(progn
			(setq cable-lngth (cdr (assoc 1 (entget (ssname cable-lngth 0)))));setq
			
			(if (/= (vl-string-search " " cable-lngth) nil)
				(setq cable-lngth (substr cable-lngth 1 (vl-string-search " " cable-lngth)));setq
				(setq cable-lngth (substr cable-lngth 1 (vl-string-search "м" cable-lngth)));setq
			);if
		);progn
				
		(progn 
			(setq cable-lngth "0");setq
			(alert "Длина кабеля 0!")
		);progn
	);if
	
	(if (/= list-901 nil) (setq list-901 (reverse list-901)));if
	
	(if (/= list-902 nil) (setq list-902 (reverse list-902)));if
;(cons 3 cable-dn)
	(setq tmp-list-902 (list (cons 1 cable-mark) (cons 2 cable-lngth) )
				list-902 (vl-list* tmp-list-902 list-902)
				
				tmp-list-901 (cons counter-1 cable-mark)
				list-901 (vl-list* tmp-list-901 list-901)
				
				list-901 (reverse list-901)
				list-902 (reverse list-902)
				counter-1 (+ counter-1 1)
	);setq
);repeat


;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;       убираем дубликаты кабелей из list-901    ///////////////////////////////////////////////////////
(setq counter-1 0
			counter-2 0
);setq

(repeat (- (length list-901) 1)
	(setq str-tmp (nth counter-1 list-901)
				str-tmp-02 (cdr str-tmp)	
				counter-2 (+ counter-1 1)
	);setq
	
	(repeat (- (length list-901) counter-2)
		(setq str-up (nth counter-2 list-901)
					str-up-02 (cdr str-up)
		);setq
			
		(if (= str-tmp-02 str-up-02) 
			(setq list-901 (subst nil str-up list-901));setq
		);if

		(setq counter-2 (+ counter-2 1));setq
	);repeat
	(setq counter-1 (+ counter-1 1));setq
);repeat

(setq list-901 (vl-remove nil list-901)
			counter-1 0
			cable-lngth 0
);setq

;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;; сортируем список кабелей                       ///////////////////////////////////////////////////////

(setq list-902 
	(vl-sort list-902 
		(function (lambda (num-1 num-2) 
			(< (cdr (assoc 1 num-1)) (cdr (assoc 1 num-2))));lambda
     );fun
  );vl-sort
);setq


;;;;;;; типы кабелей и их длины //////////////////////////////////////////////////////////////////////////////
(setq counter-1 0
			pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  	x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
);setq

(repeat (length list-902)
	(setq str-up (nth counter-1 list-902)
				str-up-02 (cdr (assoc 1 str-up))
				str-up-03 (cdr (assoc 2 str-up))
	);setq

	(command "_text" "_ml" (list x-pnt-ins y-pnt-ins) 2.5 0 (strcat str-up-02 "    " str-up-03))
	
	(setq y-pnt-ins (- y-pnt-ins 5)
				counter-1 (+ counter-1 1)
	);setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// ************************************************************ ////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////