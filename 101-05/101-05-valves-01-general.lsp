;/////// ************************************************************ //////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun c:101-05-valves-01-general

( / adoc dcl-id list-00 list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 
list-06 list-07 list-08 list-801 list-802 list-900 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-05-valves-01-general.txt" 3)

(setq list-00 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
      list-901 nil
      list-902 nil      
      str-01 "0"
);setq

(tmp-start-101-05-valves-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-05-valves-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
    (exit)
  );progn
);if

(if (not (new_dialog "dia_101_05_general" dcl-id))
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
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-99" "0")

(action_tile "txt-00"
  (strcat "(setq str-01 (get_tile \"txt-00\"))"
  				"(tmp-start-101-05-valves-01-general str-01)");srcat
);action_tile

(action_tile "txt-01"
  (strcat	"(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
          "(set_tile \"txt-08\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat	"(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
          "(set_tile \"txt-08\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat	"(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
          "(set_tile \"txt-08\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-05-valves-01-general)");strcat
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

(if (= type-list "le") 
  (tmp-le-101-05-valves-01-general)
);if

(if (= type-list "spcf") 
  (tmp-spcf-101-05-valves-01-general)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-05-valves-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file 
list-07-read-file list-08-read-file list-09-read-file list-900 list-900-dscr name-file num-flds)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 150)
);

(setq list-01 list-01-read-file
      list-02 list-02-read-file
      list-03 list-03-read-file
      list-04 list-04-read-file
      list-05 list-05-read-file
      list-06 list-06-read-file
      list-07 list-07-read-file
      list-08 list-08-read-file
      list-99 list-09-read-file
      list-900 list-900-dscr
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-05-valves-01-general

( / str-00 str-01 str-02 str-03 str-04 str-041 str-05 str-06 str-07 str-08 str-99 str-manufact tmp-str-902)

(if (/= list-901 nil) (setq list-902 (reverse list-902)));if

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
  	  str-01 (nth (atoi (get_tile "txt-01")) list-01)
      str-02 (nth (atoi (get_tile "txt-02")) list-02)
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
      str-04 (nth (atoi (get_tile "txt-04")) list-04)
      str-05 (nth (atoi (get_tile "txt-05")) list-05)
  	  str-06 (nth (atoi (get_tile "txt-06")) list-06)
  	  str-07 (nth (atoi (get_tile "txt-07")) list-07)
  	  str-08 (nth (atoi (get_tile "txt-08")) list-08)
  	  str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(cond
  ((= str-04 "Углерод. сталь") (setq str-041 "углерод. сталь")); =
  ((= str-04 "Нерж. сталь") (setq str-041 "нерж. сталь")); =
  ((= str-04 "ЛЦ40Сд") (setq str-041 "латунь")); =
  ((= str-04 "12Х18Н9Т") (setq str-041 "сталь 12Х18Н9Т")); =
  ((= str-04 "12Х18Н10Т") (setq str-041 "сталь 12Х18Н10Т")); =
  ((= str-04 "10Х17Н13М3Т") (setq str-041 "сталь 10Х17Н13М3Т")); =
  ((= str-04 "12Х1МФ") (setq str-041 "сталь 12Х1МФ")); =
);cond

(if (or (= str-00 "Блок вентилей, Гималаи")
        (= str-00 "Вентиль игольчатый, Гималаи"))
  (setq str-manufact "ООО НПП \"Гималаи\", г. Самара")
);if

(if (= str-00 "Вентиль игольчатый, Энал")
  (setq str-manufact "ЗАО \"Энал\", г. Москва")
);if

(if (= str-00 "Клапан запорный стальной, АМК")
  (progn
    (if (/= str-08 "Нет") (setq str-01 (strcat str-01 " (" str-08 ")")));if
    (setq str-manufact "ЗАО \"Алтайская Машиностроительная Компания\", г. Барнаул")
  );progn
);if

(if (or (= str-00 "Клапан запорный стальной, ПАЗ")
        (= str-00 "Кран трехходовый натяжной, ПАЗ")
        (= str-00 "Кран шаровой для манометра, ПАЗ"))
  (setq str-01 (strcat str-01 " (" str-08 ")")
        str-manufact "ОАО \"Пензенский арамтурный завод\", г. Пенза"
  );setq
);if

(if (= str-00 "Кран кнопочный для манометра, Раско")
  (setq str-01 (strcat str-01 " (" str-08 ")")
        str-manufact "ООО \"НПФ \"РАСКО\", г. Москва"
  );setq
);if

(if (= str-00 "Кран шаровой штуцерный, Гирас")
  (setq str-manufact "ООО \"Гирас\", г. Химки")
);if

;для диалога
(setq list-901 (vl-list* (strcat 
        str-01 "    "
        "Ду " str-07 "мм    "
        "Ру " str-05 "МПа    "
        "Траб. " str-06 "°С    "
        "Вход " str-02 "    "
        "Выход " str-03 "    "
        str-04 "    ") list-901)
);setq

	(cond
		((= (substr str-02 1 2) "М2") (setq str-02 (strcat "резьба " str-02)));=
		((= (substr str-02 1 2) "Св") (setq str-02 (vl-string-subst "под сварку" "Сварка" str-02)));=
		((= (substr str-02 1 2) "G1") (setq str-02 (strcat "резьба " str-02)));=
		((= (substr str-02 1 2) "G3") (setq str-02 (strcat "резьба " str-02)));=
		((= (substr str-02 1 2) "Rc") (setq str-02 (strcat "резьба " str-02)));=
	);cond
	
	(cond
		((= (substr str-03 1 2) "М2") (setq str-03 (strcat "резьба " str-03)));=
		((= (substr str-03 1 2) "М3") (setq str-03 (strcat "резьба " str-03)));=
		((= (substr str-03 1 2) "Св") (setq str-03 (vl-string-subst "под сварку" "Сварка" str-03)));=
		((= (substr str-03 1 2) "G1") (setq str-03 (strcat "резьба " str-03)));=
		((= (substr str-03 1 2) "G3") (setq str-03 (strcat "резьба " str-03)));=
		((= (substr str-03 1 2) "Rc") (setq str-03 (strcat "резьба " str-03)));=
	);cond

;для ПЭ, ПЦФ
(setq tmp-str-902 (list
        (cons 0 str-00) 
				(cons 1 str-01) 
				(cons 2 (strcat "вход " str-02))
				(cons 3 (strcat "выход " str-03))
				(cons 4 str-041) 
				(cons 5 (strcat "PN " str-05 "МПа"))
				(cons 6 (strcat "Траб. " str-06 "%%dС"))
				(cons 7 (strcat "DN " str-07 "мм"))
				(cons 8 str-manufact)
				(cons 99 str-99))
);setq

;			(cond
;				((/= str-01 "ВТ-5") (setq str-tmp-22 "ТУ3742-006-36868381-2005")); =
;			);cond

(setq list-902 (vl-list* tmp-str-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-05-valves-01-general

( / cntr-1 pnt-ins str-00 str-00-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0
      str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-00-1 (substr str-00 1 (vl-string-search "," str-00))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(setq str-701 (strcat str-00-1 " " str-01 ", " str-07 ", " str-05 ", " 
	                      str-06 ", " str-04 ", "  str-02 ", " str-03)
	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////

(defun tmp-spcf-101-05-valves-01-general

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-99 str-manufact 
str-note str-order str-tecreq str-tmp str-unit)

(setq cntr-1 0
      str-note nil
      str-unit "шт."
      str-tecreq nil;обозначение ТУ или НТД
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-701 (substr str-00 1 (vl-string-search "," str-00))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-manufact (cdr (assoc 8 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))	
	);setq

  (cond
		((= str-00 "Клапан запорный стальной, ПАЗ") (setq str-tecreq "ТУ 26-07-1418-97"));=
		((= str-00 "Кран трехходовый натяжной, ПАЗ") (setq str-tecreq "ТУ 26-07-1418-97"));=
	  ((= str-00 "Клапан запорный стальной, АМК") (setq str-tecreq "ТУ 3742-002-79315310-2007"));=  
	  ((= str-00 "Кран шаровой штуцерный, Гирас") (setq str-tecreq "ТУ26-07-1061-84"));=
	  ((= str-00 "Кран кнопочный для манометра, Раско") (setq str-tecreq "ТУ 4212-134-00227471-2009"));=
	);cond

	(setvar "osmode" 6199)
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
		
	;/////////////////////////////////////////////////////////////////////////////////////////////////
  (setq str-702 (list 
				  (cons 1 (strcat str-07 ", " str-05 ", " str-06 ", " str-04))
				  (cons 2 (strcat str-02 ", " str-03)));list
											
				str-order (list 
				  (cons 1 str-01) 
					(cons 2 "-") 
					(cons 3 str-tecreq));list
		);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
