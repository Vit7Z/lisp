;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-swtch-series-k

( / adoc dcl-id file-name list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo


(setq list-01 (list "К10")
      
      list-901 nil
      list-902 nil
      
			file-name nil
			
			str-01 nil
);setq

(txt-01-101-04-swtch-series-k)

(if (< (setq dcl-id (load_dialog "dia-101-04-swtch-series-k.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_swtch_series_k" dcl-id))
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
  (strcat "(txt-01-101-04-swtch-series-k)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-04-swtch-series-k)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-04-swtch-series-k)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(txt-04-101-04-swtch-series-k)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-04-swtch-series-k)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-swtch-series-k)"
  				"(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
					"(list-filling \"txt-06\" list-06)"
					"(list-filling \"txt-07\" list-07)"
					"(list-filling \"txt-08\" list-08)"
					"(set_tile \"txt-01\" \"0\")"
					"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
					"(set_tile \"txt-06\" \"0\")"
          "(set_tile \"txt-07\" \"0\")"
          "(set_tile \"txt-08\" \"0\")"
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
	((= type-list "le") (le-101-04-swtch-series-k));=
	((= type-list "spcf") (spcf-101-04-swtch-series-k));=
	((= type-list "lecgv") (lecgv-101-04-swtch-series-k));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-swtch-series-k

( / file-name file-open path-file-open str-f str-lft-02 str-lft-03 str-lft-04 str-lft-05 str-lft-06)

(setq str-f 1
			str-lft-02 nil
			str-lft-03 nil
			str-lft-04 nil
			str-lft-05 nil
			str-lft-06 nil
);setq

(cond
	((= nil str-01) (setq str-01 "К10"));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-01")) list-01)));=
);cond

(cond
	((= str-01 "К10") (setq file-name "101-04-swtch-series-k10.txt")); =

);cond

(setq path-file-open (findfile file-name)
			file-open (open path-file-open "r")
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-06 nil
);setq

(while (/= str-f nil)
	(setq str-f (read-line file-open));setq
			
	(if (/= str-f nil)
		(setq str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f));1 \\
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
					str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f));2 \\
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
					str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f));3 \\		
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
					str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f));4 \\
					str-lft-06 (substr str-f (+ (vl-string-search "\\" str-f) 2))
					
					list-02 (vl-list* str-lft-02 list-02);создаем список из считанных строк из файла
					list-03 (vl-list* str-lft-03 list-03)
					list-04 (vl-list* str-lft-04 list-04)
					list-05 (vl-list* str-lft-05 list-05)
					list-06 (vl-list* str-lft-06 list-06)
		);setq
	);if
);while

(close file-open)

(setq list-02 (reverse (vl-remove "" list-02))
			list-03 (reverse (vl-remove "" list-03))
      list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
      list-06 (reverse (vl-remove "" list-06))
);setq


(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

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
;;;; txt-02 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-swtch-series-k

( / str-01)

(setq str-01 (get_tile "txt-02"));setq

(set_tile "txt-03" str-01)
(set_tile "txt-04" str-01)
(set_tile "txt-05" str-01)
(set_tile "txt-06" str-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-03 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-04-swtch-series-k

( / str-01)

(setq str-01 (get_tile "txt-03"));setq

(set_tile "txt-02" str-01)
(set_tile "txt-04" str-01)
(set_tile "txt-05" str-01)
(set_tile "txt-06" str-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-04 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-101-04-swtch-series-k

( / str-01)

(setq str-01 (get_tile "txt-04"));setq

(set_tile "txt-02" str-01)
(set_tile "txt-03" str-01)
(set_tile "txt-05" str-01)
(set_tile "txt-06" str-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-05 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-04-swtch-series-k

( / str-01)

(setq str-01 (get_tile "txt-05"));setq

(set_tile "txt-02" str-01)
(set_tile "txt-03" str-01)
(set_tile "txt-04" str-01)
(set_tile "txt-06" str-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-swtch-series-k

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-02 (get_tile "txt-02"));setq

(if (= "К10" str-01)
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)
		);setq
	
		(setq list-901 (vl-list* (strcat "Переключатель " str-02 "  Полюсов " str-03 "  Положения " str-04 "  Ток " str-05 "А  Возврат " str-06) list-901));setq
	
		
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 "0,05"))
					list-902 (vl-list* tmp-list-902 list-902)
		);setq
		
	);progn
);if

