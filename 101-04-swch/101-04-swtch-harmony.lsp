;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-swtch-harmony

( / adoc dcl-id list-00 list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-801 list-802 list-901 list-902 str-00 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-swtch-harmony-xb-01-general.txt" 3)

(setq list-00 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file

      list-901 nil
      list-902 nil
      
      str-00 nil
);setq

(txt-00-101-04-swtch-harmony)

(if (< (setq dcl-id (load_dialog "dia-101-04-swtch-harmony.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_swtch_harmony" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-00"
  (strcat "(txt-00-101-04-swtch-harmony)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile


(action_tile "txt-06"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-07"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-08"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-swtch-harmony)");strcat
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
	((= type-list "le") (le-101-04-swtch-harmony));=
	((= type-list "spcf") (spcf-101-04-swtch-harmony));=
	((= type-list "lecgv") (lecgv-101-04-swtch-harmony));=
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
(defun txt-00-101-04-swtch-harmony

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-08-read-file name-file-1 num-flds)

(if (= nil str-00) 
	(setq str-00 (nth 0 list-00)
				name-file-1 (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
				name-file-1 (nth (atoi (get_tile "txt-00")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-00")) list-802))
	);setq
);if

(read-file-for-dialog-box-01 name-file-1 num-flds);

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-06 list-06-read-file
			list-07 list-07-read-file
			list-08 list-08-read-file
);setq


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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-swtch-harmony

( / str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 tmp-list-902)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if


(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

	
(cond
	((= str-00 "XB4 авар.")
		(setq list-901 (vl-list* (strcat "Кн. аварийн. останова " str-01 "  " str-02 "  Цвет " str-03 "  Подсветка " str-04 "  Uпит. " str-05 "  Форма " str-06 "  Возврат " str-07 "  " str-08) list-901))
		);=
		
	((/= str-00 "XB4 авар.") 
		(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Цвет " str-03 "  Подсветка " str-04 "  Эл. питание " str-05 "  Форма " str-06 "  Возврат " str-07 "  " str-08) list-901))
		);=
);cond


(setq tmp-list-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08))
			list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-swtch-harmony

( / cntr-1 pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-6 str-7 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	(cond
		((= str-3 "Зеленый") (setq str-3 "зеленый"));=
		((= str-3 "Красный") (setq str-3 "красный"));=
		((= str-3 "Черный") (setq str-3 "черный"));=
		((= str-3 "Белый") (setq str-3 "белый"));=
	);cond
			
	(cond
		((= str-4 "Нет") (setq str-4 "без подсветки"));=
		((= str-4 "Да") (setq str-4 (strcat "с подсветкой (" str-5 ")")));=
	);cond

	(cond
		((= str-6 "Круг") (setq str-6 "круглая"));=
	);cond
		
	(cond
		((= str-7 "Пружина") (setq str-7 "с возвратом"));=
		((= str-7 "Фиксатор") (setq str-7 "с фиксацией"));=
		((= str-7 "Триггер, поворот") (setq str-7 "триггер, возврат поворотом"));=
		((= str-7 "Триггер, ключ") (setq str-7 "триггер, возврат ключом"));=
	);cond
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-0 "XB4") (= str-0 "XB5") (= str-0 "XB6"))
		(setq str-701 (strcat "Кнопка Schneider Electric, артикул " str-1 ", " str-2 ", цвет " str-3 ", " str-4 ", " str-6 ", " str-7)
					str-702 nil
		);setq
	);if
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-0 "XB4 авар.")
		(setq str-701 (strcat "Кнопка (грибовидный толкатель) Schneider Electric, артикул " str-1 ", цвет " str-3 ", " str-4 ", " str-6 ", " str-7)
					str-702 nil
		);setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-swtch-harmony

( / cntr-1 dlt-y nmbr-ln pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-6 str-7 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;обработка данных
	(cond
		((= str-3 "Зеленый") (setq str-3 "зеленый"));=
		((= str-3 "Красный") (setq str-3 "красный"));=
		((= str-3 "Черный") (setq str-3 "черный"));=
		((= str-3 "Белый") (setq str-3 "белый"));=
	);cond
			
	(cond
		((= str-4 "Нет") (setq str-4 "без подсветки"));=
		((= str-4 "Да") (setq str-4 (strcat "с подсветкой (" str-5 ")")));=
	);cond
		
	(cond
		((= str-6 "Круг") (setq str-6 "круглая"));=
	);cond
		
	(cond
		((= str-7 "Пружина") (setq str-7 "с возвратом"));=
		((= str-7 "Фиксатор") (setq str-7 "с фиксацией"));=
		((= str-7 "Триггер, поворот") (setq str-7 "триггер, возврат поворотом"));=
		((= str-7 "Триггер, ключ") (setq str-7 "триггер, возврат ключом"));=
	);cond
	
	
	;;;;;;;;;///////////////////////////////////////////////////////////////////////////////
	(if (or (= str-0 "XB4") (= str-0 "XB5") (= str-0 "XB6"))
		(progn

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Выключатель кнопочный")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- контакты (" str-2 "), " str-3 " цвет"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-4 ", " str-6 " формы, " str-7))
		);progn	
	);if

	;;;;;;;;;///////////////////////////////////////////////////////////////////////////////
	(if (= str-0 "XB4 авар.")
		(progn

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кнопка (грибовидный толкатель)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- контакты (" str-2 "), " str-3 " цвет"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-4 ", " str-6 " формы, " str-7))
		);progn	
	);if
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-1)
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,05")


 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-swtch-harmony

( / cntr-1 pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-6 str-7 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
				str-99 "0,05"
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	(cond
		((= str-3 "Зеленый") (setq str-3 "зеленый"));=
		((= str-3 "Красный") (setq str-3 "красный"));=
		((= str-3 "Черный") (setq str-3 "черный"));=
		((= str-3 "Белый") (setq str-3 "белый"));=
	);cond
			
	(cond
		((= str-4 "Нет") (setq str-4 "без подсветки"));=
		((= str-4 "Да") (setq str-4 (strcat "с подсветкой (" str-5 ")")));=
	);cond

	(cond
		((= str-6 "Круг") (setq str-6 "круглая"));=
	);cond
		
	(cond
		((= str-7 "Пружина") (setq str-7 "с возвратом"));=
		((= str-7 "Фиксатор") (setq str-7 "с фиксацией"));=
		((= str-7 "Триггер, поворот") (setq str-7 "триггер, возврат поворотом"));=
		((= str-7 "Триггер, ключ") (setq str-7 "триггер, возврат ключом"));=
	);cond
	
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-0 "XB4") (= str-0 "XB5") (= str-0 "XB6"))
		(setq str-701 (strcat "Кнопка Schneider Electric, артикул " str-1 ", " str-2 ", цвет " str-3 ", " str-4 ", " str-6 ", " str-7)
					str-702 nil
					str-703 nil
		);setq
	);if
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-0 "XB4 авар.")
		(setq str-701 (strcat "Кнопка (грибовидный толкатель) Schneider Electric, артикул " str-1 ", " str-2 ", цвет " str-3 ", " str-4 ", " str-6 ", " str-7)
					str-702 nil
					str-703 nil
		);setq
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////