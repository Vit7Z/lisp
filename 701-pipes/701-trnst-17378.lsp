;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////
;/////// переходы                                                     ///////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////
(defun c:701-trnst-17378

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-901 list-902 str-01 str-02 str-04 str-f type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0);системные переменные

(setvar "textstyle" "Standard")

(setq str-f 1
			str-01 nil
			str-02 nil
			str-04 nil
      counter 0
      list-01 (list "1" "2")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-701-trnst-17378)

(if (< (setq dcl-id (load_dialog "dia-701-trnst-17378.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_trnst_17378" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01" (strcat "(tmp-strt-701-trnst-17378)"));action_tile

(action_tile "txt-02"
	(strcat "(txt-02-701-trnst-17378)"
					"(set_tile \"txt-03\" (get_tile \"txt-02\"))"
	);strcat
);action_tile



(action_tile "txt-04" 
	(strcat "(set_tile \"txt-05\" (get_tile \"txt-04\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-04\"))"
					"(set_tile \"txt-07\" (get_tile \"txt-04\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-04\"))"
  );strcat
);action_tile

(action_tile "txt-05" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-05\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-05\"))"
					"(set_tile \"txt-07\" (get_tile \"txt-05\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-05\"))"
  );strcat
);action_tile

(action_tile "txt-06" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-05\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-07\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-06\"))"
  );strcat
);action_tile

(action_tile "txt-07" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-07\"))"
					"(set_tile \"txt-05\" (get_tile \"txt-07\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-07\"))"
					"(set_tile \"txt-08\" (get_tile \"txt-07\"))"
  );strcat
);action_tile

(action_tile "txt-08" 
	(strcat "(set_tile \"txt-04\" (get_tile \"txt-08\"))"
					"(set_tile \"txt-05\" (get_tile \"txt-08\"))"
					"(set_tile \"txt-06\" (get_tile \"txt-08\"))"
					"(set_tile \"txt-07\" (get_tile \"txt-08\"))"
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
(defun tmp-strt-701-trnst-17378

()

(if (= nil str-01) 
	(setq str-01 "1");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond 
	((= str-01 "2") 
		(setq list-02 (list "32" "40" "50" "65" "80" "100")
					list-03 (list "38" "45" "57" "76" "89" "108")
					list-04 (list "2" "3" "4" "2" "3" "4")
					list-05 (list "32" "32" "32" "25" "25" "25")
					list-06 (list "2" "3" "4" "1,6" "3" "3")
					list-07 (list "30" "30" "30" "30" "30" "30")
					list-08 (list "0,1" "0,2" "0,2" "0,1" "0,2" "0,2")
		);setq
	);=
);cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-701-trnst-17378

( / file-name file-open path-file-open str-01 str-02 str-f str-lft-04 str-lft-05 str-lft-06 str-lft-07 str-lft-08)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(cond 
	((and (= str-01 "2") (= str-02 "32")) (setq file-name "701-trnst-17378-2001-execution-2-d-32.txt"));=
	
	((and (= str-01 "2") (= str-02 "50")) (setq file-name "701-trnst-17378-2001-execution-2-d-50.txt"));=
	

);cond

(setq list-04 nil
			list-05 nil
			list-06 nil
			list-07 nil
			list-08 nil
			
			str-lft-04 ""
      str-lft-05 ""
      str-lft-06 ""
      str-lft-07 ""
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
					str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
					str-lft-08 (substr str-f (+ (vl-string-search "\\" str-f) 2))	
						
					list-04 (vl-list* str-lft-04 list-04)
					list-05 (vl-list* str-lft-05 list-05)
					list-06 (vl-list* str-lft-06 list-06)
					list-07 (vl-list* str-lft-07 list-07)
					list-08 (vl-list* str-lft-08 list-08)						
		);setq
	);if
);while

(close file-open)

(setq list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
      list-06 (reverse (vl-remove "" list-06))
      list-07 (reverse (vl-remove "" list-07))
      list-08 (reverse (vl-remove "" list-08))
);setq

(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
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
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(if (= str-01 "2")
	(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08))
				list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
				list-901 (vl-list* (strcat "Исполнение 2    К-" str-03 "." str-04 "-" str-05 "." str-06 "    " str-03 " х " str-05) list-901)
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

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-8 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-11 nil
				str-tmp-12 nil
	);setq
	
	;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
	;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	);setq
	
	(09-empt-lin-le-cgv)
	
	(setvar "osmode" 0)
	
	(setvar "cmdecho" 0)

	(setq nmbr-ln 3);setq
	
	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 17378-2001")
	
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переход концентрический")
	
	(cond 
		((= str-tmp-1 "2")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "К-" str-tmp-3 "." str-tmp-4 "-" str-tmp-5 "." str-tmp-6))
		);=
		
	);cond
		
	(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-8)

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

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-8 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
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
	
	(setq nmbr-ln 3);setq
	
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
	
	(setvar "osmode" 0)
	
	(setvar "cmdecho" 0)
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переход концентрический")
	
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-tmp-7 "мм."))
	
	(cond
		((= str-tmp-1 "2") 
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "К-" str-tmp-3 "." str-tmp-4 "-" str-tmp-5 "." str-tmp-6))
		);=
		
	);cond
	
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ГОСТ 17378-2001")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-8);масса
	
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



