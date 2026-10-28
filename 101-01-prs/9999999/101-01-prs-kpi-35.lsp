;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-kpi-35

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      counter 0
      list-01 (list "KPI 35")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-kpi-35)

(if (< (setq dcl-id (load_dialog "dia-101-kpi-35.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_kpi_35" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(action_tile "txt-05"
  (strcat "(txt-05-101-kpi-35)");strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-kpi-35)");strcat
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

(if (= type-list "le") (tmp-le-101-kpi-35));if

(if (= type-list "spcf") (tmp-spcf-101-kpi-35));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-kpi-35

( / str-01)

(if (= nil str-01) 
	(setq str-01 "KPI 35");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "KPI 35" str-01)
	(progn
		(setq list-02 (list "-0,2...8")
					list-03 (list "-0,02...0,8")
					list-04 (list "-20...800")
      		list-05 (list "0,4...1,5" "0,5...2")
      		list-06 (list "G1/4, наружняя")
      		list-07 (list "060-1217" "060-1219")
		);setq
	);progn
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-kpi-35

( / str-05)

(setq str-05 (get_tile "txt-05"));setq

(set_tile "txt-07" str-05)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-kpi-35

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-99 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond 
	((= str-01 "KPI 35") (setq str-99 "0,3"));=
);if =

(if (= str-01 "KPI 35")
	(setq list-901 (vl-list* (strcat "Реле давления " str-01 "  Диапазон настройки " str-02 "бар  Дифференциал " str-05 "бар  Артикул " str-07) list-901)
  	
		 		tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 99 str-99))
				list-902 (vl-list*  tmp-list-902 list-902)
	);setq
);if =

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-kpi-35

( / cntr-1 pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-5 str-tmp-7 str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")); setq
	
	(if (= "KPI 35" str-tmp-1)
		(setq str-txt (strcat "Реле давления Danfoss, KPI 35, артикул " str-tmp-7 ", диапазон" "настройки " str-tmp-2 "бар, дифференциал " str-tmp-5 "бар, "
													"присоединение G1/4, наружняя")		
					str-txt-01 nil
		);setq
	);if
	
	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-kpi-35

( / cntr-1 dlt-y kol nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	  		kol 1
	); setq
	
	(101-empt-lin-spcf)

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-tmp-1 "KPI 35")
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Датчик-реле давления"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- диапазон настройки " str-tmp-2 "бар, дифференциал " str-tmp-5 "бар"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- присоединение G1/4 (наружн.), температура окр. среды -40...+65%%dC"))

			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "KPI 35, артикул " str-tmp-7))

			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Danfoss, г. Москва")
		);progn
	);if

	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
