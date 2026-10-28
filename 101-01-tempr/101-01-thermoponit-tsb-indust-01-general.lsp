;/////// ************************************************************ //////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 101-01-thermoponit-tsb-indust-01-general

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-13 
list-14 list-15 list-17 list-18 list-19 list-20 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      counter 0
      list-01 (list "ТС-Б, головка Д, крепл. ПШ, прямой термобаллон")
      list-901 nil
      list-902 nil
);setq

(start-101-01-thermoponit-tsb-indust-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-thermoponit-tsb-indust-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
    (exit)
  );progn
);if

(if (not (new_dialog "dia_101_01_thermoponit_ts_b" dcl-id))
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
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-18" "0")

(action_tile "txt-01"
  (strcat "(start-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-04"
  (strcat "(txt-04-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-08"
  (strcat "(txt-08-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-09"
  (strcat "(txt-09-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-101-01-thermoponit-tsb-indust-01-general)");strcat
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

(cond
	((= type-list "le") (le-101-01-thermoponit-tsb-indust-01-general));=
	((= type-list "spcf") (spcf-101-01-thermoponit-tsb-indust-01-general));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-01-thermoponit-tsb-indust-01-general

( / )

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01));setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "ТС-Б, головка Д, крепл. ПШ, прямой термобаллон" str-01)
	(setq list-02 (list "Нет" )
			  list-03 (list "Pt100");"06 (штуцер подвижн.)" "07 (штуцер подвижн.)"
				list-04 (list "АА" "А" "В" "С")
				list-05 (list "х3" "х4" "х2")
				list-06 (list "П - прямая")
				list-07 (list "-50...+250" "-50...+450" "-50...+600" "-50...+600")
				list-08 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800")
				list-09 (list "6" "8" "10")
				list-10 (list "Нет")
				list-11 (list "Нет")
        list-12 (list "ПШ")
				list-13 (list "50" "120")
				list-14 (list "10" "8" "6")
				list-15 (list "М20х1,5")
        list-16 (list "Д")
				list-17 (list "IP65")
				list-18 (list "МГ" "ПГ")	
	);setq
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-18" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (= str-01 "ТС-Б, головка Д, крепл. ПШ, прямой термобаллон")
	(cond
		((= "Pt100" str-03)
    	(setq list-04 (list "АА" "А" "В" "С")
    	      list-07 (list "-50...+250" "-50...+450" "-50...+600" "-50...+600")
    	);setq
		);=
	);cond
);if

(list-filling "txt-04" list-04)
(list-filling "txt-07" list-07)

(set_tile "txt-04" "0")
(set_tile "txt-07" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-03)

(set_tile "txt-07" $value)

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-08-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-08)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

(if (= str-01 "ТС-Б, головка Д, крепл. ПШ, прямой термобаллон")
	(cond 
		((= str-08 "60") (setq list-09 (list "6" "8" "10")));
		((= str-08 "80") (setq list-09 (list "6" "8" "10")));
		((= str-08 "100") (setq list-09 (list "6" "8" "10")));
		((= str-08 "120") (setq list-09 (list "6" "8" "10")));
		((= str-08 "160") (setq list-09 (list "6" "8" "10")));
		((= str-08 "200") (setq list-09 (list "6" "8" "10")));
		((= str-08 "250") (setq list-09 (list "6" "8" "10")));
		((= str-08 "320") (setq list-09 (list "6" "8" "10")));
		((= str-08 "400") (setq list-09 (list "8" "10")));
		((= str-08 "500") (setq list-09 (list "8" "10")));
		((= str-08 "630") (setq list-09 (list "8" "10")));
		((= str-08 "800") (setq list-09 (list "8" "10")));
	);cond
);if

(list-filling "txt-09" list-09)

(set_tile "txt-09" "0")

(txt-09-101-01-thermoponit-tsb-indust-01-general)

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-09-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-09)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
);setq

