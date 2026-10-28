;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// кабели для ссвп                                              ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun c:05-cable-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-801 list-802 list-803 list-804 list-900 str-01 str-02 txt-01 txt-02 txt-03)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "05-cable-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
			list-803 nil
			
			list-804 nil
			
			str-01 "0"
			str-02 "0"
);setq

(txt-01-05-cable-01-general str-01)

(txt-02-05-cable-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-05-cable-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_05_cable_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-05-cable-01-general str-01)"
  				"(setq str-02 \"0\")"
  				"(txt-02-05-cable-01-general str-02)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
  				"(txt-02-05-cable-01-general str-02)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-04\" str-03)"
  );srcat
);action_tile

(action_tile "but-1"
  (strcat "(setq txt-01 (nth (atoi (get_tile \"txt-01\")) list-01)"  
  							"txt-02 (nth (atoi (get_tile \"txt-02\")) list-02)" 							
  							"txt-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
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

(but-01-05-cable-01-general txt-01 txt-02 txt-03)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-05-cable-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-900-menu name-file num-flds)
(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(setq list-02 list-01-read-file
			list-803 list-02-read-file
			list-804 list-03-read-file
);setq

(set_tile "hm-31" (nth 0 list-900-menu))
(set_tile "hm-32" (nth 1 list-900-menu))
(set_tile "hm-33" (nth 2 list-900-menu))
(set_tile "hm-41" (nth 3 list-900-menu))
(set_tile "hm-42" (nth 4 list-900-menu))
(set_tile "hm-43" (nth 5 list-900-menu))

(list-filling "txt-02" list-02)

(set_tile "txt-02" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-05-cable-01-general

(str-02 / list-01-read-file list-02-read-file list-900 list-900-dscr list-900-read-file name-file num-flds)

(setq name-file (nth (atoi str-02) list-803)
			num-flds (atoi (nth (atoi str-02) list-804))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 43)
);

(setq list-03 list-01-read-file
			list-04 list-02-read-file
			list-900 list-900-read-file
);setq

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-900" list-900)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")


(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but-01-05-cable-01-general

(txt-01 txt-02 txt-03 / length-txt name-cable pnt-ins pnt-rct-1 pnt-rct-2 pnt-rct-3 pnt-rct-4 pnt-txt1 pnt-txt2 rctn-1 x1-box-txt x2-box-txt x-ins y-ins y-lin y-txt)

(if (or (= txt-02 "ВВГнг(А)-LS (U до 660В)")
				(= txt-02 "ВВГнг(А)-LS (U до 1000В)")
				(= txt-02 "ВВГЭнг-LS (U до 660В)"));or
	(progn
		(setq str-02-lft (substr txt-02 1 (- (vl-string-search "U" txt-02) 2))
					str-02-right (substr txt-02 (- (vl-string-search "U" txt-02) 1));1 \\						
					name-cable (strcat str-02-lft " " txt-03 str-02-right)
		);setq
	);progn
	;
	(setq name-cable (strcat txt-02 " " txt-03));setq
);if


;;;;;;;;вычисляем длину текста
(setq length-txt (textbox (list (cons 1 name-cable)))
			x1-box-txt (car (nth 0 length-txt)); х, левая нижняя точка
 			x2-box-txt (car (nth 1 length-txt)); х, правая верхняя точка
 			length-txt (fix (+ (- x2-box-txt x1-box-txt) 3)) ;длина текста + 2мм снизу и 2мм сверху
);setq

(alert name-cable)
	
(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку\n")) nil)
  (progn
    (setq x-ins (nth 0 pnt-ins)
    	    y-ins (nth 1 pnt-ins)    	    
    	    y-txt (- y-ins length-txt)   	    
    	    y-lin (- y-txt 2)    	    
    	    pnt-txt1 (list x-ins y-txt)    	    
    			pnt-txt2 (list (+ x-ins 4) y-txt)    			
    			pnt-rct-1 (list x-ins (+ y-lin 1))    			
    			pnt-rct-2 (list x-ins (+ y-lin 8))    			
    			pnt-rct-3 (list (+ x-ins 5) (+ y-lin 8))   			
    			pnt-rct-4 (list (+ x-ins 5) (+ y-lin 1))
    );setq)
    
    (setvar "osmode" 0)
    (command "_line" pnt-ins (list x-ins y-lin) "")
    (command "_text" "_bl" pnt-txt1 2.5 90 name-cable)
    (command "_text" "_bl" pnt-txt2 2.5 90 "*** м")
    
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
          (cons 10  pnt-rct-1) ;точки вершин
          (cons 10  pnt-rct-2)
          (cons 10  pnt-rct-3)
          (cons 10  pnt-rct-4)
          (cons 10  pnt-rct-1)
         '(370 . 60) ;толщина линии
         '(62 . 1)
        ) ;list
      );entmakex
    );setq
       
    (setvar "osmode" 6199)
  );progn
);while
	
(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
