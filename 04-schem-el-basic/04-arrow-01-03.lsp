;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// стрелки                                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-arrow-01-03

(str-txt / angl angl-txt lngth-arrow pnt-2 pnt-3 pnt-drctn pnt-ins pnt-ins-txt xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "cmdecho" 0)
(setvar "textstyle" "standard")

(setq str-lft (substr str-txt 1 (vl-string-search " " str-txt) )
      str-dirct (substr str-txt (+ (vl-string-search " " str-txt) 2))
      lngth-ln 10
      lngth-arrow 3
);setq

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
	);setq
	
	(if (= str-dirct "up")
	  (setq pnt-2 (list xpnt-ins (+ ypnt-ins lngth-ln)) ;начало стрелки
					pnt-3 (list xpnt-ins (+ ypnt-ins (+ lngth-ln lngth-arrow))) 	;конец стрелки
					pnt-ins-txt (list xpnt-ins (+ ypnt-ins 1)) 	;точка вставки текста
					angl-txt 90
					
					p1 (list (+ xpnt-ins 0.5) (+ ypnt-ins 4))
					p2 (list (- xpnt-ins 2) (+ ypnt-ins 1))					
	  );setq
	);if
	

	(if (= str-dirct "down")
	  (setq pnt-2 (list xpnt-ins (- ypnt-ins lngth-ln)) ; начало стрелки
					pnt-3 (list xpnt-ins (- ypnt-ins (+ lngth-ln lngth-arrow))) ; конец стрелки
					pnt-ins-txt (list xpnt-ins (- ypnt-ins (- lngth-ln 1))) ; точка вставки текста
					angl-txt 90
					
					p1 (list (+ xpnt-ins 0.5) (- ypnt-ins 1))
					p2 (list (- xpnt-ins 2) (- ypnt-ins 5))					
	  );setq
	);if
	
	(setvar "osmode" 0)
	;;;;;;; стираем текст и стрелку, если он есть ////////////////////////////////////////////////////
	(setq crnt-obj (ssget "_C" p1 p2));setq

  (if (/= crnt-obj nil)
    (command "_erase" crnt-obj "")
  );if

	(command "_pline" pnt-ins "_w" 0 0 pnt-2 "_w" 1.5 0 pnt-3 "")
	(command "_text" "_bl" pnt-ins-txt 2.5 angl-txt str-lft)
	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
