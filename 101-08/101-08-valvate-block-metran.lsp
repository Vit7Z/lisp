
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// клапанные блоки "прибор"                                     ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-valvate-block-metran

( / adoc dcl-id file-name file-open list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-901 list-902 path-file-open str-01 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq str-f 1
			str-01 nil
      list-01 (list "0104")
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-06 nil
			list-07 nil
			list-08 nil
			list-09 nil
			list-10 nil
			list-901 nil	
			list-902 nil	
			file-name nil
			file-open nil
			path-file-open nil
);setq

(start-101-08-valvate-block-metran)

(if (< (setq dcl-id (load_dialog "dia-101-08-valvate-block-metran.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_valvate_block_metran" dcl-id))
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

(action_tile "txt-01"
  (strcat "(start-101-08-valvate-block-metran)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-08-valvate-block-metran)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-08-valvate-block-metran)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-valvate-block-metran)"
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

(cond
	((= type-list "le") (le-101-08-valvate-block-metran));=
	((= type-list "spcf") (spcf-101-08-valvate-block-metran));=
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-08-valvate-block-metran

()

(if (= nil str-01) 
	(setq str-01 "0104");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond
	((= str-01 "0104")
		(progn
			(setq list-02 (list "Т Традиционный, \"фланец-фланец\"" "W Компактный, \"фланец-фланец\"")
						list-03 (list "3" "2" "5")
						list-04 (list "2 Нерж. сталь" "3 Hastelloy")
						list-05 (list "C М20х1,5, наружная" "B 1/2NPT, внутренняя" "D К1/2, внутренняя" "F Фланец")
						list-06 (list "1 Фторопласт (PTFE), фторопласт (PTFE), до 200°С" "2 Графит, графит, до 400°С")
						list-07 (list "1 Традиц. фланец" "2 Высокое давление")
						list-08 (list "VC Углерод. сталь" "VS Нерж. сталь")
						list-09 (list "D0 Ниппель, гайка М20х1,5, соединен. по наружн. диаметру 14"
						)
						list-10 (list "2 Сталь 316 SST" "3 Углерод. сталь" "5 Углерод. сталь 09Г2С")
						list-11 (list "L4 Болт SST, резьба М10")
						list-12 (list "Нет")
						list-13 (list "Нет" "H1 Дренажн. клапана")
			);setq
		);progn
	);=
);cond

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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-08-valvate-block-metran

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= str-01 "Серия А")
	(cond
		((= str-02 "3")
			(setq list-03 (list "0 (Без дренажа, без возможности подключ. метрологич. оборудования)" 
													"1 (Дренажные клапаны до изолирующего вентиля)"
													"2 (Дренажные клапаны после изолирующего вентиля)")
			);setq
		);=

		((= str-02 "5")
			(setq list-03 (list "1 (Дренажные клапаны до изолирующего вентиля)"
													"2 (Дренажные клапаны после изолирующего вентиля)")
			);setq
		);=
	);cond
);if


(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-08-valvate-block-metran

( / str-05)

(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
);setq

(cond
	((/= str-05 "АС (Для АЭС)") (setq list-09 (list "1603.000ТУ")));=
	((= str-05 "АС (Для АЭС)") (setq list-09 (list "1633.000ТУ")));=
);cond

(list-filling "txt-09" list-09)
(set_tile "txt-09" "0")
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// формирование данных, заполнение поля "выбрано"               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-valvate-block-metran

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-902 str-99 swtch)

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
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond	;масса
	((= str-01 "0104") (setq str-99 "1,5"));=

);cond

(if (= str-01 "0104")
	(progn
		;для диалога
		(setq list-901 (vl-list* (strcat str-01 "  "
																		 (vl-string-right-trim " " (substr str-02 1 (vl-string-search " " str-02))) "  "
																		 "Кол. вентилей " str-03 "  " 
																		 "Корпус " (substr str-04 3) "  "
																		 (substr str-05 3) "  "
																		 (substr str-06 3) "  "
																		 (substr str-07 3) "  "
																		 (substr str-08 1 2) "  "
																		 (substr str-09 1 2) "  "
																		 (substr str-10 1 2) "  "
																		 "Болт " (substr str-11 1 3) "  "
																		 "Гидр. схема " (substr str-12 1 3)
																		  ) list-901)  
																		  
		);setq

		
		;для пэ, зс
		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) (cons 10 str-10) (cons 11 str-11) 
												(cons 12 str-12) (cons 13 str-13) (cons 99 str-99))
					list-902 (vl-list* str-902 list-902)
		);setq
	);progn	
);if

