;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:05-cable-lngth-sheet

( / adoc box-txt cable-lngth cable-mark cable-mark-t cable-v cable-v1 cable-v2 counter-1 counter-2 crnt-obj 
dlt-x-1 dlt-x-2 dlt-y-1 dlt-y-2 len-txt list-901 list-902 list-903 lngth-set max-x max-y min-x min-y num-1 
num-2 obj-angl p11-c p12-c pnt-ins rctn-1 set-obj str-tmp str-tmp-02 str-up str-up-02 str-up-03 tmp-list-901 
tmp-list-902 tmp-list-903 typ-obj x-obj xp1-box-txt xp2-box-txt x-pnt-ins y-obj y-pnt-ins)

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
);setq

(setq crnt-obj (entget (ssname set-obj 0))
      x-obj (nth 0 (cdr (assoc 10 crnt-obj)))
			y-obj (nth 1 (cdr (assoc 10 crnt-obj)))
			min-x x-obj
			min-y y-obj
			max-x x-obj
			max-y y-obj
			
			counter-1 0
);setq

(repeat lngth-set
  (setq crnt-obj (entget (ssname set-obj counter-1))
        x-obj (nth 0 (cdr (assoc 10 crnt-obj)))
			  y-obj (nth 1 (cdr (assoc 10 crnt-obj)))
  );setq

  (if (> x-obj max-x)
    (setq max-x x-obj);setq
  );if

  (if (< x-obj min-x)
    (setq min-x x-obj);setq
  );if

  (if (> y-obj max-y)
    (setq max-y y-obj);setq
  );if

  (if (< y-obj min-y)
    (setq min-y y-obj);setq
  );if
 
  (setq counter-1 (+ counter-1 1));setq
);repeat

(setq p11-c (list (- min-x 50) (+ max-y 50))
      p12-c (list (+ max-x 50) (- min-y 50))
);setq

(command "_.zoom" "_w" p11-c p12-c)

(setq p11-c 0
      p12-c 0
      counter-1 0
);setq

(repeat lngth-set
	(setq crnt-obj (entget (ssname set-obj counter-1))
				typ-obj (cdr (assoc 0 crnt-obj))
	);setq
	
	;;;;;;; если выбранный объект TEXT или MTEXT
	(if (or (= typ-obj "TEXT") (= typ-obj "MTEXT"))
		(progn
			(setq cable-mark (cdr (assoc 1 crnt-obj)) ;марка кабел€ вс€
						obj-angl (rtos (cdr (assoc 50 crnt-obj))) ;угол поворота
						x-obj (nth 1 (assoc 10 crnt-obj)) ;точка вставки
						y-obj (nth 2 (assoc 10 crnt-obj))
			);setq
			
			(if (or (= obj-angl "0")  (= obj-angl "0.0000"));горизонтально
				(setq dlt-x-1 0
				      dlt-y-1 -4.8
					  
					    dlt-x-2 7
					    dlt-y-2 -2.8
  			);setq
      );if
      
			(if (= obj-angl "1.5708");вертикально
				(setq dlt-x-1 2.8
					    dlt-y-1 0
					  
					    dlt-x-2 4.8
					    dlt-y-2 7		
  			);setq
      );if
		);progn
	);if


	(setq p11-c (list (+ x-obj dlt-x-1) (+ y-obj dlt-y-1));cекуща€ рамка, дл€ выделени€ примитива с длиной кабел€
  			p12-c (list (+ x-obj dlt-x-2) (+ y-obj dlt-y-2))
  			cable-lngth (ssget "_C" p11-c p12-c '((0 . "TEXT")));текст
	);setq
	
	;(command "_RECTANGLE" p11-c p12-c)
	
	(if (/= cable-lngth nil)
		(setq cable-lngth (cdr (assoc 1 (entget (ssname cable-lngth 0))))
					cable-lngth (substr cable-lngth 1 (vl-string-search " " cable-lngth))
		);setq
	
		(progn 
			(setq cable-lngth "0");setq
			(alert "ƒлина кабел€ 0!")
			
			;рамка вокруг длины
      (setq rctn-1
        (entmakex
          (list
          '(0 . "LWPOLYLINE")
          '(100 . "AcDbEntity")
          '(100 . "AcDbPolyline")
          '(70 . 1) ;замкнутость
          '(90 . 4) ;числ сторон
          '(43 . 0.0)
          '(8 . "wspom") ;слой
          (cons 10  p11-c) ;точки вершин
          (cons 10  p12-c)
          (cons 10  p11-c)
          (cons 10  p12-c)
          (cons 10  p11-c)
         '(370 . 60) ;толщина линии
         '(62 . 1)
         );list
        );entmakex
      );setq
		);progn
	);if

	(if (/= list-901 nil) (setq list-901 (reverse list-901)));if
	
	(if (/= list-902 nil) (setq list-902 (reverse list-902)));if

	(setq tmp-list-902 (list (cons 1 counter-1) (cons 2 cable-mark) (cons 3 cable-lngth))
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
			(> (cdr (assoc 2 num-1)) (cdr (assoc 2 num-2))));lambda
     );fun
  );vl-sort
);setq

