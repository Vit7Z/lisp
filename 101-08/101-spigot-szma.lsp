;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-spigot-szma

( / adoc dcl-id dlt-y file-open list-10 list-11 list-12 path-file-open pnt-ins str-f str-left str-left-1 str-left-2 txt-10 txt-12 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-f 1;переменные
      list-10 (list "")
      list-11 (list "")
      list-12 (list "")
      str-left ""
      str-left-1 ""
      str-left-2 ""
);setq

(setq path-file-open (findfile "101-spigot-szma.txt");открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
  (setq str-f (read-line file-open);читаем строку
  );setq
  (if (/= str-f nil)
    (setq str-left (substr str-f 1 (vl-string-search "\\" str-f));первые \\, диаметр жилы
    
          str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\, цвет
          str-left-1 (substr str-f 1 (vl-string-search "\\" str-f))
          
          str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\, наименование
          str-left-2 (substr str-f 1 (vl-string-search "\\" str-f))
            
          list-10 (vl-list* str-left list-10);создаем список из считанных строк из файла
          list-11 (vl-list* str-left-1 list-11)
          list-12 (vl-list* str-left-2 list-12)
    );setq
  );if
);while

(close file-open)

(setq list-10 (reverse (vl-remove "" list-10))
      list-11 (reverse (vl-remove "" list-11))
      list-12 (reverse (vl-remove "" list-12))
);setq

(if (< (setq dcl-id (load_dialog "101-dia-spigot-szma.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_spigot_szma" dcl-id))
		(exit)
);if

(list-filling "txt-10" list-10)
(set_tile "txt-10" "0")

(list-filling "txt-11" list-11)
(set_tile "txt-11" "0")

(list-filling "txt-12" list-12)
(set_tile "txt-12" "0")

(action_tile "txt-10"
  (strcat "(set_tile \"txt-11\" $value)"
          "(set_tile \"txt-12\" $value)"
          "(set_tile \"txt-13\" $value)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(setq txt-10 (nth (atoi (get_tile \"txt-10\")) list-10))"
          "(setq txt-11 (nth (atoi (get_tile \"txt-11\")) list-11))"
          "(setq txt-12 (nth (atoi (get_tile \"txt-12\")) list-12))"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "cancel"
  (strcat "(done_dialog)"
          "(exit)")
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	    x-pnt-ins (nth 0 pnt-ins)
	    y-pnt-ins (nth 1 pnt-ins)
	    y-pnt-ins-1 y-pnt-ins
	    dlt-y 8
); setq

(101-empt-lin-spcf)

(setvar "osmode" 0)
(setvar "cmdecho" 0)
(repeat 3
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  (setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  );setq
);repeat

(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Втулка полуразъемная")
(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- условный проход трубы " txt-12 " мм2"))

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Втулка полуразъемная " txt-10))
(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "ТУ 36-1899-80"))
						
;(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ПКЦ\" \"СЗЭМ\",")
;(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Санкт-Петербург")
		
(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

(command "_text" "_MC" (list (+ x-pnt-ins 323) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,002")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////