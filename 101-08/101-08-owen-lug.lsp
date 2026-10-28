;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// бобышки "овен"                                               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-owen-lug

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-900 list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq list-01 (list "П - Прямая"
      							"У - Угловая")
      							
			list-02 (list "1 - Для датчиков с приварным штуцером"
      							"2 - Для датчиков с подвижным штуцером")
      							
			list-03 (list "М20х1,5"
      							"G1/2")
      							
			list-04 (list "25" "40" "50" "60" "80")
			
			list-05 (list "1 - Сталь 20"
      							"2 - Сталь 12Х18Н10Т")
      							
      list-900 (list "Отверстие в трубе 18 мм. 1 - без выступа. 2 - с выступом (под шайбу для прибора давления).")						

			list-901 nil	
			list-902 nil
);setq

(if (< (setq dcl-id (load_dialog "dia-101-08-owen-lug.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_owen_lug" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "but1"
  (strcat "(but1-101-08-owen-lug)");strcat
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
	((= type-list "le") (le-101-08-owen-lug));=
	((= type-list "spcf") (spcf-101-08-owen-lug));=
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// формирование данных, заполнение поля "выбрано"               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-owen-lug

( / str-01 str-01-1 str-01-2 str-02 str-02-1 str-02-2 str-03 str-03-2 str-04 str-04-1 str-05 str-05-1 str-05-2 str-902 str-99 str-ord)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-01-1 (substr str-01 5)
			str-01-2 (substr str-01 1 1)

			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-02-1 (substr str-02 5)
			str-02-2 (substr str-02 1 1)
			
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-03-2 (substr str-03 2)
			
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
						
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
      str-05-1 (substr str-05 5)
			str-05-2 (substr str-05 1 1)	
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(if (= str-03 "М20х1,5")
	(setq str-03-2 "20х1,5");setq
	(setq str-03-2 str-03);setq
);if

(setq list-901 (vl-list* (strcat "Бобышка " str-01-1 "  " str-02-1 "  " str-03 "  Длина " str-04 "мм  " str-05-1) list-901)
			str-ord (strcat "Б." str-01-2 "." str-02-2 "." str-03-2 "." str-04 "." str-05-2)
);setq

(setq str-01-1 (strcase str-01-1 1)
			str-02-1 (strcase str-02-1 1)
			str-03 (strcat "присоединение " str-03 " (внутр.)")
			
			str-04-1 (strcat "длина " str-04 "мм")
			str-05-1 (vl-string-subst "сталь" "Сталь" str-05-1)
);setq

(cond	;масса
	((= str-04 "40") (setq str-99 "0,3"));=
	((= str-04 "60") (setq str-99 "0,4"));=
	((= str-04 "20") (setq str-99 "0,2"));=
	((= str-04 "25") (setq str-99 "0,2"));=
);cond

(setq str-902 (list (cons 1 str-01-1) (cons 2 str-02-1) (cons 3 str-03) (cons 4 str-04-1) (cons 5 str-05-1) (cons 6 str-ord) (cons 99 str-99))
			
			list-902 (vl-list* str-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в ПЭ                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-owen-lug

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				str-701 (strcat "Бобышка ОВЕН " str-06 ", " str-01 ", " str-04 ", " str-03 ", материал " str-05 ", " str-02)
	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
			
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-owen-lug

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
			
				str-701 "Бобышка"
	
				str-702 (list (cons 1 str-01)
											(cons 2 str-02)
											(cons 3 str-03)
											(cons 4 str-04)
											(cons 5 str-05));list
											
				str-order (list (cons 1 str-06) 
												(cons 2 "-") 
												(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
									);list
				
				str-unit "шт"
				
				str-manufact "ОВЕН, г. Москва"
				
				str-crtf nil 
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

