;////////****************/////////////////////////////////////////////////////////////////
;//////// проводки в лотке  //////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////
(defun c:08-wiring-in-the-tray

( / angl angl-blck current-line data-current-line dist dist-crnt dlt i line-2 line-3 line-4 n number-line p-current pend-current-line pstart-current-line quantity-lines set-lines)

(setvar "CMDECHO" 0)
(setvar "osmode" 0)

(command "_.undo" "_begin")

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" "")
	(command "_layer" "Установить" "arngment-equip" "")
);if

(if (= (tblsearch "block" "проводки-в-лотке-чро") nil)
	(progn
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(-1 1) '(-1 -1) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-1 -1) '(1 -1) "")
		(setq line-3 (entlast))
		(command "_.LINE" '(1 -1) '(1 1) "")
		(setq line-4 (entlast))
		(command "_block" "проводки-в-лотке-чро" '(0 0) line-2 line-3 line-4 "")
	);progn
);if

(setvar "celweight" -1)
(setvar "clayer" "0")

(prompt "\nВыберите линии\n");выбор линий

(setq set-lines (ssget '((0 . "line")))
			quantity-lines (sslength set-lines)
			number-line 0
);setq

(repeat quantity-lines
	(setq current-line (ssname set-lines number-line)
				data-current-line (entget current-line)
				pstart-current-line (cdr (assoc 10 data-current-line))
				pend-current-line (cdr (assoc 11 data-current-line))
				angl (atoi (angtos (angle pstart-current-line pend-current-line)))
				dist (distance pend-current-line pstart-current-line)
				angl-blck 0
				i 0
	);setq

	;преобразуем угол в диапазоне 0-90
	(if (and (>= angl 0)
	         (<= angl 90)  
			);and
			(setq angl-blck angl);setq
	);if
  
  ;преобразуем угол в диапазоне 180-270
	(if (and (<= angl 270) 
					 (> angl 90)
			);and
			(setq angl-blck (+ angl 180));setq
	);if

	 (if (> angl 270)
		 (setq angl-blck angl);setq
	 );if

	 (if (<= dist 70) ;разбиение для отрезков длиной до 70 единиц чертежа
		 (setq n 1
					 dlt (/ dist 2)
		 );setq
	 );if

	 (if (and (> dist 70) ;разбиение для отрезков длиной от 70 до 140 единиц чертежа
						(<= dist 140)
			 );and
		 (setq n 2
					 dlt (/ dist 3)
		 );setq
	 );if

	 (if	(> dist 140) ;разбиение для отрезков длиной свыше 140 единиц чертежа
		 (setq n 4
					 dlt (/ dist 5)
		 );setq
	 );if

	;рисуем значки
	(repeat n
		(setq dist-crnt (+ dlt (* dlt i))	 
					p-current (polar pstart-current-line (angle pstart-current-line pend-current-line) dist-crnt)
		);setq
		
		(command "_insert" "проводки-в-лотке-чро" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck p-current)
		(setq i (+ i 1));setq
	);repeat
	
	(setq number-line (1+ number-line));setq
);repeat

(command "_.undo" "_end")
(setvar "osmode" 6199)
(setvar "ORTHOMODE" 1)
(setvar "CMDECHO" 1)
(princ)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////