;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-mpti-manotom

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      counter 0
      list-01 (list "Манометр МПТИ кл. точн. 1" 
      							"Mановакуумметр МВПТИ кл. точн. 1")
      list-901 nil
      list-902 nil
);setq

(tmp-strt-101-01-press-sens-mpti-manotom)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-mpti-manotom.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_mpti_manotom" dcl-id))
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

(action_tile "txt-01"
  (strcat "(tmp-strt-101-01-press-sens-mpti-manotom)");strcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-01-press-sens-mpti-manotom)");strcat
);action_tile

;(action_tile "txt-03"
;  (strcat "(txt-03-101-01-press-sens-mpti-manotom)"
;  );strcat
;);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-press-sens-mpti-manotom)"
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

(if (= type-list "le") (tmp-le-101-01-press-sens-mpti-manotom));if

(if (= type-list "spcf") (tmp-spcf-101-01-press-sens-mpti-manotom));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-01-press-sens-mpti-manotom

()

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01));setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "Манометр МПТИ кл. точн. 1" str-01)
	(progn
		(setq list-02 (list "кПа" "МПа" "кгс/см2") 
					list-03 (list "0...60" "0...100" "0...160" "0...250" "0...400" "0...600")						
					list-04	(list "У2* (-50...+60 °С)" "Т2 (-50...+60 °С)")						
      		list-05 (list "Жидк., пар, газ*" "Кислород")
      		list-06 (list "М20х1,5*" "G1/2-BSP" "R1/2")
      		list-07 (list "Нет" "Да*") 
      		list-08 (list "Нет*" "АЭС Кл. б. 3")
      		list-09 (list "Да*" "Нет")
      		list-10 (list "ЦСМ" "Манотомь*")
      		list-11 (list "Нет*" "Да")
		);setq
	);progn
);if

(if (= "Mановакуумметр МВПТИ кл. точн. 1" str-01)
	(progn
		(setq list-02 (list "кПа" "МПа" "кгс/см2") 
					list-03 (list "-100...60" "-100...150" "-100...300" "-100...500")						
					list-04	(list "У2* (-50...+60 °С)" "Т2 (-50...+60 °С)")						
      		list-05 (list "Жидк., пар, газ*" "Кислород")
      		list-06 (list "М20х1,5*" "G1/2-BSP" "R1/2")
      		list-07 (list "Нет" "Да*") 
      		list-08 (list "Нет*" "АЭС Кл. б. 3")
      		list-09 (list "Да*" "Нет")
      		list-10 (list "ЦСМ" "Манотомь*")
      		list-11 (list "Нет*" "Да")
		);setq
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
(list-filling "txt-11" list-11)

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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-press-sens-mpti-manotom

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= "Манометр МПТИ кл. точн. 1" str-01)
	(cond
		((= "кПа" str-02) (setq list-03 (list "0...60" "0...100" "0...160" "0...250" "0...400" "0...600")));
		((= "МПа" str-02) (setq list-03 (list "0...1" "0...1,6" "0...2,5" "0...4" "0...6" "0...10" "0...16" "0...25" "0...40" "0...60")));
		((= "кгс/см2" str-02) (setq list-03 (list "0...0,6" "0...1" "0...1,6" "0...2,5" "0...4" "0...6" "0...10" "0...16" "0...25" "0...40" "0...60" "0...100" "0...160" "0...250" "0...400" "0...600")));
	);cond
);if

(if (= "Mановакуумметр МВПТИ кл. точн. 1" str-01)
	(cond
		((= "кПа" str-02) (setq list-03 (list "-100...60" "-100...150" "-100...300" "-100...500")));
		((= "МПа" str-02) (setq list-03 (list "-0,1...0,9" "-0,1...1,5" "-0,1...2,4")));
		((= "кгс/см2" str-02) (setq list-03 (list "-1...0,6" "-1...1,5" "-1...3" "-1...5" "-1...9" "-1...15" "-1...24")));
	);cond
);if

(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-01-press-sens-mpti-manotom

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-902 str-99 swtch)

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
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond ;масса
	((= str-01 "Манометр МПТИ кл. точн. 1") (setq str-99 "1,5"));=
	((= str-01 "Mановакуумметр МВПТИ кл. точн. 1") (setq str-99 "1,5"));=
	
);cond

