;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-mti-manometr

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      counter 0
      list-01 (list "Манометр" "Мановакуумметр")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-01-press-sens-mti-manometr)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-mti-manometr.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_mti" dcl-id))
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

(action_tile "txt-01"
  (strcat "(tmp-strt-101-01-press-sens-mti-manometr)");strcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-01-press-sens-mti-manometr)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-press-sens-mti-manometr)");strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-press-sens-mti-manometr)");strcat
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

(if (= type-list "le") (tmp-le-101-01-press-sens-mti-manometr));if

(if (= type-list "spcf") (tmp-spcf-101-01-press-sens-mti-manometr-mti));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-01-press-sens-mti-manometr

()

(if (= nil str-01) 
	(setq str-01 "Манометр");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "Манометр" str-01)
	(progn
		(setq list-02 (list "МТИ 1218" "МТИ 1216")
					list-03 (list "МПа" "кгс/см2")
					list-04 (list "0...0,06" "0...0,1" "0...0,16" "0...0,25" "0...0,4")
      		list-05 (list "Радиальное")
      		list-06 (list "IP40")
      		list-07 (list "1" "0,6")
      		list-08 (list "У3 (-45...+40 °С)")
      		list-09 (list "М20х1,5")
      		list-10 (list "Жидк., пар, газ" "Кислород" "Ацетилен")
		);setq
		
		(set_tile "ptxt-111" "")
		(set_tile "ptxt-121" "")
		(set_tile "ptxt-122" "")
		(set_tile "ptxt-131" "")
		(set_tile "ptxt-141" "")
		(set_tile "ptxt-151" "")
		(set_tile "ptxt-161" "")
		(set_tile "ptxt-171" "")
		(set_tile "ptxt-801" "")
	);progn
);if

(if (= "Мановакуумметр" str-01)
	(progn
		(setq list-02 (list "МТИ 1218")
					list-03 (list "МПа" "кгс/см2")
					list-04 (list "-0,1...0,06" "-0,1...0,15" "-0,1...0,3")
      		list-05 (list "Радиальное")
      		list-06 (list "IP40")
      		list-07 (list "1")
      		list-08 (list "У3 (-45...+40 °С)")
      		list-09 (list "М20х1,5")
      		list-10 (list "Вода" "Пар" "Газ природный" "Кислород" "Ацетилен")
		);setq
		(set_tile "ptxt-111" "")
		(set_tile "ptxt-121" "")
		(set_tile "ptxt-122" "")
		(set_tile "ptxt-131" "")
		(set_tile "ptxt-141" "")
		(set_tile "ptxt-151" "")
		(set_tile "ptxt-161" "")
		(set_tile "ptxt-171" "")
		(set_tile "ptxt-801" "")
	);progn
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

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-press-sens-mti-manometr

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= "Манометр" str-01)
	(if (= "МТИ 1218" str-02)
		(progn
			(setq list-03 (list "МПа" "кгс/см2")
						list-04 (list "0...0,06" "0...0,1" "0...0,16" "0...0,25" "0...0,4")
						list-06 (list "IP40")
						list-07 (list "1" "0,6")
						list-08 (list "У3 (-45...+40 °С)")
			);setq
			
			(list-filling "txt-03" list-03)
			(list-filling "txt-04" list-04)
			(list-filling "txt-06" list-06)
			(list-filling "txt-07" list-07)
			(list-filling "txt-08" list-08)

			(set_tile "txt-03" "0")
			(set_tile "txt-04" "0")
			(set_tile "txt-06" "0")
			(set_tile "txt-07" "0")
			(set_tile "txt-08" "0")
			(set_tile "txt-18" "0")
		);progn
	);if
);if

