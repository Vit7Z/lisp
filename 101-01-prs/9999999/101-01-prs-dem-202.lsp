;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-dem-202

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-14 list-15 list-16 list-17 list-18 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-01 nil
      counter 0
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-dem-202)

(if (< (setq dcl-id (load_dialog "dia-101-dem-202.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_dem_202" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(tmp-strt-101-dem-202)"
  );strcat
);action_tile

;(action_tile "txt-02"
;  (strcat "(txt-02-101-dem-202)"
;  );strcat
;);action_tile
;
;(action_tile "txt-03"
;  (strcat "(txt-03-101-dem-202)"
;  );strcat
;);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-dem-202)"
  );strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
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

(if (= type-list "le")
	(tmp-le-101-dem-202)
);if

(if (= type-list "spcf")
	(tmp-spcf-101-dem-202)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-dem-202

( / file-open path-file-open str-f str-lft-01 str-lft-02 str-lft-03 str-lft-04 str-lft-05 swtch)

(setq list-01 nil
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-06 nil
			str-lft-01 ""
      str-lft-02 ""
      str-lft-03 ""
      str-lft-04 ""
      str-lft-05 ""
      str-f 1
);setq

(setq path-file-open (findfile "101-dem-202.txt");открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
      swtch 4
);setq

(if (= swtch 4)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open);читаем строку
			);setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));1 \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
							str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f));2 \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
							str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f));3 \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
							str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f));4 \\
							str-lft-05 (substr str-f (+ (vl-string-search "\\" str-f) 2));5 \\
							
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
							list-03 (vl-list* str-lft-03 list-03)
							list-04 (vl-list* str-lft-04 list-04)
							list-05 (vl-list* str-lft-05 list-05)
				);setq
			);if
		);while
	);progn
);if

(close file-open)

(setq list-01 (reverse (vl-remove "" list-01))
      list-02 (reverse (vl-remove "" list-02))
      list-03 (reverse (vl-remove "" list-03))
      list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
      list-06 (list "ООО \"НПФ \"РАСКО\"")
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-dem-202

( / str-01 str-01-1)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-01-1 (get_tile "txt-01")
);setq

(set_tile "txt-02" str-01-1)
(set_tile "txt-03" str-01-1)
(set_tile "txt-04" str-01-1)
(set_tile "txt-05" str-01-1)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-dem-202

( / str-02 str-03)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq



(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-dem-202

( / str-01 str-02 str-03 str-04 str-05 str-06 str-99 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

;(princ "\n          str-01 = ") (princ str-01);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(cond ;масса
	((= 4 (vl-string-mismatch "ДЕМ " str-01)) (setq str-99 "0,9"));=
);cond

(if (= 4 (vl-string-mismatch "ДЕМ " str-01))
	(progn
  	(setq list-901 (vl-list* (strcat str-01 "  Уставки " str-02 "МПа  " str-04 "  " str-05) list-901)
  	);setq
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 str-99))
					list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn	
);if =

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-dem-202

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-6 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	); setq
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq nmbr-ln 3 ;количество строк
	);setq
	
	(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Датчик-реле разности давления " str-tmp-1 "," ))
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "пределы уставок " str-tmp-2 "МПа"))

	(setq cntr-1 (1+ cntr-1));setq
	
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-dem-202

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq

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
		
	;обработка данных
	(if (= str-tmp-6 "ООО \"НПФ \"РАСКО\"")
		(progn
			(setq nmbr-ln 7
			);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(cond
				((= str-tmp-4 "Ниппель диам. 8мм.") (setq str-tmp-4 "ниппель, наружный диаметр 8мм."));=
			);cond
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Датчик-реле разности давления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- пределы уставок " str-tmp-2 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- максимальное давление " str-tmp-3 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- присоединение " str-tmp-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "- коммутируемый ток перменного напряжения 0,1...6А")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "- коммутируемый ток постоянного напряжения 24...220 В, 0,05 А, 60Вт")
			
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-1) ;Тип, марка, обозначение документа, опросного листа
			
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"НПФ \"РАСКО\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")

			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
		);progn
	);if
	
	
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat
	
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