(setq list-902 
	(cond
		((= swtch nil) (reverse list-902));=
		((/= swtch nil) (reverse list-902));=
	);cond
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в ПЭ                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-valvate-block-metran

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	); setq
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(if (= str-01 "0104")
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Клапанный блок \"Метран\", серия " str-01 ", количество вентилей " str-03))
			;(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
		);progn
	);if
	
	(setq cntr-1 (1+ cntr-1));setq
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	(setvar "osmode" 6199)
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-08-valvate-block-metran

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-021 str-022 str-03 str-04 str-041 str-042 str-05 str-051 str-052 str-06 str-061 str-062 str-07 str-071 str-072 str-08 str-081 
str-082 str-09 str-091 str-092 str-10 str-101 str-102 str-11 str-111 str-112 str-12 str-13 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	); setq
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	;обработка данных
	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "0104")
		(progn
			(cond	
				((= str-02 "Т Традиционный, \"фланец-фланец\"") (setq str-021 "традиционное, \"фланец-фланец\"" str-022 "T"));=
				((= str-02 "W Компактный, \"фланец-фланец\"") (setq str-021 "компактное, \"фланец-фланец\"" str-022 "W"));=
			);cond
	
			(cond	
				((= str-04 "2 Нерж. сталь") (setq str-041 "нержавеющая сталь" str-042 "2"));=
				((= str-04 "3 Hastelloy") (setq str-041 "Hastelloy" str-042 "3"));=
			);cond
	
			(cond	
				((= str-05 "C М20х1,5, наружная") (setq str-051 "резьба М20х1,5, наружная" str-052 "C"));=
				((= str-05 "B 1/2NPT, внутренняя") (setq str-051 "резьба 1/2NPT, внутренняя" str-052 "B"));=
				((= str-05 "D К1/2, внутренняя") (setq str-051 "резьба К1/2, внутренняя" str-052 "D"));=
				((= str-05 "F Фланец") (setq str-051 "фланцевое" str-052 "F"));=
			);cond
				
			(cond	
				((= str-06 "1 Фторопласт (PTFE), фторопласт (PTFE), до 200°С") (setq str-061 "фторопласт (PTFE), до 200%%dС" str-062 "1"));=
				((= str-06 "2 Графит, графит, до 400°С") (setq str-061 "графит, до 400%%dС" str-062 "2"));=
					
			);cond

			(cond	
				((= str-07 "1 Традиц. фланец") (setq str-071 "фторопласт (PTFE), до 200%%dС" str-072 "1"));=
				((= str-07 "2 Высокое давление") (setq str-071 "графит, до 400%%dС" str-072 "2"));=
					
			);cond

	
			(cond	
				((= str-08 "VC Углерод. сталь") (setq str-081 "из углеродистой стали, для крепления на трубе" str-082 "VC"));=
				((= str-08 "VS Нерж. сталь") (setq str-081 "из нержавеющей стали, для крепления на трубе" str-082 "VS"));=
					
			);cond

			(cond	
				((= str-09 "D0 Ниппель, гайка М20х1,5, соединен. по наружн. диаметру 14") 
					(setq str-091 "ниппель, гайка М20х1,5, соединен. по наружн. диаметру 14мм" 
								str-092 "D0"
					);setq
				);=
					
					
			);cond

			(cond	
				((= str-10 "2 Сталь 316 SST") (setq str-101 "сталь 316 SST" str-102 "2"));=
				((= str-10 "3 Углерод. сталь") (setq str-101 "углеродистая сталь" str-102 "3"));=
				((= str-10 "5 Углерод. сталь 09Г2С") (setq str-101 "углеродистая сталь 09Г2С" str-102 "5"));=
					
			);cond

			(cond	
				((= str-11 "L4 Болт SST, резьба М10") (setq str-111 "болт SST, резьба М10" str-112 "L4"));=
					
			);cond

			(setq nmbr-ln 11);setq
				
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Клапанный блок")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- исполнение " str-021))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- кол. вентилей " str-03))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- материал корпуса " str-041))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- присоединение к процессу " str-051))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- материал уплотнений " str-061))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- кронштейн " str-081))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- " str-091))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- материал монтажных частей " str-101))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- " str-111))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-01 "M " str-022 " " str-03 " " str-042 " " str-052 " " str-062 " " str-072 " " str-082 " " str-092)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-102 " " str-112))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "ТУ 3742-057-51453097-2009")
				
		);progn
	);if

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Промышленная группа")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "\"Метран\",")	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Челябинск")
	
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