(cond
	((= swtch nil) (setq list-902 (reverse list-902)));=
	((/= swtch nil) (setq list-902 (reverse list-902)));=
);cond

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-swtch-series-k

( / cntr-1 dlt-y nmbr-ln pnt-ins str-1 str-2 str-3 str-4 str-5 str-6 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
	);setq

;	(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;	(getstring "\nPress Enter to continue...");Erase_DV
	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8

	);setq
	
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-1 "К10")
		(progn

			(cond
				((= str-3 "1") (setq str-3 (strcat str-3 " полюс")));=
				((= str-3 "2") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "3") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "4") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "5") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "6") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "7") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "8") (setq str-3 (strcat str-3 " полюсов")));=
			);cond

			(cond
				((= str-4 "1, 2, 0") (setq str-4 "3 положения (1, 2, 0)"));=
				((= str-4 "1...3, 0") (setq str-4 "4 положения (1...3, 0)"));=
				((= str-4 "1...3") (setq str-4 "3 положения (1...3)"));=
				
			);cond
			
			(cond
				((= str-6 "Нет") (setq str-6 "без самовозврата"));=

			);cond
			
	
			(setq nmbr-ln 4);setq
	
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переключатель кулачковый Schneider Electric, серия K, артикул")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-2 ", " str-3 ", " str-4 ", номинальный"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "ток " str-5 "А, " str-6))

		);progn	
	);if
	

	

	(setq cntr-1 (1+ cntr-1));setq
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-swtch-series-k

( / cntr-1 dlt-y nmbr-ln pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-6 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
	
	
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
	
	(setq nmbr-ln 7);setq
			
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
			
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переключатель кулачковый")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- серия K")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- количество полюсов " str-3))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- положения " str-4))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- номинальный ток " str-5 "А"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- самовозварт " (strcase str-6 1)))
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-2) ;Тип, марка, обозначение документа, опросного листа

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-swtch-series-k

( / cntr-1 dlt-y nmbr-ln pnt-ins str-1 str-2 str-3 str-4 str-5 str-6 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(princ "\n       str-tmp = ") (princ str-tmp);Erase_DV
	(getstring "\nPress Enter to continue...");Erase_DV

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

	;обработка данных	

	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-1 "К10")
		(progn

			(cond
				((= str-3 "1") (setq str-3 (strcat str-3 " полюс")));=
				((= str-3 "2") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "3") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "4") (setq str-3 (strcat str-3 " полюса")));=
				((= str-3 "5") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "6") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "7") (setq str-3 (strcat str-3 " полюсов")));=
				((= str-3 "8") (setq str-3 (strcat str-3 " полюсов")));=
			);cond

			(cond
				((= str-4 "1, 2, 0") (setq str-4 "3 положения (1, 2, 0)"));=
				((= str-4 "1...3, 0") (setq str-4 "4 положения (1...3, 0)"));=
				((= str-4 "1...3") (setq str-4 "3 положения (1...3)"));=
				
			);cond
			
			(cond
				((= str-6 "Нет") (setq str-6 "без самовозврата"));=
	
			);cond
			
			(setq nmbr-ln 6);setq
	
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переключатель кулачковый Schneider")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Electric, серия K, артикул")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-2 ", " str-3 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-4 ", номинальный"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "ток " str-5 "А, " str-6))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,097")
		);progn	
	);if



	

	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////