(if (= str-01 "ТС-Б, головка Е, крепл. ПШ, прямой термобаллон")
	(cond 
		((= str-09 "6") (setq list-14 (list "10" "8" "6" )));
		((= str-09 "8") (setq list-14 (list "12" "10" "8")));
	);cond
);if

(list-filling "txt-14" list-14)

(set_tile "txt-14" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fill-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 
str-16 str-17 str-18 str-99 str-order tmp-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-18 (nth (atoi (get_tile "txt-18")) list-18)
			
      cntr-1 0
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ТС-Б, головка Д, крепл. ПШ, прямой термобаллон")
	(progn
		(setq str-99
			(cond	
				((and (>= (atoi str-08) 60) (<= (atoi str-08) 120)) "0,5")
				((and (>= (atoi str-08) 160) (<= (atoi str-08) 500)) "0,6")
				((and (>= (atoi str-08) 630) (<= (atoi str-08) 1000)) "0,8")
				((and (>= (atoi str-08) 1250) (<= (atoi str-08) 2000)) "1,1")
				((>= (atoi str-08) 2500) "1,5")
			);cond
		);setq

		(setq list-901 (vl-list* (strcat "ТС-Б  " str-03 "  " str-04 "  " str-05 "  " str-07 "С  Lпогр. " str-08 "мм  Диам. ЧЭ " 
																		 str-09 "мм  Ступень " str-11 "  " str-12 "  Lнар. ч " str-13 "мм  Диам. нар. ч " str-14 "мм  " 
																		 str-15 "  Клемм. головка " str-16) list-901)
																		 
		      str-order (strcat "ТС-Б-" str-03 "-" str-04 "-" str-05 "-П-(" str-07 "%%dC)-" str-08 "/"str-09 "-" str-12 "." str-13 "/" str-14 "." str-15 "-" 
																		str-16 "-" str-18)
		);setq
		
		(cond 
		  ((= str-05 "х3") (setq str-05 "сх. соединенией 3-х проводная"));
		  ((= str-05 "х2") (setq str-05 "сх. соединенией 2-х проводная"));
		  ((= str-05 "х4") (setq str-05 "сх. соединенией 4-х проводная"));
	  );cond
				
		(setq tmp-902 (list (cons 1 "ТС-Б") 
		                    (cons 2 str-order) 
		                    (cons 3 (strcat "НСХ " str-03))
		                    (cons 4 str-05)
		                    (cons 5 (strcat "пределы изм. " str-07 "%%dC"))
		                    (cons 6 (strcat "Lпогр. " str-08 "мм"))
		                    (cons 7 (strcat "диам. ЧЭ " str-09 "мм"))
		                    (cons 8 (strcat "крепление " str-12))
		                    (cons 9 (strcat "присоединение " str-15 " (наружн.)"))
		                    (cons 10 (strcat "степень защиты " str-17))
		                    (cons 11 (strcat "кабельный ввод " str-18))
		                    (cons 99 str-99)));setq
	
	);progn
);if

(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 pnt-ins str-01 str-02 str-04 str-05 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-702 nil
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
  (setvar "osmode" 0)
  
	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ТС-Б")
		(setq str-02 (cdr (assoc 2 str-tmp))
				  str-04 (cdr (assoc 4 str-tmp))
				  str-05 (cdr (assoc 5 str-tmp))
				  str-06 (cdr (assoc 6 str-tmp))
				  
		      str-701 (strcat "Термопреобразователь сопротивления " str-02 ", " str-04 ", " str-06)
		);setq
	);if

  (split-str-parts-le-01-general str-701 str-702 pnt-ins "*22*");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-1 str-02-2 str-03 str-04 str-05 str-05-1 str-06 str-06-2 str-07 str-08 str-09 str-10 str-13 str-15 str-17 
