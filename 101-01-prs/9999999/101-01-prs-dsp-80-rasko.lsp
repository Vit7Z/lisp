;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-dsp-80-rasko

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      counter 0
      list-01 (list "ДСП-80В-РАСКО")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-dsp-80-rasko)

(if (< (setq dcl-id (load_dialog "dia-101-dsp-80-rasko.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_dsp_80_rasko" dcl-id))
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

(action_tile "txt-01"
  (strcat "(tmp-strt-101-dsp-80-rasko)");strcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-dsp-80-rasko)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-dsp-80-rasko)");strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-dsp-80-rasko)");strcat
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

(if (= type-list "le") (tmp-le-101-dsp-80-rasko));if

(if (= type-list "spcf") (tmp-spcf-101-dsp-80-rasko));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-dsp-80-rasko

( / str-01)

(if (= nil str-01) 
	(setq str-01 "ДСП-80В-РАСКО");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if


(if (= "ДСП-80В-РАСКО" str-01)
	(progn
		(setq list-01 (list "ДСП-80В-РАСКО")
					list-02 (list "0...1" "0...1,6" "0...2,5" "0...4" "0...6" "0...10" "0...16" "0...25" "0...40")
					list-03 (list "0,6" "1,0" "1,6")
					list-04 (list "1,5" "2,5" "4")
					list-05 (list "Нет" "Да")
					list-06 (list "Ниппель, наружний диаметр 8мм." "Комплект, М12х1,5, наружняя" "Комплект, М20х1,5, наружняя" "Комплект, G1/2-B, наружняя")
					list-07 (list "Нет" "УДПИ" "УДПИ42" "УДПИ42Ех")
					list-08 (list "ООО \"НПФ \"РАСКО\"")
		);setq

		(set_tile "ptxt-801" "УДПИ - устройство дистанционной передачи данных.")
		(set_tile "ptxt-802" "УДПИ - релейный выход.  УДПИ42 (УДПИ42Ех) выход релейный, 4мА (0), 20мА (1).")
	);progn
);if

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
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-dsp-80-rasko

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-dsp-80-rasko

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
(defun tmp-filling-fields-101-dsp-80-rasko

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-99 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond ;масса
	((= str-01 "ДСП-80В-РАСКО") (setq str-99 "1,1"));=
);cond

(if (= str-01 "ДСП-80В-РАСКО")
	(progn
		(setq str-07 (nth (atoi (get_tile "txt-07")) list-07));setq
  	(setq list-901 (vl-list* (strcat str-01 "  " 
  																	 "Перепад " str-03 "кПа  " 
  																	 "Давление "str-04 "МПа  " 
  																	 "Погрешность " str-04 "%  " 
  																	 "Кронштейн " str-05 "  "
  																	 str-06 "  "
  																	 "Передача данных " str-07) list-901)
  	);setq
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 99 str-99))
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
(defun tmp-le-101-dsp-80-rasko

( / cntr-1 pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-8 str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	(if (= 4 (vl-string-mismatch "ДСП-" str-tmp-1))
		(setq str-txt (strcat "Дифманометр " str-tmp-1 ", диапазон изм. " str-tmp-2 "кПа")
					str-txt-01 nil
		);setq
	);if

	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins);

	(setq cntr-1 (1+ cntr-1));setq
);repeat


(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-dsp-80-rasko

( / cntr-1 dlt-y kol nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-99 str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

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
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 4
				kol 1
	);setq
	
	(101-empt-lin-spcf)

	(if	(= 4 (vl-string-mismatch "ДСП-" str-tmp-1))
		(progn
			(setq kol 4);setq
	
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Дифманометр")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- диапазон измерений " str-tmp-2 "кПа, макс. давление " str-tmp-3 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- предел допускаемой основной погрешности " str-tmp-4 "%"))

			(if (= str-tmp-5 "Да")
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 (strcat "- в комплекте с монтажным кронштейном"));=
					(setq kol (1+ kol)
								nmbr-ln (1+ nmbr-ln)
					);setq
				);progn
			);if

			(cond
				((= str-tmp-4 "Ниппель диам. 8мм.") (setq str-tmp-4 "ниппель, наружный диаметр 8мм."));=
			);cond

			(setq str-txt (strcat str-tmp-1 ", " str-tmp-2 "кПа, макс. давление " str-tmp-3 "МПа"));setq
		);progn
	);if

	(split-str-parts-spcf-60-02 str-txt nil pnt-ins);

	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"НПФ \"РАСКО\",")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

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
