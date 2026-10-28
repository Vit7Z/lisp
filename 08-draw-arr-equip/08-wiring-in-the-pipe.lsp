;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// проводки в трубе                                             ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun c:08-wiring-in-the-pipe

( / adoc angl-circle angl-line current-line data-current-line dist dist-crnt dlt i n number-line p-current p-current-circle pend-current-line pstart-current-line quantity-lines set-lines)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 0)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "—оздать" "arngment-equip" "“ип" "Continuous" "arngment-equip" "÷вет" 4 "arngment-equip" "”становить" "arngment-equip" "");создаем слой
	(command "_layer" "”становить" "arngment-equip" "") ;устанавливаем слой
);if

(prompt "\n¬ыберите линии\n");выбор линий

(setq set-lines			(ssget '((0 . "line")))
			quantity-lines	(sslength set-lines)
			number-line 0
);setq

(repeat quantity-lines
	(setq current-line (ssname set-lines number-line)
				data-current-line (entget current-line)
				pstart-current-line (cdr (assoc 10 data-current-line))
				pend-current-line (cdr (assoc 11 data-current-line))
				angl-line (atof (angtos (angle pstart-current-line pend-current-line)))
				dist (distance pend-current-line pstart-current-line)
				i 0
	);setq

	(if (or (= angl-line 270);вертикальные линии
					(= angl-line 90)
			);or
		(setq angl-circle (angtof "180" 0));setq
	);if

	(if (> angl-line 270);четверта€ четверть
		(setq angl-circle (angtof (rtos (- angl-line 270))));setq
	);if

	(if (and (>= angl-line 0);перва€ четверть
					 (< angl-line 90)
			);and
		(setq angl-circle (angtof (rtos (+ angl-line 90))));setq
	);if

	(if (and (> angl-line 90);втора€ четверть
					 (<= angl-line 180)
			);and
		(setq angl-circle (angtof (rtos (- angl-line 90))));setq
	);if

	(if (and (> angl-line 180);треть€ четверть
					 (< angl-line 270)
			);and
		(setq angl-circle (angtof (rtos (- 360 angl-line))));setq
	);if

	(if	 (<= dist 70) ;разбиение дл€ отрезков длиной до 70 единиц чертежа
		(setq n 1
					dlt (/ dist 2)
		);setq
	);if

	(if (and (> dist 70) ;разбиение дл€ отрезков длиной от 70 до 140 единиц чертежа
					 (<= dist 140)
			);and
		(setq n 2
					dlt (/ dist 3)
		);setq
	);if

	(if	 (> dist 140) ;разбиение дл€ отрезков длиной свыше 140 единиц чертежа
		(setq n 4
					dlt (/ dist 5)
		);setq
	);if

	 ;рисуем значки
	(repeat n
		(setq dist-crnt (+ dlt (* dlt i))
		
					p-current (polar pstart-current-line (angle pstart-current-line pend-current-line) dist-crnt)
					
					p-current-circle (polar p-current angl-circle 0.5)
		);setq
		
		(command "_circle" p-current-circle 0.5)
		(setq i (+ i 1));setq	
	);repeat
	
	(setq number-line (1+ number-line));setq
);repeat внешний

(setvar "clayer" "0")

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "celweight" -1)
(princ)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////