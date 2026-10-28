;/////// ************************************************************ ////////////////////////////////////////
;/////// подсчет длины импульсных труб на чертеже                     ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:05-pipe-pulse-lngth

( / adoc crnt-angl crnt-len crnt-name crnt-obj crnt-obj-for-del crnt-x crnt-y dlt-x-1 dlt-x-2 dlt-y-1 dlt-y-2 
i lngth-set p11-c p12-c pnt-ins set-obj total-len x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq set-obj (ssget '((0 . "insert")))
			lngth-set (sslength set-obj)
			total-len 0
			i 0
);setq

;оставляем в наборе только блоки имп. труб
(repeat lngth-set
  (setq crnt-obj (entget (ssname set-obj i))
        crnt-name (cdr (assoc 2 crnt-obj))
        crnt-obj-for-del (ssname set-obj i)
  );setq
  
  (if (/= (wcmatch crnt-name "труба-импульсн-*-ссвп") T)
    (setq set-obj (ssdel crnt-obj-for-del set-obj)
          i (- i 1)
    );setq
  );if
  
  (setq i (+ i 1));setq
);repeat

(setq lngth-set (sslength set-obj)
      i 0
);setq

(repeat lngth-set
	(setq crnt-obj (entget (ssname set-obj i))
				crnt-name (cdr (assoc 2 crnt-obj))
				crnt-x (nth 0 (cdr (assoc 10 crnt-obj)))
				crnt-y (nth 1 (cdr (assoc 10 crnt-obj)))
				crnt-angl (atoi (angtos (cdr (assoc 50 crnt-obj)) 0))
	);setq
	
	(if (= crnt-angl 0);блок вертикально
    (setq dlt-x-1 4
				  dlt-y-1 -1
				  dlt-x-2 2
				  dlt-y-2 -9
    );setq
  );if
			
	(if (= crnt-angl 270);блок горизонтально
	  (setq dlt-x-1 -1
				  dlt-y-1 -4
				  dlt-x-2 -9
				  dlt-y-2 -2
  	);setq
  );if
	
	(setq p11-c (list (+ crnt-x dlt-x-1) (+ crnt-y dlt-y-1));cекущая рамка, для выделения примитива с длиной кабеля
  			p12-c (list (+ crnt-x dlt-x-2) (+ crnt-y dlt-y-2))
  			crnt-len (ssget "_C" p11-c p12-c '((0 . "TEXT")));текст
	);setq
	
	(if (/= crnt-len nil)
		(setq crnt-len (cdr (assoc 1 (entget (ssname crnt-len 0))))
					crnt-len (substr crnt-len 1 (vl-string-search " " crnt-len))
					crnt-len (atof (vl-string-subst "." "," crnt-len))
		);setq
	
		(progn 
			(setq crnt-len 0);setq
			(alert "Длина трубы 0!")
		);progn
	);if

	(setq total-len (+ total-len crnt-len)
	      i (+ i 1)
	);setq
);repeat

;;;;;;; печатаем суммарную длину импульсн. труб
(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
      x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
	  	total-len (rtos total-len 2)
      total-len (vl-string-subst "," "." total-len)
);setq

(command "_text" "_ml" pnt-ins 2.5 0 "Общая длина импульсн труб")
(command "_text" "_ml" (list x-pnt-ins (- y-pnt-ins 4)) 2.5 0 total-len)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;    конец программы    ///////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////

