;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// металлоконструкции шкафов                                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mtl-cs-shshm

( / adoc dcl-id file-name file-open list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-901 list-902 path-file-open str-01 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq str-f 1;переменные
			str-01 nil
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-901 nil	
			list-902 nil	
			file-name nil
			file-open nil
			path-file-open nil
);setq

(read-file-101-08-mtl-cs-shshm)

(if (< (setq dcl-id (load_dialog "dia-101-08-mtl-cs-shshm.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_case_metal" dcl-id))
		(exit)
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-01"
  (strcat "(start-101-08-mtl-cs-shshm)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-08-mtl-cs-shshm)");srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-mtl-cs-shshm)");strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
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

(cond
	((= type-list "spcf") (spcf-101-08-mtl-cs-shshm));=
	((= type-list "lecgv") (lecgv-101-08-mtl-cs-shshm));=
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun read-file-101-08-mtl-cs-shshm

( / file-open path-file-open str-f str-lft-02 str-lft-03 str-lft-04 str-lft-05 str-lft-06 str-lft-07)

(setq list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
      str-lft-02 ""
      str-lft-03 ""
      str-lft-04 ""
      str-lft-05 ""
      str-f 1
);setq

(setq file-name "101-08-mtl-cs-shshm.txt"
			path-file-open (findfile file-name);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
	(setq str-f (read-line file-open));setq
	(if (/= str-f nil)
		(setq str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));3 \\
					str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
					str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))	
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));5 \\
					str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))	

					list-02 (vl-list* str-lft-02 list-02);создаем список из считанных строк из файла
					list-03 (vl-list* str-lft-03 list-03)
					list-04 (vl-list* str-lft-04 list-04)
					list-05 (vl-list* str-lft-05 list-05)
	
		);setq
	);if
);while


(close file-open)

(setq list-02 (reverse (vl-remove "" list-02))
      list-03 (reverse (vl-remove "" list-03))
      list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
);setq

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-08-mtl-cs-shshm

( / str-02)

(set_tile "txt-03" (get_tile "txt-02"))
(set_tile "txt-04" (get_tile "txt-02"))
(set_tile "txt-05" (get_tile "txt-02"))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// формирование данных, заполнение поля "выбрано"               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-mtl-cs-shshm

( / cntr-1 str-01 str-02 str-03 str-05 str-06 str-07 str-902 str-99 swtch)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-99 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq list-901 (vl-list* (strcat "ЩШ  " 
																 str-03 "  "
																 str-02 " (ВхШхГ, мм.)  " 
																 str-05
																		 ) list-901)										  
);setq
		
		;для пэ, зс
(setq str-902 (list (cons 1 str-02) (cons 2 str-03) (cons 3 str-05) (cons 99 str-99))
			list-902 (vl-list* str-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в ОВШ ЩШМ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-08-mtl-cs-shshm

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp));масса
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq
	
	

	
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Щит шкафной малогабаритный")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "ЩШ " str-tmp-2 ", " str-tmp-1 " (ВхШхГ, мм.)"))
	
	(repeat nmbr-ln
		(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в СПЦФ ЩШМ                                             ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-mtl-cs-shshm

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp));масса
	);setq
	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 4
	); setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
		
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Щит шкафной малогабаритный"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- размеры (ВхШхГ, мм.) " str-tmp-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- обслуживание одностороннее")
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ЩШМ-" str-tmp-2)) ;Тип, марка, обозначение документа, опросного листа
		
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ПКФ \"Автоматика\",");производитель
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Тула")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
