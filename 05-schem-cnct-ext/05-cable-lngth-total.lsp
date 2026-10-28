;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:05-cable-lngth-total

( / adoc cable-lngth cable-mark cntr-1 cntr-2 crnt-obj list-901 list-902 list-903 lngth-set pnt-ins set-obj 
str-tmp str-up tmp tmp-list-901 tmp-list-902 typ-obj x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq set-obj (ssget '((0 . "*text")))
			lngth-set (sslength set-obj)
			
			cable-mark 0
			cable-lngth 0
			cntr-1 0
);setq


;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
(repeat lngth-set
	(setq crnt-obj (entget (ssname set-obj cntr-1))
				typ-obj (cdr (assoc 0 crnt-obj))
	);setq
	
	;;;;;;; если выбранный объект TEXT или MTEXT
	(if (or (= typ-obj "TEXT") (= typ-obj "MTEXT"))
		(setq tmp (cdr (assoc 1 crnt-obj)) ;марка кабеля вся
		      cable-mark (substr tmp 1 (vl-string-search "   " tmp))
		      
		      cable-lngth (substr tmp (+ (vl-string-search "   " tmp) 4))
		      cable-lngth (atof (vl-string-subst "." "," cable-lngth));преобразование строки в вещественное число
		      
		      tmp-list-901 (cons cntr-1 cable-mark)
				  list-901 (vl-list* tmp-list-901 list-901)
				  
				  tmp-list-902 (list cable-mark cable-lngth)
				  tmp-list-902 (cons cntr-1 tmp-list-902)
				  list-902 (vl-list* tmp-list-902 list-902)
		);setq
	);if
	(setq cntr-1 (+ cntr-1 1));setq
);repeat


;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;       убираем дубликаты кабелей из list-901    ///////////////////////////////////////////////////////
(setq cntr-1 0
			cntr-2 0
);setq

(repeat (- (length list-901) 1)
	(setq str-tmp (nth cntr-1 list-901)
				str-tmp-02 (cdr str-tmp)	
				cntr-2 (+ cntr-1 1)
	);setq
	
	(repeat (- (length list-901) cntr-2)
		(setq str-up (nth cntr-2 list-901)
					str-up-02 (cdr str-up)
		);setq
			
		(if (= str-tmp-02 str-up-02) 
			(setq list-901 (subst nil str-up list-901));setq
		);if

		(setq cntr-2 (+ cntr-2 1));setq
	);repeat
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(setq list-901 (vl-remove nil list-901)
			cntr-1 0
);setq


;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;подсчет длины кабелей /////////////////////////////////////////////////////////////////////////////////
(repeat (length list-901)
	(setq str-tmp (cdr (nth cntr-1 list-901));марка кабеля, для которой считаем длину
	      cntr-2 0
	      tmp 0	      
	);setq
        
	(repeat (length list-902)
		(setq cable-mark (nth 1 (nth cntr-2 list-902))
				  cable-lngth (nth 2 (nth cntr-2 list-902))
		);setq
	
		(if (= str-tmp cable-mark)
			(setq tmp (+ tmp cable-lngth)
						cable-lngth 0.0
			);setq
		);if
	
		(setq cntr-2 (+ cntr-2 1));setq
	);repeat

	(setq list-903 (vl-list* (list (cons 1 str-tmp) (cons 2 tmp)) list-903)
				cntr-1 (+ cntr-1 1)
	);setq
);repeat



;;;;;;;длины кабелей отсортировано /////////////////////////////////////////////////////////////////
(setq cntr-1 0
			pnt-ins (getpoint "\nУкажите точку вставки\n")
	  	x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
);setq

(repeat (length list-903)
	(setq str-tmp (cdr (assoc 1 (nth cntr-1 list-903)))
				str-up (cdr (assoc 2 (nth cntr-1 list-903)))				
				str-up (vl-string-subst "," "." (rtos str-up 2))
				str-tmp (strcat str-tmp "    " str-up)
	);setq
	
	(command "_text" "_ml" (list x-pnt-ins y-pnt-ins) 2.5 0 str-tmp)
	
	(setq y-pnt-ins (- y-pnt-ins 5)
				cntr-1 (+ cntr-1 1)
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