(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
										(cons 10 str-10) (cons 11 str-11) (cons 99 str-99))
  		list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  		list-901 (vl-list* (strcat str-01 "  "
  															 str-03 str-02 "  "
  															 str-04 "  "
  															 str-05 "  "
  															 str-06 "  "
  															 "Черта " str-07 "  "
															 	 "АЭС " str-08 "  " 
																 "Номер " str-09 "  " 
																  str-10 "  "
																 "Пломба " str-11) list-901)
);setq


(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-press-sens-mpti-manotom

( / cntr-1 pnt-ins str-01 str-02 str-03 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
	);setq
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	(100-empt-lin-le)
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Манометр МПТИ кл. точн. 1" str-01)
		(setq str-txt (strcat "Манометр МПТИ, пределы изм. " str-03 str-02 ", класс точности 1")
					str-txt-01 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Mановакуумметр МВПТИ кл. точн. 1" str-01)
		(setq str-txt (strcat "Mановакуумметр МВПТИ, пределы изм. " str-03 str-02 ", класс точности 1")
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
(defun tmp-spcf-101-01-press-sens-mpti-manotom

( / cntr-1 dlt-y kol nmbr-ln pnt-ins str-01 str-02 str-03 str-03-02 str-04 str-04-02 str-05 str-05-01 str-05-02 str-06 str-07 str-08 str-08-01 str-08-02 str-09 str-10 
str-10-01 str-10-02 str-11 str-12 str-13 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-10 (cdr (assoc 10 str-tmp))
				str-11 (cdr (assoc 11 str-tmp))
				str-12 (cdr (assoc 12 str-tmp))
				str-13 (cdr (assoc 13 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

;	(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;	(getstring "\nPress Enter to continue...");Erase_DV
			
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
				nmbr-ln 3
				kol 1
	);setq
	
	
	
	
	
	
	
	
	(101-empt-lin-spcf)

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Манометр МПТИ кл. точн. 1" str-01)
		(progn
			(setq str-03-02 (substr str-03 5)
						str-04 (vl-string-subst "" "*" str-04)
						str-04-02 (substr str-04 1 (vl-string-search " " str-04 1)) 
			);setq

			(cond
				((= str-05 "Кислород") (setq str-05-01 (strcase str-05 1) str-05-02 "Кис-"));=
				((/= str-05 "Кислород") (setq str-05-01 "стандартная" str-05-02 ""));=
			);cond

			(setq str-06 (vl-string-subst "" "*" str-06));setq

			(cond
				((= str-08 "Нет*") (setq str-08-01 "не для АЭС" str-08-02 ""));=
				((= str-08 "АЭС Кл. б. 3") (setq str-08-01 "для поставки на АЭС, кл. б. 3" str-08-02 "АЭС Кл. б. 3-"));=
			);cond

			(cond
				((= str-10 "ЦСМ") (setq str-10-01 "государственной метрологической службой" str-10-02 "-ЦСМ"));=
				((= str-10 "Манотомь*") (setq str-10-01 "метрологической службой ОАО \"Манотомь\"" str-10-02 ""));=
			);cond

			(setq nmbr-ln 8
						kol 9
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Манометр точных измерений")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-04))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- пределы измерений " str-03 str-02 ", класс точности 1"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-08-01))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- измеряемая среда " str-05-01))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- в комплекте с демпфером, резьба штуцера " str-06))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- поверка " str-10-01))
			
			(if	(= str-07 "Да")
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 (strcat "- технологическая черта " str-04))
					(setq kol (1+ kol)
								nmbr-ln (1+ nmbr-ln)
					);setq
				);progn
			);if
			;



			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "МПТИ-" str-04-02 "-" str-03-02 "-" str-02 "-1-" )) ;Тип, марка, обозначение документа, опросного листа			
			(cond	
				((= str-08-02 "")	
					(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-05-02 str-08-02 "Д-" str-06 str-10-02))
				);=
				((/= str-08-02 "")	
					(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-05-02 str-08-02 "Д-"))
					(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-06 str-10-02))
				);=
			);cond
		);progn
	);if
	

	
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ОАО \"Манотомь\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Томск")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	;
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство об")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "утверждении средств")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "измерений №44076,")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "№26803-11 в")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "Государственном")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "реестре средств")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "измерений")
	
	
	
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
