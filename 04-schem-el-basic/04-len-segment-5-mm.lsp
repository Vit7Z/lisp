;;; разработчик seaotter56@mail.ru
;;; /////// рисование отрезка, длиной 5мм, через 5 мм. /////////////////////////////
(defun c:04-len-segment-5-mm

( / dlt-x dlt-y drct increment-x increment-y lngth pnt1 pnt-1 pnt2 pnt-2 pnt-drct quantity-pieces x-pnt-1 x-pnt2 x-pnt-2 x-pnt-drct y-pnt-1 y-pnt2 y-pnt-2 y-pnt-drct)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo
	
	(setvar "osmode" 6199)
	(setvar "cmdecho" 0)
	
	(setq pnt-1 (getpoint "\n”кажите начальную точку\n")
				x-pnt-1 (nth 0 pnt-1)
				y-pnt-1 (nth 1 pnt-1)
				pnt-2 (getpoint "\n”кажите конечнюю точку\n")
				x-pnt-2 (nth 0 pnt-2)
				y-pnt-2 (nth 1 pnt-2)
				dlt-x (- x-pnt-2 x-pnt-1)
				dlt-y (- y-pnt-2 y-pnt-1)
				increment-x 0
				increment-y 0
				quantity-pieces 0
				pnt-drct (getpoint "\n”кажите направление\n")
				x-pnt-drct (nth 0 pnt-drct)
				y-pnt-drct (nth 1 pnt-drct)
	);setq
	
	(setvar "osmode" 0)
	
	(if (>= (abs dlt-x) (abs dlt-y))
		(setq drct "hrzl"
					quantity-pieces (fix (+ 1 (/ (abs dlt-x) 5)))
		);setq
		
		(setq drct "vrll"
					quantity-pieces (fix (+ 1 (/ (abs dlt-y) 5)))
		);setq
	);if
	
	;мен€ем приращение, если при горизонтальном указании, указано справа налево
	(if (and (= drct "hrzl") (< dlt-x 0)) (setq increment-x -5));if
	
	(if (and (= drct "hrzl") (> dlt-x 0)) (setq increment-x 5));if
	
	;мен€ем приращение, если при вертикальном указании, указано сверху вниз
	(if (and (= drct "vrll") (< dlt-y 0)) (setq increment-y -5));if
	
	(if (and (= drct "vrll") (> dlt-y 0)) (setq increment-y 5));if
	
	;мен€ем приращение, если при горизонтальном указании, указано справа налево
	(if (and (= drct "hrzl") (< dlt-x 0)) (setq increment-x -5));if
	
	(if (and (= drct "hrzl") (> dlt-x 0)) (setq increment-x 5));if
	
	;направление отрезка от точки указани€
	(if (and (= drct "hrzl") (< y-pnt-1 y-pnt-drct)) (setq lngth 5));if
	
	(if (and (= drct "hrzl") (> y-pnt-1 y-pnt-drct)) (setq lngth -5));if
	
	(if (and (= drct "vrll") (> x-pnt-1 x-pnt-drct)) (setq lngth -5));if
	
	(if (and (= drct "vrll") (< x-pnt-1 x-pnt-drct)) (setq lngth 5));if
	
	;рисуем вертикальные отрезки
	(if (= drct "hrzl")
		(repeat quantity-pieces
			(setq y-pnt2 (+ y-pnt-1 lngth)
						pnt1 (list x-pnt-1 y-pnt-1)
						pnt2 (list x-pnt-1 y-pnt2)
			);setq
			
			(command "_.line" pnt1 pnt2 "")
			(setq x-pnt-1 (+ x-pnt-1 increment-x));setq
		);repeat
	);if
																			 ; рисуем горизонтальные отрезки
	(if (= drct "vrll")
		(repeat quantity-pieces
			(setq x-pnt2 (+ x-pnt-1 lngth)
						pnt1 (list x-pnt-1 y-pnt-1)
						pnt2 (list x-pnt2 y-pnt-1)
			);setq
			
			(command "_.line" pnt1 pnt2 "")
			(setq y-pnt-1 (+ y-pnt-1 increment-y));setq
		);repeat
	);if
	
	(setvar "osmode" 6199)
	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;;; //////////////////////////// конец программы; /////////////////////////////
