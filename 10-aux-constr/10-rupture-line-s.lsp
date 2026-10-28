;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование линии разрыва                                      //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:10-rupture-line-s

( / adoc angl_lin dist_0_75 dist_1_5 dist_lin dlt i n pi p-lin-1 p-lin-crnt1 p-lin-crnt2 p-lin-e p-lin-s pnt-1 pnt-2 ss1 xpnt-1 xpnt-2 ypnt-1 ypnt-2)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setvar "auprec" 7)

(command "_layer" "Установить" "0" "")

(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\nУкажите точку 1\n")
      xpnt-1 (nth 0 pnt-1)
		  ypnt-1 (nth 1 pnt-1)
		  
      pnt-2 (getpoint "\nУкажите точку 2\n")
      xpnt-2 (nth 0 pnt-2)
		  ypnt-2 (nth 1 pnt-2)
		  
		  angl_lin (angle pnt-1 pnt-2)
		  pi 3.1415926535
		  
		  dist_lin (distance pnt-1 pnt-2)
		  dist_0_75 0.75
		  dist_1_5 1.5
		  
		  ss1 (ssadd) ;пустой набор, куда будут собираться нарисованные примитивы
);setq


;разбиение для отрезков длиной до 20 единиц чертежа
(if	(<= dist_lin 40) 
  (setq n 1
  			i 0
	      dlt (/ dist_lin 2)
  );setq
);if


;разбиение для отрезков длиной от 20 до 60 единиц чертежа
(if	(and (> dist_lin 40) 
				 (<= dist_lin 80));and
	(setq n 3
				i 2
				dlt (/ dist_lin 4)
	);setq
);if


;разбиение для отрезков длиной от 60 до 140 единиц чертежа
(if (and (> dist_lin 80) 
				 (<= dist_lin 180));and
		 (setq n 4
		 			 i 3
					 dlt (/ dist_lin 5)
		 );setq
);if


;разбиение для отрезков длиной свыше 140 единиц чертежа
(if	(> dist_lin 180) 
		 (setq n 5
		 			 i 4
					 dlt (/ dist_lin 6)
		 );setq
);if

(setvar "osmode" 0)

;;;;;;;рисуем первый отрезок
(setq p-lin-s (polar pnt-1 (+ angl_lin pi) 3)
			p-lin-e (polar pnt-1 angl_lin (- dlt dist_1_5))
);setq

(command "_.line" p-lin-s p-lin-e "")

(setq ss1 (ssadd (entlast) ss1));setq

;расставляем гребни + линии между ними
(repeat n
	;первая линия гребня
	(setq p-lin-1 (polar p-lin-e angl_lin dist_0_75)
				p-lin-crnt1 (polar p-lin-1 (+ angl_lin (* pi 0.5)) dist_1_5)
	);setq
	
	(command "_.line" p-lin-e p-lin-crnt1 "")
	
	(setq ss1 (ssadd (entlast) ss1));setq
				
	;средняя линия гребня
	(setq p-lin-1 (polar p-lin-1 angl_lin dist_1_5)
				p-lin-crnt2 (polar p-lin-1 (+ angl_lin (* pi 1.5)) dist_1_5)
	);setq
	
	(command "_.line" p-lin-crnt1 p-lin-crnt2 "")
	
	(setq ss1 (ssadd (entlast) ss1));setq
	
	;последняя линия гребня
	(setq p-lin-1 (polar p-lin-1 angl_lin dist_0_75));setq
	
	(command "_.line" p-lin-crnt2 p-lin-1 "")
	
	(setq ss1 (ssadd (entlast) ss1));setq
	
	;приращение, если отрезков больше 1
	(if (> n 1)
		(setq p-lin-e (polar p-lin-1 angl_lin (- dlt (* dist_1_5 2))));приращение
	);if
	
	;рисуем промежуточные линии
	(if (> i 0)
		(progn
			(command "_.line" p-lin-1 p-lin-e "")
			(setq ss1 (ssadd (entlast) ss1));setq
		);progn
	);progn
	
	
	(setq i (- i 1));setq
);repeat


;;;;;;;рисуем последний отрезок
(setq p-lin-e (polar pnt-2 angl_lin 3));setq

(command "_.line" p-lin-1 p-lin-e "")

(setq ss1 (ssadd (entlast) ss1));setq

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(command "_pedit" "_M" ss1 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////