;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;подсчет длины кабелей /////////////////////////////////////////////////////////////////////////////////
(repeat (length list-901)
	(setq str-tmp (nth counter-1 list-901)
				str-tmp-02 (cdr str-tmp)
				
				cable-mark-t (substr str-tmp-02 1 (vl-string-search " " str-tmp-02)) ;тип кабел€, дл€ сортировки
				cable-v (substr str-tmp-02 (+ (vl-string-search " " str-tmp-02) 2))
				
				counter-2 0
				cable-lngth 0.0
	);setq

	
	(if (/= (vl-string-search "x" cable-v) nil)
		(setq cable-v1 (atoi (substr cable-v 1 (vl-string-search "x" cable-v)))
					cable-v2 (substr cable-v (+ (vl-string-search "x" cable-v) 2))
		);setq

		(setq cable-v1 (atoi (substr cable-v 1 (vl-string-search "х" cable-v)))
					cable-v2 (substr cable-v (+ (vl-string-search "х" cable-v) 2))
		);setq
	);if
		
	(repeat (length list-902)
		(setq str-up (nth counter-2 list-902)
					str-up-02 (cdr (assoc 2 str-up))
					str-up-03 (atof (vl-string-subst "." "," (cdr (assoc 3 str-up))));преобразование строки в вещественное число
		);setq
	
		(if (= str-tmp-02 str-up-02)
			(setq cable-lngth (+ cable-lngth str-up-03)
						str-up-03 0.0
			);setq
		);if
	
		(setq counter-2 (+ counter-2 1));setq
	);repeat

	(setq tmp-list-903 (list (cons 1 str-tmp-02) (cons 2 cable-lngth) (cons 21 cable-mark-t) (cons 22 cable-v1))
				list-903 (vl-list* tmp-list-903 list-903)
				counter-1 (+ counter-1 1)
				cable-lngth 0.0
	);setq
);repeat

(setq list-903 (vl-sort list-903 (function (lambda (num-1 num-2) (< (cdr (assoc 22 num-1)) (cdr (assoc 22 num-2))));lambda
                                 );fun
               );vl-sort
);setq

(setq list-903 (vl-sort list-903 (function (lambda (num-1 num-2) (< (cdr (assoc 21 num-1)) (cdr (assoc 21 num-2))));lambda
                                 );fun
               );vl-sort
);setq
;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;;;; типы кабелей и их длины //////////////////////////////////////////////////////////////////////////////
(setq counter-1 0
      pnt-ins (getpoint "\n”кажите точку вставки\n")
	  x-pnt-ins (nth 0 pnt-ins)
	  y-pnt-ins (nth 1 pnt-ins)
);setq

(repeat (length list-902)
	(setq str-up (nth counter-1 list-902)
				str-up-02 (cdr (assoc 2 str-up))
				str-up-03 (cdr (assoc 3 str-up))
	);setq

	(command "_text" "_ml" (list x-pnt-ins y-pnt-ins) 2.5 0 (strcat str-up-02 "    " str-up-03))
	
	(setq y-pnt-ins (- y-pnt-ins 5)
				counter-1 (+ counter-1 1)
	);setq
);repeat


;;;;;;;длины кабелей отсортировано /////////////////////////////////////////////////////////////////
(setq counter-1 0
			pnt-ins (getpoint "\n”кажите точку вставки\n")
	  	x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
);setq

(repeat (length list-903)
	(setq str-up (nth counter-1 list-903)
		  str-up-02 (cdr (assoc 1 str-up))
		  str-up-03 (rtos (cdr (assoc 2 str-up)) 2)
		  str-up-03 (vl-string-subst "," "." str-up-03)
		  ;str-up-02 (strcat str-up-02 "    " str-up-03)
		  
		  box-txt (textbox (list (cons 1 str-up-02) (cons 40 2.5) (cons 50 0) (cons 41 1)))
		  xp1-box-txt (car (nth 0 box-txt)); х, лева€ нижн€€ точка
		  xp2-box-txt (car (nth 1 box-txt)); х, права€ верхн€€ точка
	      len-txt (fix (- xp2-box-txt xp1-box-txt));длина текста
		  len-txt (+ len-txt 8)
	);setq

	(command "_text" "_ml" (list x-pnt-ins y-pnt-ins) 2.5 0 str-up-02)
	(command "_text" "_ml" (list (+ x-pnt-ins len-txt) y-pnt-ins) 2.5 0 str-up-03)
	
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
