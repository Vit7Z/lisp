;/////// ************************************************************ ////////////////////
;/////// нумерация жил вниз                                           ////////////////////
;/////// ************************************************************ ////////////////////
(defun c:04-numbering-wiring-down

( / adoc crnt-block dcl-id i length-set list-01 list-obj-txt num-1 num-2 pnt-1 pnt-2 set-pos start-num str-prfx txt-new txt-old)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-01 (list "=" "+" "Нет"));setq

(if (< (setq dcl-id (load_dialog "dia-04-numbering-wiring-down.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_numbering_wiring_down" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(action_tile "txt-01"
  (strcat "(setq str-prfx (nth (atoi (get_tile \"txt-01\")) list-01))"
          "(setq start-num (get_tile \"txt-02\"))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= str-prfx "Нет") (setq str-prfx nil));

(setq start-num (atoi start-num));setq

(setvar "osmode" 6199)

(while (/= (setq pnt-1 (getpoint "\nУкажите точку 1\n")) nil)
	
	(setq pnt-2 (getpoint "\nУкажите точку 2\n")
				length-set 0
	);setq
		
	(setvar "osmode" 0)
	
	;;;;;;; создаем набор поз обозначений
	(setq set-pos (ssget "_W" pnt-1 pnt-2 '((0 . "*TEXT")))
				length-set (sslength set-pos)
				i 0
				list-obj-txt nil
	);setq
		
	;;;;;;; создаем список поз обозначений
	(repeat length-set
		(setq crnt-block (entget (ssname set-pos i))				  
				  list-obj-txt (vl-list*  crnt-block list-obj-txt)				 
				  i (+ i 1)			 
		);setq
	);repeat
	
	;;;;;;; сортируем список по убыванию y
	(setq list-obj-txt 
		(vl-sort list-obj-txt 
			(function 
				(lambda (num-1 num-2) 
					(> (nth 2 (assoc 11 num-1)) (nth 2 (assoc 11 num-2)))
				);lambda
			);function
		);vl-sort
	);setq
	
	(setq i 0);setq
	
	(repeat length-set
	  (setq txt-new (itoa start-num));setq
	
	  (if (/= str-prfx nil)
	    (setq txt-new (strcat str-prfx txt-new));=
	  );if
	
		(setq txt-new (cons 1 txt-new)
		      crnt-block (nth i list-obj-txt)
					txt-old (assoc 1 crnt-block)
					crnt-block (subst txt-new txt-old crnt-block)
				  i (+ i 1)
				  start-num (+ start-num 1)
		);setq
		
		(entmod crnt-block)
	);repeat
	
	(setq set-pos nil);
	
	(setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////