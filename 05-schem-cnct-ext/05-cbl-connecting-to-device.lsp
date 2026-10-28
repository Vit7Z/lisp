;;; разработчик seaotter56@mail.ru
;;; /////// рисование отрезка, длиной 5мм, через 5 мм. /////////////////////////////
(defun c:05-cbl-connecting-to-device

( / adoc angl-1 dcl-id dlt-x dlt-y drct incr-x list-01 lngth-ln pnt1 pnt-1 pnt2 pnt-2 pnt-drct pnt-frst pnt-txt quantity-pieces x-pnt-1 x-pnt-2 x-pnt-drct y-pnt-1 y-pnt-2 y-pnt-drct y-pnt-txt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq list-01 (list "5" "10" "12" "15" "17" "22"));setq

(if (< (setq dcl-id (load_dialog "dia-05-connecting-to-device.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_05_vein_device" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)

(action_tile "txt-01"
  (strcat "(setq lngth-ln (nth (atoi (get_tile \"txt-01\")) list-01))"
  			 "(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq lngth-ln (atoi lngth-ln)
		pnt-1 (getpoint "\nУкажите начальную точку\n")
		x-pnt-1 (nth 0 pnt-1)
		y-pnt-1 (nth 1 pnt-1)
		
		pnt-2 (getpoint "\nУкажите конечнюю точку\n")
		x-pnt-2 (nth 0 pnt-2)
		y-pnt-2 (nth 1 pnt-2)
		
		dlt-x (- x-pnt-2 x-pnt-1)
		dlt-y (- y-pnt-2 y-pnt-1)

		pnt-drct (getpoint "\nУкажите направление\n")
		x-pnt-drct (nth 0 pnt-drct)
		y-pnt-drct (nth 1 pnt-drct)
				
		angl-1 (atoi (angtos (angle pnt-1 pnt-2)))
);setq
	
(setvar "osmode" 0)

(if (or (<= angl-1 45) (>= angl-1 315))
	(if (> y-pnt-1 y-pnt-drct) 	       
		(setq drct "right-down"
				quantity-pieces (fix (+ 1 (/ (abs dlt-x) 5)))
				incr-x 5
				y-pnt-2 (- y-pnt-1 lngth-ln)
				y-pnt-txt (+ (- y-pnt-1 lngth-ln) 1)
				pnt-frst (list x-pnt-1 y-pnt-2)
		);setq
	);if
);if

(if (or (<= angl-1 45) (>= angl-1 315))
	(if (< y-pnt-1 y-pnt-drct) 	       
		(setq drct "right-up"
				quantity-pieces (fix (+ 1 (/ (abs dlt-x) 5)))
				incr-x 5
				y-pnt-2 (+ y-pnt-1 lngth-ln)
				y-pnt-txt (+ y-pnt-1 1)
				pnt-frst (list x-pnt-1 y-pnt-2)
		);setq
	);if
);if


;рисуем вертикальные отрезки
(if (or (= drct "right-down") (= drct "right-up"))
	(repeat quantity-pieces
		(setq pnt1 (list x-pnt-1 y-pnt-1)
				pnt2 (list x-pnt-1 y-pnt-2)
				pnt-txt (list x-pnt-1 y-pnt-txt)
		);setq
			
		(command "_.line" pnt1 pnt2 "")
		(command "_text" "_bl" pnt-txt 2.5 90 "****")
		
		(setq x-pnt-1 (+ x-pnt-1 incr-x));setq
	);repeat
);if

(setvar "celweight" 60)

(command "_line" pnt-frst pnt2 "")

(setvar "celweight" -1)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;;; //////////////////////////// конец программы; /////////////////////////////