(if (= "Манометр" str-01)
	(if (= "МТИ 1216" str-02)
		(progn
			(setq list-03 (list "МПа" "кгс/см2")
						list-04 (list "0...0,6" "0...1" "0...1,6" "0...2,5")
						list-06 (list "IP40")
						list-07 (list "1" "0,6")
						list-08 (list "У3 (-45...+40 °С)")
			);setq
			
			(list-filling "txt-03" list-03)
			(list-filling "txt-04" list-04)
			(list-filling "txt-06" list-06)
			(list-filling "txt-07" list-07)
			(list-filling "txt-08" list-08)

			(set_tile "txt-03" "0")
			(set_tile "txt-04" "0")
			(set_tile "txt-06" "0")
			(set_tile "txt-07" "0")
			(set_tile "txt-08" "0")
		);progn
	);if
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-press-sens-mti-manometr

( / str-01 str-02 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (= "Манометр" str-01)
	(if (= "МТИ 1218" str-02)
		(cond
			((= "кгс/см2" str-03) (setq list-04 (list "0...0,6" "0...1" "0...1,6" "0...2,5" "0...4")));=
			((= "МПа" str-03) (setq list-04 (list "0...0,06" "0...0,1" "0...0,16" "0...0,25" "0...0,4")));=
		);cond
	);if
);if

(if (= "Манометр" str-01)
	(if (= "МТИ 1216" str-02)
		(cond
			((= "кгс/см2" str-03) (setq list-04 (list "0...6" "0...10" "0...16" "0...25")));=
			((= "МПа" str-03) (setq list-04 (list "0...0,6" "0...1" "0...1,6" "0...2,5")));=
		);cond
	);if
);if

(if (= "Мановакуумметр" str-01)
	(if (= "МТИ 1218" str-02)
		(cond
			((= "кгс/см2" str-03) (setq list-04 (list "-1...0,6" "-1...1,5" "-1...3")));=
			((= "МПа" str-03) (setq list-04 (list "-0,1...0,06" "-0,1...0,15" "-0,1...0,3")));=
		);cond
	);if
);if














(list-filling "txt-04" list-04)

(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-01-press-sens-mti-manometr

( / str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-18 str-902 str-99 swtch)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond ;масса
	((= str-02 "МТИ 1218") (setq str-99 "1,5"));=
	((= str-02 "МТИ 1216") (setq str-99 "1,5"));=
);cond

(if (= str-01 "Манометр")
	(progn
		(setq str-07 (nth (atoi (get_tile "txt-07")) list-07)
					str-08 (nth (atoi (get_tile "txt-08")) list-08)
					str-09 (nth (atoi (get_tile "txt-09")) list-09)
					str-10 (nth (atoi (get_tile "txt-10")) list-10)
		);setq
		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
												(cons 10 str-10) (cons 99 str-99))
  				list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  				list-901 (vl-list* (strcat str-02 "  "
  																 	 str-04 str-03 "  "
  																 	 "Расп. штуцера " str-05 "  " 
  																 	 str-06 "  "
  																   "Кл. точн. " str-07 "  "
  																   str-08 "  "
  																   str-09) list-901)
		);setq
	);progn
);if

(if (= str-01 "Мановакуумметр")
	(progn
		(setq str-07 (nth (atoi (get_tile "txt-07")) list-07)
					str-08 (nth (atoi (get_tile "txt-08")) list-08)
					str-09 (nth (atoi (get_tile "txt-09")) list-09)
					str-10 (nth (atoi (get_tile "txt-10")) list-10)
		);setq
		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
												(cons 10 str-10) (cons 99 str-99))
  				list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  				list-901 (vl-list* (strcat str-02 "  "
  																 	 str-04 str-03 "  "
  																 	 "Расп. штуцера " str-05 "  " 
  																 	 str-06 "  "
  																   "Кл. точн. " str-07 "  "
  																   str-08 "  "
  																   str-09) list-901)
		);setq
	);progn
);if

(if (= swtch nil) (setq list-902 (reverse list-902)));if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-press-sens-mti-manometr

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-11 str-tmp-2 str-tmp-21 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-11 nil
				str-tmp-21 nil
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
	
	(100-empt-lin-le)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Манометр" str-tmp-1)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 " " str-tmp-2 ", пределы изм. " str-tmp-4 str-tmp-3))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Мановакуумметр" str-tmp-1)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 " " str-tmp-2 ", пределы изм. " str-tmp-4 str-tmp-3))
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
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф  мпти             ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-01-press-sens-mti-manometr-mti

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-10 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-9 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-tmp-9 (cdr (assoc 9 str-tmp))
				str-tmp-10 (cdr (assoc 10 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 6);setq
			
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-1)
			
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- пределы измерений " str-tmp-4 str-tmp-3 ", класс точности " str-tmp-7))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- расположение штуцера радиальное, степень защиты " str-tmp-6))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- резьба присоединительного штуцера " str-tmp-9))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-tmp-8))
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-2 "-160-" str-tmp-4 str-tmp-3 "-" str-tmp-7 "-")) ;Тип, марка, обозначение документа, опросного листа
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ 25.05.1481-77")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ОАО \"Манометр\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Энгельс")
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "№1844-63 в")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Государственном")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "реестре средств")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "измерений")		

	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
