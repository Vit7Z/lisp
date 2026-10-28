;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////
;/////// отводы                                                       ///////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////
(defun c:701-removals

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-08 list-901 list-902 str-01 str-02 str-04 str-f type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0);системные переменные

(setvar "textstyle" "Standard")

(setq str-f 1
			str-01 nil
			str-02 nil
			str-04 nil
      counter 0
      list-01 (list "ГОСТ 17375, исп. 1" "ГОСТ 17375, исп. 2")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-701-removals)

(if (< (setq dcl-id (load_dialog "dia-701-removals.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_701_removals" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(list-filling "txt-08" list-08)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(set_tile "txt-08" "0")

(action_tile "txt-01" (strcat "(tmp-strt-701-removals)"));action_tile

(action_tile "txt-02"
	(strcat "(txt-02-701-removals)"
					"(set_tile \"txt-03\" (get_tile \"txt-02\"))"
	);strcat
);action_tile



(action_tile "txt-04" 
	(strcat "(set_tile \"txt-05\" (get_tile \"txt-04\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-04\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-04\"))"
  );strcat
);action_tile

(action_tile "txt-05" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-05\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-05\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-05\"))"
  );strcat
);action_tile

(action_tile "txt-06" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-05\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-06\"))"
  );strcat
);action_tile

(action_tile "txt-08" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-08\"))"
					"(set_tile \"txt-05\" (get_tile \"txt-08\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-08\"))"
  );strcat
);action_tile

(action_tile "but1"
	(strcat "(tmp-filling-fields-701-trnst-17378)")
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

(start_dialog)

(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-701-trnst-17378));if

(if (= type-list "spcf") (tmp-spcf-701-trnst-17378));if

(setvar "osmode" 6199)

(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-701-removals

()

(if (= nil str-01) 
	(setq str-01 "ГОСТ 17375, исп. 1");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond 
	((= str-01 "ГОСТ 17375, исп. 2") 
		(setq list-02 (list "32" "50" "150"));setq
		(txt-02-701-removals)
	);=
);cond

(list-filling "txt-02" list-02)

(set_tile "txt-02" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-701-removals

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(cond 
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-02 "32")) (setq list-03 (list "38")));=
	
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-02 "50")) (setq list-03 (list "57")));=
	
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-02 "150")) (setq list-03 (list "159" "168")));=
	
);cond

(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(txt-03-701-removals)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-701-removals

( / file-name file-open path-file-open str-01 str-03 str-f str-lft-04 str-lft-05 str-lft-06 str-lft-08)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(cond 
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-03 "38")) (setq file-name "701-removals-17375-2001-execution-2-d-38.txt"));=
	
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-03 "57")) (setq file-name "701-removals-17375-2001-execution-2-d-57.txt"));=
	
	
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-03 "159")) (setq file-name "701-removals-17375-2001-execution-2-d-159.txt"));=
	((and (= str-01 "ГОСТ 17375, исп. 2") (= str-03 "168")) (setq file-name "701-removals-17375-2001-execution-2-d-168.txt"));=
);cond

(setq list-04 nil
			list-05 nil
			list-06 nil

			list-08 nil
			
			str-lft-04 ""
      str-lft-05 ""
      str-lft-06 ""

      str-lft-08 ""
      
      str-f 1
);setq

(setq path-file-open (findfile file-name);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
	(setq str-f (read-line file-open));читаем строку
			
	(if (/= str-f nil)
		(setq str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));2 \\
					str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));3 \\
					str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));13 \\
					str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))	
						
					list-04 (vl-list* str-lft-04 list-04)
					list-05 (vl-list* str-lft-05 list-05)
					list-06 (vl-list* str-lft-06 list-06)

					list-08 (vl-list* str-lft-08 list-08)						
		);setq
	);if
);while

(close file-open)

(setq list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
      list-06 (reverse (vl-remove "" list-06))

      list-08 (reverse (vl-remove "" list-08))
);setq

(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(list-filling "txt-08" list-08)

(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(set_tile "txt-08" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-701-trnst-17378

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-902 swtch)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)

			str-08 (nth (atoi (get_tile "txt-08")) list-08)
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(if (= str-01 "ГОСТ 17375, исп. 2")
	(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 str-08))
				list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
				list-901 (vl-list* (strcat str-01 "  Угол " str-06 " Диаметр " str-03 " Толщина " str-04) list-901)
	);setq
);if

(if (= swtch nil) (setq list-902 (reverse list-902)));if

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-701-trnst-17378

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
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
	);setq
	
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ГОСТ 17375, исп. 1")
		(progn
			(09-empt-lin-le-cgv)
			
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
		
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 17375-2001")
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Отвод " str-tmp-6 "-1-" str-tmp-3 "-" str-tmp-4))
			
			;(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 )
		);progn
	);if
	
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ГОСТ 17375, исп. 2")
		(progn
			(09-empt-lin-le-cgv)
			
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
		
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 17375-2001")
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Отвод " str-tmp-6 "-" str-tmp-3 " " str-tmp-4))

		);progn
	);if

	
	(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)	
		
	(setq cntr-1 (1+ cntr-1));setq
	
	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-701-trnst-17378

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

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
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ГОСТ 17375, исп. 2")
		(progn	
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Отвод")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- исполнение 2")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- диаметр " str-tmp-3 "мм, угол " str-tmp-6 "%%d, толщина стенки " str-tmp-4 "мм"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Отвод " str-tmp-6 "-" str-tmp-3 " " str-tmp-4))
		);progn
	);if

			
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ГОСТ 17375-2001")
			
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
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



