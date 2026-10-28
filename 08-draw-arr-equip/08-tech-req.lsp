;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование технических требований                             //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:08-tech-req

( / adoc append-lst-tpm counter dcl-id file-open list-01 list-01-read-file list-901 list-doc lngth-list-doc lst-tpm num-iter pnt-1 str-doc str-f txt-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)

(setq list-01-read-file nil
			
      file-open (open (findfile "08-tech-req.txt") "r")
      
      str-f (read-line file-open)
);setq

(while (/= str-f nil)
	(setq list-01-read-file (vl-list* str-f list-01-read-file)
						
				str-f (read-line file-open)					
	);setq
);while

(close file-open)

(setq list-01-read-file (reverse (vl-remove "" list-01-read-file))

			list-01 list-01-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-08-tech-req.dcl")) 0);формируем окно диалога
		(progn
			(alert "Ќе найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_03_tech_rqrmnts" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(set_tile "txt-01" "0")

(action_tile "but-01"
  (strcat "(filling-fields-03-tchn-rqrmnts)");strcat
);action_tile

(action_tile "but-02"
  (strcat "(done_dialog)");strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq counter 0
			list-doc ""
);setq

(repeat (length list-901)
  (setq str-doc (nth counter list-901)
  			str-doc (strcat (itoa (+ counter 1)) ". " str-doc)
  
        str-doc (strcat str-doc "\\P")
        list-doc (strcat list-doc str-doc)
        counter (+ counter 1)
  );setq
);repeat

(setq list-doc (vl-string-right-trim "\\P" list-doc)
			list-doc (list (cons 1 list-doc))
);setq

(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\n”кажите точку вставки\n"));setq

(setvar "osmode" 0)

(setq txt-1
  (entmake
    (vl-list*
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-1) ;нач точка текста
      '(8 . "0")
      '(40 . 2.5) ;высота текста
      '(41 . 180) ;раст€жение текста
      '(42 . 180) ;ширина текста
      '(44 . 1.2) ;ширина текста
      '(71 . 7) ;гориз выравнивание текста
      '(370 . -1) ;толщина текста
       ;(cons 7 "Standard") ;стиль текста
       (cons 7 (getvar "textstyle"))
       list-doc
    );list
  );entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец                                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формировани€ данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-08-tech-req

( / cntr-1 str-01 str-02-01)

(setq str-01 (get_tile "txt-01");список с номерами выбранных строк
      cntr-1 0
);setq
  
(if (/= list-901 nil) 
	(setq list-901 (reverse list-901))
);if
  
(setq str-01 (strcat "(" str-01 ")");преобразуем строку в список
      str-01 (read str-01)
);setq

(repeat (length str-01)
  (setq str-02-01 (nth (nth cntr-1 str-01) list-01)
				list-901 (vl-list* str-02-01 list-901)		
				cntr-1 (1+ cntr-1)
	);setq
);repeat

(setq list-901 (reverse list-901));setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