str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-09 (cdr (assoc 9 str-tmp))
						
						str-13 (cdr (assoc 13 str-tmp))
						
						str-15 (cdr (assoc 15 str-tmp))
						str-17 (cdr (assoc 17 str-tmp))
									
						nmbr-ln 10
			);setq
			
			(cond
				((= str-05 "х2") (setq str-05-1 "2-х проводная, 1 чувств. элемент"));=
				((= str-05 "х3") (setq str-05-1 "3-х проводная, 1 чувств. элемент"));=
				((= str-05 "х4") (setq str-05-1 "4-х проводная, 1 чувств. элемент"));=
				((= str-05 "2х2") (setq str-05-1 "2-х проводная, 2 чувств. элемент"));=
			);cond
				
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Термопреобразователь сопротивления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- НСХ " str-03 ", класс допуска " str-04 ", диапазон измерений " str-07 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- схема подключения " str-05-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "- исполнение монтажной части прямое")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- длина монтажной части " str-08 "мм, диаметр монтажной части " str-09 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "- неподвижный штуцер (НШ)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- длина наружной части " str-13 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- присоединение " str-15))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "- клеммная головка типа Ж")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ТС-Б-" str-03 "-" str-04 "-" str-05 "-П-(" str-07 ")-")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-08 "/" str-09 "-НШ." str-13 "." str-15 "-Ж-" str-17))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
							
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство об")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "утверждении СИ")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "BY.С.32.999.А")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "№ 19689")
		);progn
	);if	


	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-09 (cdr (assoc 9 str-tmp))
						str-10 (cdr (assoc 10 str-tmp))
						
						str-13 (cdr (assoc 13 str-tmp))
						
						str-15 (cdr (assoc 15 str-tmp))
									
						nmbr-ln 9
			);setq
			
			(cond
				((= str-05 "х2") (setq str-05-1 "2-х проводная, 1 чувств. элемент"));=
				((= str-05 "х3") (setq str-05-1 "3-х проводная, 1 чувств. элемент"));=
				((= str-05 "х4") (setq str-05-1 "4-х проводная, 1 чувств. элемент"));=
			);cond
				
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект термопреобразователей сопротивления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- НСХ " str-03 ", класс допуска " str-04 ", диапазон измерений " str-07 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- схема подключения " str-05-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "- исполнение монтажной части прямое")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- минимальная разность температур " str-10 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- длина монтажной части " str-08 "мм, диаметр монтажной части " str-09 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- подвижный штуцер (ПШ), длина наружной части " str-13 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- присоединение " str-15 ", клеммная головка типа Ж"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "КТС-Б-" str-03 "-" str-04 "-" str-05 "-П-" str-10 "-")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-08 "/" str-09 "-ПШ." str-13 "." str-15 "-Ж"))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "компл.")
				
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Госреестр СИ РФ")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "№ 43096-09")
		);progn
	);if	

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Гильза" str-01)
		(progn	
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= "ГЦР.103Н, для НШ" str-02) (setq str-02-1 "Гильза защитная (исполнение для неподвижного штуцера)" str-02-2 "ГЦР.103Н"))

  		);cond
			
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-02-1)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-08 "мм, давление до " str-03 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- резьба внешняя " str-04 ", резьба внутренняя " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- диаметр внешн. " str-06 "мм, диаметр внутр. " str-07 "мм"))		

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02-2 "-" str-04 "-" str-06 "/" str-07 "-" str-08)) ;Тип, марка, обозначение документа, опросного листа
		
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
		);progn
	);if


	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Бобышка" str-01)
		(progn	
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= "Прямая" str-02) (setq str-02-1 "прямая"))
				((= "Угловая" str-02) (setq str-02-1 "угловая"))
  		);cond
 
			(cond
				((= "Ст20" str-06) (setq str-06-2 str-03))
				((= "12Х18Н10Т" str-06) (setq str-06-2 (strcat str-03 " (" str-06 ")")))
  		);cond
			
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Бобышка " str-02-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-04 "мм, резьба внутренняя " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- материал " str-06))

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-06-2) ;Тип, марка, обозначение документа, опросного листа
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
		);progn
	);if



















	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ПОИНТ\", ")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Беларусь, г.Полоцк")	
		
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



